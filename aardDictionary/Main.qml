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

    actions:  [
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



    StartPage {
        id:    mainPage
        onSearched: {
            pageStack.push(searchPage);
        }
        visible: false
    }
    SearchPage {
        id: searchPage
    }

    PageStack {
        id:pageStack
        Component.onCompleted: push(mainPage)
    }
}


