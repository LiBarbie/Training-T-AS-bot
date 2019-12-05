// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

const { ActivityHandler, MessageFactory, CardFactory } = require('botbuilder');
const ResourceCard = require('./resources/resourcecard.js');

const { QnAMaker, LuisRecognizer } = require('botbuilder-ai');
const axios = require("axios");


class MyBot extends ActivityHandler {
    constructor(qnaConfiguration, qnaOptions,clientCosmoDB,luisRecognizer) {
        super();
        if (!qnaConfiguration) throw new Error('[QnaMakerBot]: Missin--g parameter. configuration is required');
        //now create a qnaMaker connector.
        this.qnaMaker = new QnAMaker(qnaConfiguration, qnaOptions);
        this.luisRecognizer = luisRecognizer;
        
        // See https://aka.ms/about-bot-activity-message to learn more about the message and other activity types.
        this.onMessage(async (context, next) => {
            // send user input to QnA Maker.
            const qnaResults = await this.qnaMaker.getAnswers(context);
            await context.sendActivity("Please wait ...");
            // If an answer was received from QnA Maker, send the answer back to the user.
            if (qnaResults[0] && qnaResults[0].score >= 0.70) {
                await context.sendActivity(qnaResults[0].answer+'');
            }//if
            else{
               // The question isn't a good match for QnA. Check Luis.ai
               if(luisRecognizer){
                    await this.actStep(context,luisRecognizer, clientCosmoDB);

                }//if
                else {
                    // If no answers were returned from QnA Maker nor Luis, reply with help.
                    await context.sendActivity("We couldn't find any answer to your question. Try write it in a different way.");
                }//else
            }//else
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
            'Available training resources?',
             'Latest internal courses catalogue?',
              'Updated internal courses calendar?',
              'Offer a technology training.',
              'Access SafariBooksOnline.',
              'Can\'t find the technology I want.',
              'Want to get certified in a technology/area.',
              'Get help to achieve certification by Everis.',
              'Be aware of specific IT events.',
              'Unsure about the starting learning path.'
            ],"Suggested Questions :");
        await turnContext.sendActivity(reply);
    }//sendSuggestedActions

    /*
        @param stepContext the context of the bot
        @param luisRecognizer the Luis object
        @param clientSQL the SQL connection
        @return the result of the Luis Query
    */
    async actStep(stepContext, luisRecognizer, clientCosmoDB){
        let resultSQL="", entities, result, query, container;

        //if he can't find an intent/entity it's undefined.
        try{
            result = await this.luisRecognizer.recognize(stepContext);
            entities = result.entities.Knowledge_Area ? result.entities.Knowledge_Area[0] : result.entities.Certification_Path[0];
            //switch the luis intents.
            switch (LuisRecognizer.topIntent(result)) {
                //the user asked for a certification
                case 'AskForCertification':
                   //send the query to the database
                   container = "certification"
                   query = "SELECT c.K_A_Name, c.C_P_Name, c.C_Name FROM "+container+" c where CONTAINS (c.K_A_Name, \""+entities+"\") or CONTAINS(c.C_P_Name, \""+entities+"\") or CONTAINS(c.C_Name, \""+entities+"\")"
                   result = this.queryContainer(clientCosmoDB, query, container);
                   await Promise.resolve(result).then(function(value) {
                       result= value;
                   });//resolve Promise
                   await stepContext.sendActivity(this.toStringCertifications(result));
                break;

                //the user asked who has a certain certification
                case 'AskForEmployee' :
                    //send the query to the database
                   container = "employee"
                   query = "SELECT DISTINCT e.Name, e.Surname FROM "+container+" e JOIN c IN e.certification where CONTAINS(c.C_Name, \""+entities+"\") or CONTAINS(c.C_P_Name, \""+entities+"\") or CONTAINS(c.K_A_Name, \""+entities+"\")"
                   result = this.queryContainer(clientCosmoDB, query, container);
                   await Promise.resolve(result).then(function(value) {
                       result= value;
                   });//resolve Promise
                   await stepContext.sendActivity(this.toStringEmployee(result));
                break;

                //the user asked for specific resources in O'Reilly / SafariBooksOnline
                case 'AskForResource' :
                    //what are the java resources in safaribooksonline?

                    const url = 
                    "https://learning.oreilly.com/api/v2/search/?query="+entities+"&sort=relevance&sort=average_rating&languages=en&topics="+entities+"&limit=3&fields=title&fields=authors&fields=cover_url&fields=web_url&facet_json=true" 
                    const getData = async url => {
                        try {
                            const response = await axios.get(url);
                            const data = response.data;
                            const result = data.results;

                            let titles=[], authors=[], covers=[], urls=[];
                            let infos=[];
                            
                            result.forEach(function(infos){
                                titles.push(infos.title);
                                authors.push("by "+infos.authors);
                                covers.push(infos.cover_url);
                                urls.push("https://learning.oreilly.com"+infos.web_url);
                            });

                            infos.push(titles);
                            infos.push(authors);
                            infos.push(covers);
                            infos.push(urls);

                            return infos;

                        }//try
                        catch (error) {
                            console.log(error);
                        }//catch
                    };//getData
                    
                    const promise = getData(url);
                    let info="";

                    await Promise.resolve(promise).then(function(value) {
                        info=value;
                    });//resolve Promise

                    await stepContext.sendActivity({attachments : [CardFactory.adaptiveCard(ResourceCard.createResourceCard(
                        info[0][0],info[0][1],info[0][2],info[1][0],info[1][1],info[1][2],info[2][0],info[2][1],info[2][2],info[3][0],info[3][1],info[3][2]
                    ))]});//SendActivity
                break;

                //found the Luis entity but no intent.
                default :
                    await stepContext.sendActivity("We couldn't find any answer to your question. Try write it in a different way.");
                break;
            }//switch
        }//try
        catch(e){
            await stepContext.sendActivity("We couldn't find any answer to your question. Try write it in a different way.");
        }//catch
    }//actStep

    /**
    * Query the container using CosmoDB
    */
    async queryContainer(cosmoClient, q, c) {
        // query 
        const querySpec = {
            query : q,
            parameters: []
        };
        const { resources } = await cosmoClient.database("tasdb").container(c).items.query(querySpec, {enableCrossPartitionQuery:true}).fetchAll();
        return resources;
    }//queryContainer 

    /*
        @param jsonObject the JSON Object sent by the SQL Database
        @return a string with the informations about certifications as results of the query.
    */
    toStringCertifications(jsonObject){
        //console.log(jsonObject);
        let s="";
        jsonObject.forEach(function(obj){
            s+="Knowledge Area : "+obj.K_A_Name+" - Certification Path : "+obj.C_P_Name+" - Certification : "+obj.C_Name+"\n\n";
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
            s+="Employee : "+obj.Name+" "+obj.Surname+"\n\n";
        });//foreach
        return s;
    }//toStringEmployee
}//myBot

module.exports.MyBot = MyBot;
