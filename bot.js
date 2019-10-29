// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

const { ActivityHandler, MessageFactory } = require('botbuilder');
const { QnAMaker, LuisRecognizer } = require('botbuilder-ai');

class MyBot extends ActivityHandler {
    constructor(configuration, qnaOptions,clientSQL,luisRecognizer) {
        super();
        if (!configuration) throw new Error('[QnaMakerBot]: Missin--g parameter. configuration is required');
        // now create a qnaMaker connector.
        this.qnaMaker = new QnAMaker(configuration, qnaOptions);
        this.luisRecognizer = luisRecognizer;
        
        // See https://aka.ms/about-bot-activity-message to learn more about the message and other activity types.
        this.onMessage(async (context, next) => {
            // send user input to QnA Maker.
            const qnaResults = await this.qnaMaker.getAnswers(context);
        
            // If an answer was received from QnA Maker, send the answer back to the user.

            if(luisRecognizer){
                await this.actStep(context,luisRecognizer, clientSQL);
            }//if
            else{
                if (qnaResults[0] && qnaResults[0].score >= 0.70) {
                    await context.sendActivity(qnaResults[0].answer);
                    //await context.sendActivity(qnaResults[0].answer+'');
                }//if
                else {
                    // If no answers were returned from QnA Maker, reply with help.
                    await context.sendActivity("We couldn't find any answer to your question. Try write it in a different way.");
                }//else
            }
            await this.sendSuggestedActions(context);
            await next();
        });//onMessage

        this.onMembersAdded(async (context, next) => {
            const membersAdded = context.activity.membersAdded;
            for (let cnt = 0; cnt < membersAdded.length; ++cnt) {
                if (membersAdded[cnt].id !== context.activity.recipient.id) {
                    await context.sendActivity('Welcome to the Training T&AS FAQ Bot. Ask me anything!');
                    await this.sendSuggestedActions(context);
                }//if
            }//for
            // By calling next() you ensure that the next BotHandler is run.
            await next();
        });//onMembersAdded

    }//constructor

    /*
        @param turnContext the context of the bot
        @return a MessageFactory object with suggested questions
    */
    async sendSuggestedActions(turnContext) {
        var reply = MessageFactory.suggestedActions([
            'Which are the available training resources?',
             'Where can I find the latest internal courses catalogue?',
              'Where can I find the updated internal courses calendar?',
              'I would like to offer a technology training myself to my colleagues.',
              'How can I access SafariBooksOnline platform?',
              'What can I do if I can\'t find the technology I want in the catalogue or calendar?',
              'I want to get certified in a technology/area of expertise.',
              'Does your company help economically with any certification I\'m interested in?',
              'Can I be aware of specific IT events happening around here?',
              'I\'m unsure about which learning path I should start with.',
              'Which are the Java certifications?',
              'Whom can I ask for SQL certifications?'
            ],"Just ask! If you're not sure about what to ask, you can choose one question here below.");
        await turnContext.sendActivity(reply);
    }//sendSuggestedActions

    async actStep(stepContext, luisRecognizer, clientSQL){
        let resultSQL="", entities, result;

        //if he can't find an intent/entity it's undefined.
        try{
        result = await this.luisRecognizer.recognize(stepContext);
        entities = result.entities.Certification_Path.toString() || result.entities.Knowledge_Area.toString();

        switch (LuisRecognizer.topIntent(result)) {
            case 'AskForCertification':
                //send the query to the database
                resultSQL = clientSQL.query("SELECT k_a.K_Area_Name, c_p.C_Path_Name, c.C_Name from certification as c join certification_path as c_p on c.ID_C_Path=c_p.ID_C_Path join knowledge_area as k_a on k_a.ID_K_Area=c_p.ID_K_Area where C_Path_Name='"+entities+"' or K_Area_Name='"+entities+"' or C_Name LIKE '%"+entities+"%'");
                await stepContext.sendActivity(this.toStringCertifications(resultSQL));
                break;

            case 'AskForEmployee' :
                //send the query to the database
                resultSQL = clientSQL.query("SELECT DISTINCT e.E_Name, e.E_Surname FROM certification_employee as c_e join certification as c on c.C_Name = c_e.C_Name join certification_path as c_p on c_p.ID_C_Path = c.ID_C_Path join knowledge_area as k_a on k_a.ID_K_Area = c_p.ID_K_Area join employee as e on e.ID_E = c_e.ID_E where c_p.C_Path_Name='"+entities+"' or k_a.K_Area_Name='"+entities+"' or c.C_Name LIKE '%"+entities+"%'");
                await stepContext.sendActivity(this.toStringEmployee(resultSQL));
                break;
            
            default : 
                await stepContext.sendActivity("We couldn't find any answer to your question. Try write it in a different way.");
                break;
        }//switch
        }//try
        catch(e){
            await stepContext.sendActivity("We couldn't find any answer to your question. Try write it in a different way.");
        }//catch
    }//actStep

    /*
        @param jsonObject the JSON Object sent by the SQL Database
        @return a string with the informations about certifications as results of the query.
    */
    toStringCertifications(jsonObject){
        //console.log(jsonObject);
        let s="";
        jsonObject.forEach(function(obj){
            s+="Knowledge Area : "+obj.K_Area_Name+" - Certification Path : "+obj.C_Path_Name+" - Certification : "+obj.C_Name+"\n\n";
        });//foreach
        return s;
    }//toStringCertifications

    /*
        @param jsonObject the JSON Object sent by the SQL Database
        @return a string with the informations about employees as results of the query.
    */
    toStringEmployee(jsonObject){
        //console.log(jsonObject);
        let s="";
        jsonObject.forEach(function(obj){
            s+="Employee : "+obj.E_Name+" "+obj.E_Surname+"\n\n";
        });//foreach
        return s;
    }//toStringEmployee

    /*
        @param mex the message sent by the user
        @return the message without symbols, excessive spaces, lower cased, ...
    */
    messageIntoArray(mex){
        const removes = [
            "?",",",".",";","!","\\","\"","(",")","'","#","@","%","=","^","+","-","_","*","[","]","{","}","&","|","<",">",":"
        ];
        //removes excessives spaces;
        mex = mex.trim().toLowerCase();
        //removes symbols so there will be just words
        removes.forEach(function(symbol){
            mex  = mex.replace(symbol,"");
        });//foreach
        return mex.split(' ');
    }//messageIntoArray

}//myBot

module.exports.MyBot = MyBot;
