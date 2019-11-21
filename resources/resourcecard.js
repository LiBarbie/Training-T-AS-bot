module.exports = {
    createResourceCard: function (title1,title2,title3,author1,author2,author3,img1,img2,img3,url1,url2,url3) {
        let resourceCard = {
            "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
            "type": "AdaptiveCard",
            "version": "1.0",
            "body": [
                {
                    "type": "Container",
                    "id" : "container1",
                    "items": [
                        {
                            "type": "ColumnSet",
                            "columns": [
                                {
                                    "type": "Column",
                                    "width": "stretch",
                                    "items": [
                                        {
                                            "type": "TextBlock",
                                            "text": title1,
                                            "id": "title1",
                                            "size": "medium"
                                        },
                                        {
                                            "type": "TextBlock",
                                            "text": author1,
                                            "id": "author1"
                                        },
                                        {
                                            "type": "ActionSet",
                                            "actions": [
                                                {
                                                    "type": "Action.OpenUrl",
                                                    "url" : url1,
                                                    "title": "Go to the Resource"
                                                }
                                            ]
                                        }
                                    ]
                                },
                                {
                                    "type": "Column",
                                    "items" : [],
                                    "width": "120px",
                                    "height": "stretch",
                                    "minHeight": "120px",
                                    "backgroundImage": img1
                                }
                            ]
                        }
                    ],
                    "spacing": "medium",
                    "separator": true
                },
                {
                    "type": "Container",
                    "id" : "container2",
                    "items": [
                        {
                            "type": "Container",
                            "items": [
                                {
                                    "type": "ColumnSet",
                                    "columns": [
                                        {
                                            "type": "Column",
                                            "width": "stretch",
                                            "items": [
                                                {
                                                    "type": "TextBlock",
                                                    "text": title2,
                                                    "id": "title2",
                                                    "size": "Medium"
                                                },
                                                {
                                                    "type": "TextBlock",
                                                    "text": author2,
                                                    "id": "author2"
                                                },
                                                {
                                                    "type": "ActionSet",
                                                    "actions": [
                                                        {
                                                            "type": "Action.OpenUrl",
                                                            "url" : url2,
                                                            "title": "Go to the Resource"
                                                        }
                                                    ]
                                                }
                                            ]
                                        },
                                        {
                                            "type": "Column",
                                            "items" : [],
                                            "width": "120px",
                                            "height": "stretch",
                                            "minHeight": "120px",
                                            "backgroundImage": img2
                                        }
                                    ]
                                }
                            ],
                            "spacing": "Medium"
                        }
                    ],
                    "spacing": "Medium",
                    "separator": true
                },
                {
                    "type": "Container",
                    "id" : "container3",
                    "items": [
                        {
                            "type": "ColumnSet",
                            "columns": [
                                {
                                    "type": "Column",
                                    "width": "stretch",
                                    "items": [
                                        {
                                            "type": "TextBlock",
                                            "text": title3,
                                            "id": "title3",
                                            "size": "Medium"
                                        },
                                        {
                                            "type": "TextBlock",
                                            "text": author3,
                                            "id": "author3"
                                        },
                                        {
                                            "type": "ActionSet",
                                            "actions": [
                                                {
                                                    "type": "Action.OpenUrl",
                                                    "url" : url3,
                                                    "title": "Go to the Resource"
                                                }
                                            ]
                                        }
                                    ]
                                },
                                {
                                    "type": "Column",
                                    "items" : [],
                                    "width": "120px",
                                    "height": "stretch",
                                    "minHeight": "120px",
                                    "backgroundImage": img3
                                }
                            ]
                        }
                    ],
                    "spacing": "Medium",
                    "separator": true
                }
            ]
        }
        return resourceCard;
    }
}