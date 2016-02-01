import QtQuick 2.0
import QtQuick.Window 2.0


// Button used in Phone
Rectangle {
    id: button

    property alias buttontext: maintext.text

    signal clicked

    width: 100
    height: 100
    border.color: "lightgray"
    radius: 6
    // Use gradient backround
    gradient: Gradient {
        GradientStop { id: g1; position: 0.0; color: "gray" }
        GradientStop { id: g2; position: 1.0; color: "black" }
    }

    Text {
       id: maintext
       anchors.centerIn: parent
       text: "Maintext"
       color: "white"
       font.pixelSize: button.height - 5
    }

    MouseArea {
        anchors.fill: parent
        onClicked: button.clicked()
    }

    // A key can be pressed or not pressed, and it can be toggled on/off
    states:
        State {
            name: "Pressed"
            when: clickRegion.pressed == true
            PropertyChanges { target: g1; color: "black" }
            PropertyChanges { target: g2; color: "gray" }
        }
}
