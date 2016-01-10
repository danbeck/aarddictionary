import QtQuick 2.4
import Ubuntu.Components 1.3

Rectangle {
    id: wrapper
    width: 80
    height: headerText.height + contentText.height + units.gu(2)
    //color: "white"
    color: wrapper.ListView.isCurrentItem ? "#dddddd" : "white"

    property string title
    property string summary

    anchors {
        left: parent.left
        right: parent.right
    }
    Column{
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        Text {
            id: headerText
            anchors.left: parent.left
            text: title
            color: wrapper.ListView.isCurrentItem ? "grey" : "#990000"
            wrapMode: Text.Wrap
            //font.weight: Font.Bold
            font.pixelSize: 26
        }
        Text {
            id: contentText
            anchors {
                left: parent.left
                right: parent.right
            }
            text: summary
            color: wrapper.ListView.isCurrentItem ? "grey" : "black"
            wrapMode: Text.WordWrap
        }
    }

}
