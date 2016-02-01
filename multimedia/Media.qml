import QtQuick 2.0
import QtQuick.Window 2.0
import QtMultimedia 5.0
import "../home"
Item{
    property string song

    Audio{
        id:musicPlay
        source: song
    }

    SingleItem{}

    Flipable{
        id:flipableMusic
        anchors.centerIn: parent
        width: parent.width/2
        height:parent.height*0.85
        property bool flipped: false
        front:ListView{
            id:listMusic
            width:parent.width-scroller.width
            height:parent.height
            model:usb
            delegate:TrackItem{
                onClicked:{if(usb.isFolder(index)){
                        usb.mod = filePath
                    } else{
                        //Utils.newIndex=index
                        //musicPlay.play()
                        flipableMusic.flipped=!flipableMusic.flipped
                        song=filePath
                        playpauseRec.icon="Images/icon_pause.png"
                        musicPlay.play()
                        mediaButtons.visible=true
                    }
                }
            }
        }
        MusicModel{id:usb}
        ScrollIndicator {
            id: scroller
            x: listMusic.width
            position: listMusic.visibleArea.yPosition
            zoom: listMusic.visibleArea.heightRatio
            shown: listMusic.moving
            height: flipableMusic.height
        }

        back:Rectangle{
            id:rec
            width:parent.width
            height:parent.height
            Image{
                id:trackPlaying
                source:"Images/music.jpg"
                fillMode:Image.PreserveAspectFit
                anchors.fill: parent
            }
        }
        transform: Rotation {
            id: rotation
            origin.x: flipableMusic.width/2
            origin.y: flipableMusic.height/2
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: 0
        }

        states: State {
            name: "back"
            PropertyChanges { target: rotation; angle: 180 }
            when: flipableMusic.flipped
        }

        transitions: Transition {
            NumberAnimation { target: rotation; property: "angle"; duration: 500 }
        }
    }

    Rectangle{
        id:mediaButtons
        visible:false
        width:Screen.width
        height:parent.height/15
        anchors.bottom: parent.bottom
        color:"transparent"
        Rectangle{
            id:topRec
            width:Screen.width
            height:1
            color:"#726464"
        }
        Row{
            width:parent.width
            height:parent.height

            Button{
                id:playListRec
                height:parent.height
                width:parent.width/14
                icon:"Images/playList.png"
                Behavior on icon{NumberAnimation{target:playListRec;property:"scale";duration:800;easing.type:Easing.OutBounce}}
                onButtunClicked:{

                }
            }
            Rectangle{
                height:parent.height-2
                width:1
                color:"#726464"
            }
            Button{
                id:prevRec
                width:parent.width/14
                height:parent.height
                icon:"Images/icon_prev.png"
                onButtunClicked:{

                }
            }
            Rectangle{
                height:parent.height-2
                width:1
                color:"#726464"
            }
            Button{
                id:playpauseRec
                width:parent.width/14
                height:parent.height
                icon:"Images/icon_play.png"
                onButtunClicked:{
                    if(musicPlay.playbackState===1){
                        musicPlay.pause()
                        playpauseRec.icon="Images/icon_play.png"
                    }
                    else{
                        musicPlay.play()
                        playpauseRec.icon="Images/icon_pause.png"
                    }

                }
            }
            Rectangle{
                height:parent.height-2
                width:1
                color:"#726464"
            }
            Button{
                id:nextRec
                width:parent.width/14
                height:parent.height
                icon:"Images/icon_next.png"
                onButtunClicked:{

                }
            }
            Rectangle{
                height:parent.height-2
                width:1
                color:"#726464"
            }
        }
    }
}
