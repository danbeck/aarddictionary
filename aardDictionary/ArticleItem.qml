import QtQuick 2.0

Rectangle {
    id: wrapper
    width: 180
    height: headerText.height + contentText.height + units.gu(2)
    color: "white"
    Column{
        Text {
            id: headerText
            text: "Titel"
//            color: wrapper.ListView.isCurrentItem ? "grey" : "black"
            color: "black"
        }
        Text {
            id: contentText
            text: "hier kommt der Text"
//            color: wrapper.ListView.isCurrentItem ? "grey" : "black"
            color: wrapper.ListView.isCurrentItem ? "grey" : "black"
        }
    }

}
