
import QtQuick 2.0
import QtQuick.Window 2.0
import QtWebKit 3.0
import QtQuick.Controls 1.3

Item {
    id: container

    property string text
    property string label
    property int pixelSize: 18
    property string color: "white"
    property alias backgroundColor: bg.color

    // Confirms changes made to the text
    function confirm(confirmValue) {
        if (confirmValue)
            container.text = confirmValue;
        else
            container.text = textEdit.text;
        textEdit.focus = false;
    }

    // Cancels any editing, and restores
    // old value to the text field
    function cancel() {
        textEdit.text = container.text;
        textEdit.focus = false;
    }

    height: textEdit.height

    // Handles events received from the
    // onscreen keyboard
    Connections {
       // target: document.properties.keyboard
        onTextEntered: {
            // Handle the event in this handler
            // if the input field is currently focused
            if (textEdit.activeFocus) {
                confirm(kbdText);
                document.properties.keyboard.show = false;
            }
        }
    }

    // Draw a background rectangle
    Rectangle {
       id : bg

       width: container.width-2
       height: container.height+10
       anchors.verticalCenter: parent.verticalCenter
       radius: 8
       color: "#323232"
       border.color: "#d5d5d5"
       border.width: 1
    }

    // Confirm button that accepts changes made in the input field
    Image {
        id: confirmIcon
        width: 22
        height: 22
        anchors.left: parent.left
        anchors.leftMargin: 4
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/Images/icon_ok.png"
        opacity: 0

        MouseArea {
            anchors.fill: parent
            onClicked: confirm()
        }
    }

    // Cancel button that discards editing
    Image {
        id: cancelIcon

        width: 22
        height: 22
        anchors.right: keyboardIcon.left
        anchors.rightMargin: 4
        anchors.verticalCenter: parent.verticalCenter
         source: "qrc:/Images/icon_cancel.png"
         opacity: 0

        MouseArea {
            anchors.fill: parent
            onClicked: cancel()
        }
    }

    // Button that opens onscreen keyboard
    Image {
        id: keyboardIcon

        width: 22
        height: 15
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/Images/icon_keyboard.png"
        opacity: 0

        MouseArea {
            anchors.fill: parent
            onClicked: {
                // When clicking, set default value for
                // the onscreen keyboard and display it
                document.properties.keyboard.label = container.label;
                document.properties.keyboard.initText = textEdit.text;
                document.properties.keyboard.show = true;
            }
        }
    }

    // Standard single line text input
    TextInput {
        id: textEdit

        text: container.text
        color: container.color
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: cancelIcon.left
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: container.pixelSize
        onAccepted: confirm()
        Keys.onEscapePressed: cancel()
    }

    // Label text providing information what information
    // to enter in the field
    Text {
        id: textLabel

        x: 5
        width: parent.width-10
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: "AlignHCenter"
        color: container.state == "editing" ? "#505050" : "#AAAAAA"
        font.pixelSize: container.pixelSize
        font.italic: true
        font.bold: true
        text: label
        opacity: textEdit.text == '' ? 1 : 0
    }

    // 'Editing' named state is entered when
    // textEdit component receives focus.
    // Icons are displayed, and text slightly re-aligned
    states:
        State {
            name: "editing"
            when: textEdit.activeFocus
            PropertyChanges {
                target: confirmIcon
                opacity: 1
            }
            PropertyChanges {
                target: keyboardIcon
                opacity: 1
            }
            PropertyChanges {
                target: cancelIcon
                opacity: 1
            }
            PropertyChanges {
                target: textEdit
                color: "white"
            }
            PropertyChanges {
                target: textEdit.anchors
                leftMargin: 34
            }
            PropertyChanges {
                target: textEdit.anchors
                rightMargin: 34
            }
        }

    transitions:
        Transition {
            to: "editing"
            reversible: true

            NumberAnimation {
                properties: "opacity,leftMargin,rightMargin"
                duration: 200
            }
        }
}
