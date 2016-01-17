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
            id: articleList
            anchors.fill: parent

            model: articleModel
            width: units.gu(40)


            delegate:  Component {
                id: contactsDelegate
                ArticleItem{
                    title:name
                    summary: content
                    onItemClicked:     articleList.currentIndex = index;
                }
            }
        }
    }
}

