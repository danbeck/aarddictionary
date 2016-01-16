import QtQuick 2.0
import Ubuntu.Components 1.3
import AardDictionary 1.0

Page {
    title: i18n.tr("SearchPage")
    visible: true

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

    Column {
        spacing: units.gu(1)
        anchors {
            margins: units.gu(1)
            fill: parent
        }

        ListModel {
            id: articleModel
            ListElement { name: "Search1"; content: "ABC are the first three letters of the Latin script known as the alphabet."}
            ListElement { name: "Search2"; content: "An advocate is a type of professional person in several different legal systems and it is also a commonly used honorific for remarkable lawyers, such as in \"Adv. Sir Alberico Gentili\".An advocate is a type of professional person in several different legal systems and it is also a commonly used honorific for remarkable lawyers, such as in \"Adv. Sir Alberico Gentili\"." }
            ListElement { name: "Search3"; content: "Altruism or selflessness is the principle or practice of concern for the welfare of others. " }
            ListElement { name: "Search4"; content: "The avocado (Persea americana) is a tree native to Mexico." }
            ListElement { name: "Search5"; content: "The potato is a starchy, tuberous crop from the perennial nightshade Solanum tuberosum L." }
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

