import QtQuick 2.0
import "qrc:/home/Utils.js" as Utils

Item{
    id:container
    width: parent.width
    height:60

    property string type:"../Images/New/usb2.png"

    signal clicked

    Rectangle {
        id:rect
        width: parent.width - scroller.width
        height:parent.height
        color:"transparent"
        gradient: Gradient {
            GradientStop {
                position: 0
                color: item.newIndex === index
                      ? "#c03050" : "#626e6a"  }
            GradientStop {
                    position: 0.7
                    color: "#000000" }
            }
        //radius: 18
        border.width: 1
        border.color: "#c03050"
        Image {
            source:mainMusic.type===true?"qrc:/Images/sd.png":"qrc:/Images/usb2.png"
            fillMode: Image.PreserveAspectCrop
            anchors.right: parent.right
            width:rect.width/12
            height:parent.height
        }
        Text {
            id: name
            x: 30
            y: 10
            text: (index+1) + ". " + fileName
            font.bold: true; font.pixelSize: 18
            anchors.verticalCenter: parent.verticalCenter
            color: "#FFFFFF"
        }
    }
    MouseArea {
        id: itemMouse
        anchors.fill: parent
        hoverEnabled: true
        onEntered:{
            name.font.pixelSize=25;rect.width=parent.width}
        onExited: {name.font.pixelSize=18;rect.width=parent.width - scroller.width}
        onClicked:  container.clicked()
    }
    Rectangle {
        id:hover
        anchors.fill: parent
        color: "#11ffffff"
        visible: false
    }
}
