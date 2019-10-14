// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

const { ActivityHandler } = require('botbuilder');
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
            await next();
        });

        this.onMembersAdded(async (context, next) => {
            const membersAdded = context.activity.membersAdded;
            for (let cnt = 0; cnt < membersAdded.length; ++cnt) {
                if (membersAdded[cnt].id !== context.activity.recipient.id) {
                    await context.sendActivity('Hello and welcome!');
                }
            }
            // By calling next() you ensure that the next BotHandler is run.
            await next();
        });
    }
}

module.exports.MyBot = MyBot;
