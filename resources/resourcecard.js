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
                                            "size": "medium",
                                            "wrap": true,
                                            "color": "Accent"
                                        },
                                        {
                                            "type": "TextBlock",
                                            "text": author1,
                                            "id": "author1"
                                        }
                                    ],
                                    "selectAction": {
                                        "type": "Action.OpenUrl",
                                        "url": url1
                                    }
                                },
                                {
                                    "type": "Column",
                                    "items" : [],
                                    "width": "80px",
                                    "height": "stretch",
                                    "minHeight": "80px",
                                    "backgroundImage": img1,
                                    "selectAction": {
                                        "type": "Action.OpenUrl",
                                        "url": url1
                                    }
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
                                                    "size": "Medium",
                                                    "wrap": true,
                                                    "color": "Accent"
                                                },
                                                {
                                                    "type": "TextBlock",
                                                    "text": author2,
                                                    "id": "author2"
                                                }
                                            ],
                                            "selectAction": {
                                                "type": "Action.OpenUrl",
                                                "url": url2
                                            }
                                        },
                                        {
                                            "type": "Column",
                                            "items" : [],
                                            "width": "80px",
                                            "height": "stretch",
                                            "minHeight": "80px",
                                            "backgroundImage": img2,
                                            "selectAction": {
                                                "type": "Action.OpenUrl",
                                                "url": url2
                                            }
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
                                            "size": "Medium",
                                            "wrap": true,
                                            "color": "Accent"
                                        },
                                        {
                                            "type": "TextBlock",
                                            "text": author3,
                                            "id": "author3"
                                        }
                                    ],
                                    "selectAction": {
                                        "type": "Action.OpenUrl",
                                        "url": url3
                                    }
                                },
                                {
                                    "type": "Column",
                                    "items" : [],
                                    "width": "80px",
                                    "height": "stretch",
                                    "minHeight": "80px",
                                    "backgroundImage": img3,
                                    "selectAction": {
                                        "type": "Action.OpenUrl",
                                        "url": url3
                                    }
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