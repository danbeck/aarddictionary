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

    automaticOrientation: true

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
                    margins: units.gu(1)
                    fill: parent
                }

                ListModel {
                    id: articleModel
                    ListElement { name: "ABC"; content: "ABC are the first three letters of the Latin script known as the alphabet."}
                    ListElement { name: "Advocate"; content: "An advocate is a type of professional person in several different legal systems and it is also a commonly used honorific for remarkable lawyers, such as in \"Adv. Sir Alberico Gentili\".An advocate is a type of professional person in several different legal systems and it is also a commonly used honorific for remarkable lawyers, such as in \"Adv. Sir Alberico Gentili\"." }
                    ListElement { name: "Altruist"; content: "Altruism or selflessness is the principle or practice of concern for the welfare of others. " }
                    ListElement { name: "Advocado"; content: "The avocado (Persea americana) is a tree native to Mexico." }
                    ListElement { name: "Potato"; content: "The potato is a starchy, tuberous crop from the perennial nightshade Solanum tuberosum L." }
                }

                UbuntuListView {
                    anchors.fill: parent

                    model: articleModel
                    width: units.gu(40)

                    delegate:  Component {
                        id: contactsDelegate
                        ArticleItem{
                            title:name
                            summary: content
                        }
                    }
                }
            }
        }
    }
}

