import QtQuick 2.0
import Ubuntu.Components 1.3
import AardDictionary 1.0

Page {
    id: root
    title: i18n.tr("Aard Dictionaries")
    visible: false
    signal searched

    property list<Action> actionList:  [
        Action {
            id : search
            iconName: "search"
            text: "Search article"
            shortcut: "Ctrl+F"
            onTriggered: {
                console.log("search pressed");
                root.searched()

            }
        },
        Action {
            iconName: "settings"
            text: "Settings"
        }
    ]

    head.actions: actionList
    head.contents: TextField {
        width: parent.width
        placeholderText : i18n.tr("Search for article...")
    }

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
            ListElement { name: "Search1"; content: "Alphabet."}
            ListElement { name: "Search2"; content: "Commonly used honorific for remarkable lawyers, such as in \"Adv. Sir Alberico Gentili\".An advocate is a type of professional person in several different legal systems and it is also a commonly used honorific for remarkable lawyers, such as in \"Adv. Sir Alberico Gentili\"." }
            ListElement { name: "Search3"; content: "Altruism or selflessness " }
            ListElement { name: "Search4"; content: "Tree native to Mexico." }
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
//                    onItemClicked: console.log("Search page - clicked")
                }
            }
        }
    }
}

