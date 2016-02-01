import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles 1.1
import QtQuick.Window 2.0
import QtMultimedia 5.0
import "Utils.js" as Utils
import "qrc:/multimedia/"
ApplicationWindow {
    id: mainMusic
    width: Screen.width
    height: Screen.height
    property string song
    property real value:indicatorKnob.x/(niveau.width-indicatorKnob.width)
    property int path
    property bool type:true
    visible:true

    StackView{
        id:mainStackView
        anchors.fill: parent
        Image{
            id:background
            source:"qrc:/Images/background.jpg"
            fillMode: Image.PreserveAspectFit
            Timer{
                interval:1000;running:true;repeat:true
                onTriggered:{
                    timeId.text=Qt.formatDateTime(new Date(),"hh:mm AP")
                }
            }
            Timer{
                id:timer
                repeat:true
                interval:1000
                running:false
                onTriggered: {
                    if(musicPlay.position>=musicPlay.duration){
                        if(usb.isFolder(path+1 )){
                            path=0
                        }
                        else if(path+1>=usb.count)
                            path=0
                        else
                            path=path+1
                        mainMusic.song=Utils.forwar()
                        musicPlay.play()
                    }
                }
            }

            Rectangle{
                id:toolBar
                width:parent.width
                height:timeId.height+2
                color: "transparent"
                Rectangle{
                    height:1
                    width:parent.width
                    color:"#726464"
                    anchors.bottom: parent.bottom
                }

                Rectangle{
                    id:volume
                    height:toolBar.height
                    width:toolBar.width/22
                    anchors{
                        top:toolBar.top
                        right:weather.left
                    }
                    radius:5
                    color:"transparent"
                    Image{
                        source:"qrc:/Images/audio_volume_high.png"
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:volumeRec.state="haut"
                    }
                }

                Text{
                    id:timeId
                    anchors.top: parent.top
                    font.pixelSize: 30
                    style: Text.Raised
                    font.family: "Times New Roman"
                    color:"white"
                    x:toolBar.width/2-2*width

                }
                Rectangle{
                    id:retour
                    height:toolBar.height
                    width:toolBar.width/17
                    anchors{
                        top:toolBar.top
                        left:toolBar.left
                    }
                    visible:mainStackView.depth>1?true:false
                    radius:5
                    color:"transparent"
                    Image{
                        source:"qrc:/Images/2.png"
                        anchors.fill: retour
                        fillMode: Image.PreserveAspectFit
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:mainStackView.pop()
                    }
                }
                Rectangle{
                    id:connectivite
                    height:toolBar.height
                    width:toolBar.width/20
                    x:Screen.width-width
                    radius:5
                    color:"transparent"
                    Image{
                        source:"qrc:/Images/network_connection_w.png"
                        anchors.fill: connectivite
                        fillMode: Image.PreserveAspectFit
                    }
                }
                Text{
                    id:weather
                    text:"18°c"
                    anchors.right: connectivite.left
                    color:"white"
                    font.pixelSize: 30
                    style: Text.Raised
                    font.family: "Times New Roman"
                    height:toolBar.height
                }
            }

            Rectangle{
                id:volumeRec
                width:parent.width
                height:toolBar.height*2
                color:"black"
                Rectangle{
                    id:bottomBar
                    width:parent.width
                    height:1
     //               color:"#726464"
                    anchors.bottom: parent.bottom
                    //source:"qrc:/Images/toolbar.png"
                }
                MouseArea{
                    id:volumeArea
                    hoverEnabled: true
                    anchors.fill: parent
                    onExited: volumeRec.state="bas"
                    onEntered: volumeRec.state="haut"
                }
                Image{
                    id:mute
                    source:"qrc:/Images/audio_volume_muted.png"
                    anchors{
                        right:niveau.left
                        rightMargin: 10
                        verticalCenter: niveau.verticalCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {indicatorKnob.x=0
                            //mainView.value=value
                        }
                    }
                }
                Image{
                    id:loud
                    source:"qrc:/Images/audio_volume_high.png"
                    anchors{
                        left:niveau.right
                        leftMargin: 10
                        verticalCenter: niveau.verticalCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            indicatorKnob.x=niveau.width-indicatorKnob.width
                            //mainView.value=value
                        }
                    }
                }

                Rectangle{
                    id:niveau
                    width:parent.width/2
                    height:2
                    radius:2
                    color:"grey"
                    x:parent.width/6
                    y:parent.height/2
                    Rectangle {
                        radius: 10
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.right: indicatorKnob.right
                        anchors.left: parent.left
                        color: "red"
                    }
                    MouseArea{
                        id:indicatorArea
                        anchors.fill: niveau
                        acceptedButtons: Qt.LeftButton | Qt.RightButton
                        onClicked: {
                            indicatorKnob.x=indicatorArea.mouseX
                            //mainView.value=value
                            //value=indicatorKnob.x/(niveau.width-indicatorKnob.width)
                        }
                    }
                    Rectangle {
                        id: indicatorKnob
                        //source: "../TestView/Images/indicator.png"
                        width:1
                        height:4
                        x:(niveau.width-indicatorKnob.width)/2
                        anchors.verticalCenter: parent.verticalCenter
                        MouseArea {
                            anchors.fill: indicatorKnob
                            drag.target: indicatorKnob
                            drag.axis: "XAxis"
                            drag.minimumX: 0
                            drag.maximumX: niveau.width-indicatorKnob.width
                            //onPositionChanged: mainView.value=value
                        }
                    }
                }

                state:"bas"
                states: [
                    State {
                        name: "bas"
                        PropertyChanges {
                            target: volumeRec
                            y:-height
                        }
                    },
                    State{
                        name:"haut"
                        PropertyChanges{
                            target: volumeRec
                            y:0
                        }
                    }

                ]
                transitions: [
                    Transition {
                        from: "bas"
                        to: "haut"
                        NumberAnimation { properties: "y"; easing.type: Easing.InOutQuad;duration:800 }
                    },
                    Transition{
                        from:"haut"
                        to:"bas"
                        NumberAnimation { properties: "y"; easing.type: Easing.InOutQuad;duration: 800 }
                    }

                ]
            }
        }
        Audio{
            id:musicPlay
            source:song
            volume:value
        }
        MusicModel{id:usb}
        initialItem: NewItem{}
        delegate: StackViewDelegate {
            function transitionFinished(properties)
            {
                properties.exitItem.x = 0
                properties.exitItem.y = 0
            }

            pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "opacity"
                    from: 0
                    to: 1
                }
                ParallelAnimation{
                    PropertyAnimation {
                        target: exitItem
                        property: "x"
                        from: 0
                        to: exitItem.width
                        duration:500
                    }
                    PropertyAnimation {
                        target: exitItem
                        property: "y"
                        from: 0
                        to: exitItem.height
                        duration:500
                    }
                }
            }
            popTransition:StackViewTransition{
                PropertyAnimation{
                    target:exitItem
                    property:"opacity"
                    from:1
                    to:0
                    duration:500
                }
                PropertyAnimation{
                    target:enterItem
                    property:"opacity"
                    from:0
                    to:1
                    duration:800
                }
            }
        }
    }
}
