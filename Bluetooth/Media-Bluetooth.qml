import QtQuick 2.0
import media.bluetooth 1.0

Item {

    Media{
        id:media
    }

    Image{
        id:bluetooth
        anchors.bottom: play.top
        anchors.centerIn: parent
        source:"qrc:/Images/Bluetooth.png"
        MouseArea{
            anchors.fill: parent
            onClicked: media.call()
        }
    }

    Image{
        id:play
        anchors.top:bluetooth.bottom
        anchors.horizontalCenter: bluetooth.horizontalCenter
        source:"qrc:/Images/icon_play.png"
        MouseArea{
            anchors.fill: parent
            onClicked:{
                if(media.etat() === 1){
                    media.pause()
                    play.source="qrc:/Images/icon_play.png"
                }
                else{
                    media.play()
                    play.source="qrc:/Images/icon_pause.png"
                }
            }
        }
    }

    Image{
        id:forward
        anchors.left: play.right
        anchors.leftMargin: 15
        anchors.top: play.top
        source:"qrc:/Images/icon_next.png"
        MouseArea{
            anchors.fill: parent
            onClicked:media.next()
        }
    }

    Image{
        id:fastForward
        anchors.left: forward.right
        anchors.leftMargin: 15
        anchors.top: play.top
        source:"qrc:/Images/icon_ff.png"
        MouseArea{
            anchors.fill: parent
            onClicked:media.fastForward()
        }
    }

    Image{
        id:prev
        anchors.right: play.left
        anchors.rightMargin: 15
        anchors.top: play.top
        source:"qrc:/Images/icon_prev.png"
        MouseArea{
            anchors.fill: parent
            onClicked:media.prev()
        }
    }

    Image{
        id:rewind
        anchors.right: prev.left
        anchors.rightMargin: 15
        anchors.top: play.top
        source:"qrc:/Images/icon_rr.png"
        MouseArea{
            anchors.fill: parent
            onClicked:media.rewind()
        }
    }
}
