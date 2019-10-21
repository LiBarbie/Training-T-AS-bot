// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

const { ActivityHandler, MessageFactory } = require('botbuilder');
const { QnAMaker } = require('botbuilder-ai');

class MyBot extends ActivityHandler {
    constructor(configuration, qnaOptions) {
        super();
        if (!configuration) throw new Error('[QnaMakerBot]: Missing parameter. configuration is required');
        // now create a qnaMaker connector.
        this.qnaMaker = new QnAMaker(configuration, qnaOptions);
        
        // See https://aka.ms/about-bot-activity-message to learn more about the message and other activity types.
        this.onMessage(async (context, next) => {
            // send user input to QnA Maker.
            const qnaResults = await this.qnaMaker.getAnswers(context);
        
            // If an answer was received from QnA Maker, send the answer back to the user.
            if (qnaResults[0]) {
                await context.sendActivity(qnaResults[0].answer+'');
            }
            else {
                // If no answers were returned from QnA Maker, reply with help.
                await context.sendActivity("We couldn't find any answer to your question. Try write it in a different way.");
            }
            await this.sendSuggestedActions(context);
            await next();
        });

        this.onMembersAdded(async (context, next) => {
            const membersAdded = context.activity.membersAdded;
            for (let cnt = 0; cnt < membersAdded.length; ++cnt) {
                if (membersAdded[cnt].id !== context.activity.recipient.id) {
                    await context.sendActivity('Welcome to the Training T&AS FAQ Bot. Ask me anything!');
                    await this.sendSuggestedActions(context);
                }
            }
            // By calling next() you ensure that the next BotHandler is run.
            await next();
        });
        
    
    }

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
              'I\'m unsure about which learning path I should start with.'
            ],"Just ask! If you're not sure about what to ask, you can choose one question here below.");
        await turnContext.sendActivity(reply);
    }
}

module.exports.MyBot = MyBot;
