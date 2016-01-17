import QtQuick 2.4
import Ubuntu.Components 1.3

Rectangle {
    id: root
    width: 80
    //    height: headerText.height + contentText.height + units.gu(2)
    height: units.gu(12)
    //color: "white"
    color: root.ListView.isCurrentItem ? "#eaeaea" : "white"
    //border.color: "black"

    property string title
    property string summary
    signal itemClicked

    anchors {
        left: parent.left
        right: parent.right
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.itemClicked()
    }
    Column{
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }


        //        UbuntuShape {
        //            color: "black"
        //            image: Image {
        //                source: "../images/Wikipedia-logo.png"
        //            }
        //        }
        Text {
            id: headerText
            anchors.left: parent.left
            text: title
            //            color: root.ListView.isCurrentItem ? "grey" : "#990000"
            color: "#990000"
            wrapMode: Text.Wrap
            //            font.bold: true
            lineHeight: 1.3
            font.pixelSize: 22
        }
        Text {
            id: contentText
            anchors {
                left: parent.left
                right: parent.right
            }
            text: summary.length> 120? summary.substring(0,120): summary + "..."
            color: "black"
            wrapMode: Text.WordWrap
            //            MouseArea {
            //                anchors.fill: parent
            //                onClicked: {
            //                    console.log("Description - clicked");
            //                    root.clicked();
            //                }
            //            }

        }
    }
}
