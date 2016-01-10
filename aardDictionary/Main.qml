import QtQuick 2.4
import QtQuick.XmlListModel 2.0
import Ubuntu.Components 1.3
import AardDictionary 1.0
import Ubuntu.Components.ListItems 1.3 as ListItem
/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "aarddictionary.danielbeck"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    // useDeprecatedToolbar: false

    width: units.gu(100)
    height: units.gu(75)

    AdaptivePageLayout {
        id: layout
        anchors.fill: parent
        primaryPage: mainPage

        layouts: [
            PageColumnsLayout {
                when: layout.width > units.gu(80)
                PageColumn {
                    minimumWidth: units.gu(30)
                    maximumWidth: units.gu(50)
                    preferredWidth: units.gu(40)
                }
                PageColumn {
                    fillWidth: true
                }
            },
            // configure single column mode so we can only size it to minimum 20 GU
            PageColumnsLayout {
                when: true
                PageColumn {
                    minimumWidth: units.gu(20)
                    fillWidth: true
                }
            }
        ]


        Page {
            id: mainPage
            title: i18n.tr("Aard Dictionaries")

            property list<Action> actionList:  [
                Action {
                    iconName: "search"
                    text: "Search article"
                    shortcut: "Ctrl+F"
                    onTriggered: console.log("search pressed")
                },
                Action {
                    iconName: "settings"
                    text: "Settings"
                }
            ]

            head.actions: actionList

            MyType {
                id: myType

                Component.onCompleted: {
                    myType.helloWorld = i18n.tr("Hello world..")
                }
            }

            Column {
                spacing: units.gu(1)
                anchors {
                    margins: units.gu(2)
                    fill: parent
                }

                ListModel {
                    id: groupedModel
                    ListElement { name: "Orange"; type: "Fruit"}
                    ListElement { name: "Apple"; type: "Fruit" }
                    ListElement { name: "Tomato"; type: "Fruit" }
                    ListElement { name: "Carrot"; type: "Vegetable" }
                    ListElement { name: "Potato"; type: "Vegetable" }
                }

                // ListItemsSection {
                //     title: i18n.tr("Standard")
                //     className: "Standard"
                //     delegate: ListItem.Standard {
                //         text: i18n.tr("Label")
                //     }
                // }


                ListItem.Subtitled {
                    text: "abc"
                    subText: "ABC are the first characters of the alphabet."
                    showDivider: false
                    iconName: "search"
                    //                    progression: true

                }

                //                ListItem.Subtitled {
                //                    text: "ABC"
                //                    subText: "ABC are the first characters of the alphabet."
                //                    showDivider: false
                //                }

                //                ListItem.Subtitled {
                //                    text: "Advocate"
                //                    subText: "HEre it coems. bli adfadsf dsf asdf.dsf ds fasdf.dsf ABC are the first characters of the alphabet."
                //                    showDivider: false
                //                }
                UbuntuListView {

                    anchors { left: parent.left; right: parent.right }

                    height: units.gu(24)
                    model: XmlListModel {
                        source: "http://feeds.reuters.com/reuters/topNews"
                        query: "/rss/channel/item"
                        XmlRole { name: "title"; query: "title/string()" }
                    }
                    width: units.gu(40)
                    // let refresh control know when the refresh gets completed
                    pullToRefresh {
                        refreshing: model.status === XmlListModel.Loading
                        onRefresh: model.reload()
                    }
                    delegate:  Component {
                        id: contactsDelegate
                        ArticleItem{ }
                    }

                    //                    delegate: ListItem.Standard {
                    //                        width: ListView.view.width
                    //                        height: units.gu(5)
                    //                        text: modelData
                    //                        onClicked: {
                    //                            ListView.view.model.reload();
                    //                        }
                    //                    }
                }


                //                ListView {
                //                    id: widgetList
                //                    height: 200
                //                    objectName: "widgetList"
                //                    interactive: false
                //                    delegate: Text {
                //                        text: name + ": " + number
                //                    }
                //                    //                    anchors.fill: parent
                //                    model:  ContactModel {}
                //                    //                    currentIndex: -1
                //                }

                //                Label {
                //                    id: label
                //                    objectName: "label"

                //                    text: myType.helloWorld
                //                }

                //                Button {
                //                    objectName: "button"
                //                    width: parent.width

                //                    text: i18n.tr("Tap me!")

                //                    onClicked: {
                //                        myType.helloWorld = i18n.tr("..from Cpp Backend")
                //                    }
                //                }
            }
        }
    }
}

