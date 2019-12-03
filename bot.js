// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

const { ActivityHandler, MessageFactory, CardFactory } = require('botbuilder');
const ResourceCard = require('./resources/resourcecard.js');

const { QnAMaker, LuisRecognizer } = require('botbuilder-ai');
let async = require('async');
const axios = require("axios");

// The accessor names for the conversation flow and user profile state property accessors.
const CONVERSATION_FLOW_PROPERTY = 'CONVERSATION_FLOW_PROPERTY';

// Identifies the last question asked.
const question_certification = {
    certification_name : "certification_name",
    employee_number : "employee_number",
    issued_date : "issued_date",
    expired_date : "expired_date",
    issued_year : "issued_year",
    none : "none"
};

let infos_certification = {
    certification_name : "",
    employee_number : "",
    issued_date : "",
    expired_date : "",
    issued_year : ""
};

let notInDialog = true;

class MyBot extends ActivityHandler {
    constructor(qnaConfiguration, qnaOptions,clientCosmoDB,luisRecognizer,conversationState) {
        super();
        if (!qnaConfiguration) throw new Error('[QnaMakerBot]: Missin--g parameter. configuration is required');
        //now create a qnaMaker connector.
        this.qnaMaker = new QnAMaker(qnaConfiguration, qnaOptions);
        this.luisRecognizer = luisRecognizer;

        // The state property accessors for conversation flow and user profile.
        this.conversationFlow = conversationState.createProperty(CONVERSATION_FLOW_PROPERTY);

        // The state management objects for the conversation and user.
        this.conversationState = conversationState;

        // See https://aka.ms/about-bot-activity-message to learn more about the message and other activity types.
        this.onMessage(async (context, next) => {
            const flow = await this.conversationFlow.get(context, { lastQuestionAsked: question_certification.none });

            //the user isn't in the dialog flow to add a certification
            if(notInDialog){
                // send user input to QnA Maker.
                const qnaResults = await this.qnaMaker.getAnswers(context);
                await context.sendActivity("Please wait ...");
                // If an answer was received from QnA Maker, send the answer back to the user.
                if (qnaResults[0] && qnaResults[0].score >= 0.70) {
                    await context.sendActivity(qnaResults[0].answer+'');
                    await this.sendSuggestedActions(context);
                }//if
                else{
                // The question isn't a good match for QnA. Check Luis.ai
                    if(luisRecognizer){
                        const result = await this.actStep(context,luisRecognizer, clientCosmoDB);
                        if(result=="intodialogstate"){
                            notInDialog=false;
                            await MyBot.fillOutCertificationInfos(flow, context);
                        }//if
                        else{
                            await this.sendSuggestedActions(context);
                        }//else
                    }//if
                    else {
                        // If no answers were returned from QnA Maker nor Luis, reply with help.
                        await context.sendActivity("We couldn't find any answer to your question. Try write it in a different way.");
                        await this.sendSuggestedActions(context);
                    }//else
                }//else
            }//ifNotInDialog
            else{
                await MyBot.fillOutCertificationInfos(flow, context);
            }//if
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

        this.onDialog(async (context, next) => {
            // Save any state chang es. The load happened during the execution of the Dialog.
            await this.conversationState.saveChanges(context, false);

            // By calling next() you ensure that the next BotHandler is run.
            await next();
        });
    }//constructor

    // Manages the conversation flow for filling out the user's profile.
    static async fillOutCertificationInfos(flow, turnContext) {
        const input = turnContext.activity.text;
        
        //the user clicked cancel to cancel the entire operation
        if(input=="Cancel"){
            await turnContext.sendActivity("Operation Canceled");
            infos_certification = {};
            flow.lastQuestionAsked = question_certification.none;
            notInDialog = true;
            return 0;
        }//if

        switch (flow.lastQuestionAsked) {
            // If we're just starting off, we haven't asked the user for any information yet.
            // Ask the user for their name and update the conversation flag.
            case question_certification.none:
                await turnContext.sendActivity("Insert the Certification Name.");
                flow.lastQuestionAsked = question_certification.certification_name;
            break;

            // If we last asked for their name, record their response, confirm that we got it.
            // Ask them for their age and update the conversation flag.
            case question_certification.certification_name:
                infos_certification.certification_name = input;
                await turnContext.sendActivity('Insert the Employee Number.');
                flow.lastQuestionAsked = question_certification.employee_number;
            break;
                    
            case question_certification.employee_number:
                infos_certification.employee_number = input;
                await turnContext.sendActivity('Insert the Issued Date.');
                flow.lastQuestionAsked = question_certification.issued_date;
            break;

            // If we last asked for their age, record their response, confirm that we got it.
            // Ask them for their date preference and update the conversation flag.
            case question_certification.issued_date:
                    infos_certification.issued_date = input;
                    await turnContext.sendActivity('Insert the Expired Date.');
                    flow.lastQuestionAsked = question_certification.expired_date;
            break;

            // If we last asked for a date, record their response, confirm that we got it,
            // let them know the process is complete, and update the conversation flag.
            case question_certification.expired_date:
                infos_certification.expired_date = input;
                await turnContext.sendActivity('Insert the Issued Year.');
                flow.lastQuestionAsked = question_certification.issued_year;
            break;

            case question_certification.issued_year:
                infos_certification.issued_year = input;
                await turnContext.sendActivity('Please wait...');
                await turnContext.sendActivity(JSON.stringify(infos_certification)+"");
                infos_certification = {};
                flow.lastQuestionAsked = question_certification.none;
                notInDialog = true;
                return 0;
        }//switch
        var reply = MessageFactory.suggestedActions([
            'Cancel'
        ]);
        await turnContext.sendActivity(reply);
    }//fillOutCertificationInfos

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
              'Unsure about the starting learning path.',
              'Which are the Java certifications?',
              'Whom can I ask for SQL certifications?',
              'Avaiable Cobol resources in O\'Reilly?'
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
        let entities, result, query, container;

        //if he can't find an intent/entity it's undefined.
        try{
            result = await this.luisRecognizer.recognize(stepContext);
            entities = result.entities.Knowledge_Area ? result.entities.Knowledge_Area[0] : (result.entities.Certification_Path ? result.entities.Certification_Path[0] : "");
            //switch the luis intents.
            switch (LuisRecognizer.topIntent(result)) {
                case 'AddCertification' : 
                    return "intodialogstate"

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
