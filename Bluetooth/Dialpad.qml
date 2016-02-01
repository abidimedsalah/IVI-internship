import QtQuick 2.0
import QtQuick.Window 2.0
import ofono.bluetooth 1.0
import "qrc:/multimedia"
Item {

    Ofono{
        id:ofono
    }

    id: dialpad

    // Properties defining button dimensions and spacing
    property int buttonWidth: 55
    property int buttonHeight: 35
    property int spacing: 5
    property int numEntrySize: 16
    property alias dialnumber: maintext.text

    // Signals observers that calling has ended
    signal callEnded

    // Functions for adding and removing numbers
    // from the number entry
    function addNum(buttontext) {
        maintext.text += buttontext;
    }
    function delNum() {
        var len = maintext.text.length;
        if (len)
           maintext.text = maintext.text.substring(0, len-1);
    }

    Rectangle {
        id: background
        x:parent.width/2 -parent.height/22
        y:parent.height/2
        color: "black"
        border.color: "#f9a82e"
        border.width: 4
        width:555
        height: 330
        radius: 30
        opacity: 0.9
        Text {
            id: text1
            x: 154
            y: 33
            color: "#f6701b"
            text: qsTr("Composer Numero")
            font.bold: true
            font.pixelSize: 29
        }

        Image {
            id: image2
            x: 31
            y: 20
            width: 80
            height: 80
            source: "qrc:/Images/phone.png"
        }
    }

    Rectangle {
        id: test
        x:parent.width/20
        anchors.bottom: background.bottom
        color: "black"
        border.color: "#f9a82e"
        border.width: 4
        width:400
        height: 650
        //anchors.top: 10
        //   anchors.fill: parent
        radius: 30
        opacity: 0.9

        Text {
            id: text21
            x: 163
            y: 34
            color: "#f6701b"
            text: qsTr("Liste Contact")
            font.bold: true
            font.pixelSize: 29
        }

        Image {
            id: image1
            x: 44
            y: 18
            width: 80
            height: 80
            source: "../Images/Contacts-icon.png"

        }
        ListView{
            id:listMusic
            anchors.rightMargin: 0
            anchors.bottomMargin: -1
            anchors.leftMargin: 0
            anchors.topMargin: 1
            //spacing:1
            anchors.fill: parent
           // model:usb
            delegate: Text {
                id: name
                color: "#fbfae1"
                text: qsTr("text")

            }

        }
        ScrollIndicator {
            id: scroller
            x: scroller.width
            position: listMusic.visibleArea.yPosition
            zoom: listMusic.visibleArea.heightRatio
            shown: listMusic.moving
            height: listMusic.height
        }


    }
    // Center dial buttons into center of the screen by
    // grouping them within Item
    Item {
        id: dialButtons

        anchors.centerIn: background
        width: topButtons.width
        height: topButtons.height + numpad.height
        anchors.verticalCenterOffset: 27
        anchors.horizontalCenterOffset: 1

        // Add the number entry field and backspace button
        Row {
            id: topButtons
            spacing: dialpad.spacing

            Rectangle {
                id: maintextContainer
                radius: 5
                width: buttonWidth*3+dialpad.spacing*2
                height: buttonHeight
                Text {
                    id: maintext
                    x: 10
                    font.pixelSize: numEntrySize
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Button {
                id: backbutton
                width: buttonWidth
                height: buttonHeight
                buttontext: ""
                onClicked: delNum()

                // Use custom image (not text) for the backspace button
                Image {
                    anchors.centerIn: parent
                    source: "qrc:/Images/icon_backspace.png"
                }
            }
        }

        // Grid of numeric buttons
        Grid {
            id: numpad
            anchors.top: topButtons.bottom
            anchors.topMargin: spacing
            spacing: 5
            columns: 3
            Button { buttontext: "1"; width: buttonWidth; height: buttonHeight;
                onClicked: addNum(buttontext) }
            Button { buttontext: "2"; width: buttonWidth; height: buttonHeight;
                onClicked: addNum(buttontext) }
            Button { buttontext: "3"; width: buttonWidth; height: buttonHeight;
                onClicked: addNum(buttontext) }
            Button { buttontext: "4"; width: buttonWidth; height: buttonHeight;
                onClicked: addNum(buttontext) }
            Button { buttontext: "5"; width: buttonWidth; height: buttonHeight;
                onClicked: addNum(buttontext) }
            Button { buttontext: "6"; width: buttonWidth; height: buttonHeight;
                onClicked: addNum(buttontext) }
            Button { buttontext: "7"; width: buttonWidth; height: buttonHeight;
                onClicked: addNum(buttontext) }
            Button { buttontext: "8"; width: buttonWidth; height: buttonHeight;
                onClicked: addNum(buttontext) }
            Button { buttontext: "9"; width: buttonWidth; height: buttonHeight;
                onClicked: addNum(buttontext) }
            Button { buttontext: "*"; width: buttonWidth; height: buttonHeight;
                onClicked: addNum(buttontext) }
            Button { buttontext: "0"; width: buttonWidth; height: buttonHeight;
                onClicked: addNum(buttontext) }
            Button { buttontext: "#"; width: buttonWidth; height: buttonHeight;
                onClicked: addNum(buttontext) }
        }

        // Button for blinking 'calling' button
        // The button is translated to right when
        // calling starts
        DialButton {
            id: callStatus
            width: buttonWidth
            height: 3*buttonHeight + 2*spacing
            anchors.top: numpad.top
            x: numpad.x + numpad.width + spacing
            buttontext: "..."
            iconImage: "qrc:/Images/icons/icon_phone_green.png"
        }

        // Button for starting calling procedure.
        // The button is located over the call status button
        DialButton {
            id: callButton
            width: callStatus.width
            anchors.top: callStatus.top
            anchors.bottom: callStatus.bottom
            anchors.left: numpad.right
            anchors.leftMargin: spacing
            buttontext: "Call"
            iconImage: ".qrc:/Images/icon_phone_green.png"
            onClicked: {
                // When clicking the button,
                // calling is started or dropped
                if (ofono.call(maintext.text)===1 && dialpad.state === ""){
                    dialpad.state = "calling"
                }
                else {
                    ofono.cancel()
                    dialpad.state=""
                    maintext.text=""
                    dialpad.callEnded()
                }
            }
        }
    }


    // Defines a state for calling. In essence,
    // it means translating the call status icon to right
    // and start blinking it. Also the call icon
    // is changed to red 'Cancel' icon
    states:
        State {
            name: "calling"
            changes: [
                PropertyChanges {
                    target: callButton
                    buttontext: "Cancel"
                    iconImage: "qrc:/Images/icon_phone_red.png"
                },
                PropertyChanges {
                    target: callStatus
                    x: callButton.x + callButton.width + spacing
                },
                PropertyChanges {
                    target: callStatus
                    blink: true
                }
            ]
        }

    transitions:
        Transition {
            NumberAnimation {properties: "x"; duration: 200 }
        }
}
