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

        
        // Define the main dialog and its related components.
        this.choiceCardStep.bind(this);

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
                    await context.sendActivity('Welcome to the Training T&AS FAQ Bot. Ask me anything!');
                }
            }
            // By calling next() you ensure that the next BotHandler is run.
            await next();
        });
    }

    
    async choiceCardStep(stepContext) {
        console.log('MainDialog.choiceCardStep');

        // Create the PromptOptions which contain the prompt and re-prompt messages.
        // PromptOptions also contains the list of choices available to the user.
        const options = {
            prompt: "Don't you know what to ask? We suggest you what you could ask!",
            retryPrompt: 'That was not a valid choice, please select a card or number from 1 to 9.',
            choices: this.getChoices()
        };

        // Prompt the user with the configured PromptOptions.
        return await stepContext.prompt('cardPrompt', options);
    }

    getChoices() {
        const cardOptions = [
            {
                value: 'I am interested in learning more of an specific technology.',
                synonyms: ['Available training?']
            },
            {
                value: 'Where\'s the latest courses catalogue?',
                synonyms: ['Latest internal courses catalogue']
            },
            {
                value: 'Where can I find the updated internal courses calendar?',
                synonyms: ['Internal courses calendar?']
            },
            {
                value: 'I would like to offer a technology training myself to my colleagues.',
                synonyms: ['Offer training']
            },
            {
                value: 'How can I access SafariBooksOnline platform?',
                synonyms: ['SafariBooksOnline access']
            },
            {
                value: 'Can I be aware of specific IT events happening around here?',
                synonyms: ['Being aware of IT events here']
            },
            {
                value: 'I want to get certified in a technology/area of expertise.',
                synonyms: ['Get certificate of a technology']
            },
            {
                value: 'What to do if I can\'t find the technology I want in the catalogue or calendar',
                synonyms: ['Can\'t find the technology I\'m interested']
            },
            {
                value: 'Does everis helps economically with any certification I\'m interested in?',
                synonyms: ['I\'d like to receive an economic help for my certification']
            },
            {
                value : 'Where should I start training?',
                synonyms : ['Which path can you recommend for me?']
            }
        ];

        return cardOptions;
    }

}

module.exports.MyBot = MyBot;
