import QtQuick 2.0
import QtQuick.Window 2.0
import "qrc:/home/"

Rectangle {
    id: button

    property int textSize: 12
    property alias blink: iconAnimation.running
    property alias buttontext : iconText.text
    property alias iconImage : icon.source

    // Signal button observer that
    // the button has been clicked
    signal clicked

    width: 100
    height: 100
    border.color: "lightgray"
    radius: 5
    border.width: 1
    // Add gradient backround for the button
    gradient: Gradient {
        GradientStop { id: g1; position: 0.0; color: "gray" }
        GradientStop { id: g2; position: 1.0; color: "black" }
    }

    // Center icon and text in the
    // middle of the background
    Item {
        anchors.centerIn: parent
        width: parent.width
        height: icon.height + iconText.height

        // An image that flashes when blink == true
        Image {
            id: icon
            source: ""
            anchors.horizontalCenter: parent.horizontalCenter

            SequentialAnimation on opacity {
                id: iconAnimation
                running: false
                loops: Animation.Infinite
                NumberAnimation { from: 0; to: 1; duration: 300 }
                PauseAnimation { duration: 200 }
                NumberAnimation { from: 1; to: 0; duration: 300 }
            }
        }

        // Place text below the image
        Text {
            id: iconText
            text: ""
            color: "white"
            anchors.top: icon.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: textSize
        }
    }

    // When button is clicked, notify the button observer
    MouseArea {
        anchors.fill: parent
        onClicked: button.clicked()
    }
}
