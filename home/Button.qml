import QtQuick 2.0

Rectangle {
    id:button
    width: height
    height: parent.height
    color:"transparent"

    property string icon
    property string mouseClicked
    signal buttunClicked
//  signal buttonHovered

    Image{
        id:playRec
        source:button.icon
        anchors.centerIn: parent
    }
    MouseArea{
        id:playMouseArea
        anchors.fill:button
        onClicked: buttunClicked()
        //onEntered: buttonHovered()
        onPressed: mouseClicked="pressed"
        onReleased: mouseClicked="released"
    }
    Rectangle {
        anchors.fill: parent
        color: "#11ffffff"
        visible: playMouseArea.pressed
    }
}
