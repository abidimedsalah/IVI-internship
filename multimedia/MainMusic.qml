import QtQuick 2.0
import QtMultimedia 5.0
import QtQuick.Window 2.0
import "Utils.js" as Utils

Item{
    id:item
    property real playHeadPos:0
    property int newIndex

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
            enabled: !parent.flipped
            spacing: 5
            model:usb
            delegate:TrackItem{
                onClicked:{if(usb.isFolder(index)){
                        usb.mod = filePath
                    } else{
                        timer.running=true
                        flipableMusic.state= "back"
                        flipableMusic.flipped=!flipableMusic.flipped
                        //Utils.song=filePath
                        mainMusic.song=filePath
                        playpauseRec.icon="../Images/icon_pause.png"
                        musicPlay.play()
                        mediaButtons.visible=true
                        Utils.newIndex=index
                        newIndex=index
                        console.log(Utils.newIndex)
                        //console.log(Utils.milliSecondsToMinutes((musicPlay.duration)-(musicPlay.position)))
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
            id:container
            property real playHeadPos: 0
            anchors.fill: parent
            color:"transparent"
            Text{
                id:time
                color:"white"
                text:Utils.milliSecondsToString((positionIndicator.x*musicPlay.duration/(indicator.width-positionIndicator.width)))+"/"+Utils.milliSecondsToString(musicPlay.duration)
                anchors.verticalCenter: indicator.verticalCenter
                anchors.left:indicator.right
                anchors.leftMargin: 10
                font.pixelSize:indicator.height
            }
            Image {
                id:musicImage
                source:"../Images/musc.jpg"
                anchors.bottom: indicator.top
                anchors.bottomMargin: 70
                anchors.left: indicator.left
                width:indicator.width+time.width+10
            }

            Rectangle{
                id:indicator
                width:parent.width*0.75
                height:positionIndicator.height
                color:"grey"
                radius:20
                anchors{
                    bottom: parent.bottom
                    left: parent.left
                    bottomMargin: 30
                    leftMargin: 50
                }
                Rectangle {
                    radius: 10
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.right: positionIndicator.right
                    anchors.left: parent.left
                    color: "#424242"
                }
                    MouseArea{
                        id:indicatorArea
                        anchors.fill: parent
                        onClicked: {
                            if(indicatorArea.mouseX>=indicator.width-positionIndicator.width)
                                playHeadPos=indicator.width-positionIndicator.width
                            else
                                playHeadPos=indicatorArea.mouseX
                            if(musicPlay.playbackState!==1){
                            musicPlay.seek((playHeadPos*musicPlay.duration/(indicator.width-positionIndicator.width)))
                            musicPlay.play()
                            }
                            else
                                musicPlay.seek((playHeadPos*musicPlay.duration/(indicator.width-positionIndicator.width)))
                            if(musicPlay.position===musicPlay.duration){
                                if(usb.isFolder(Utils.newIndex+1 )){
                                    Utils.newIndex=0
                                }
                                else if(Utils.newIndex+1>=usb.count)
                                    Utils.newIndex=0
                                else
                                    Utils.newIndex=Utils.newIndex+1
                                mainView.song=Utils.forwar()
                                musicPlay.play()
                            }
                        }
                    }
                    Timer{
                        id:timer
                        repeat:true
                        interval:1000
                        running:false
                        onTriggered: {
                            if(musicPlay.position>=musicPlay.duration){
                                if(usb.isFolder(Utils.newIndex+1 )){
                                    Utils.newIndex=0
                                }
                                else if(Utils.newIndex+1>=usb.count)
                                    Utils.newIndex=0
                                else
                                    Utils.newIndex=Utils.newIndex+1
                                mainMusic.song=Utils.forwar()
                                musicPlay.play()
                            }
                        }
                    }
                Image{
                    id:positionIndicator
                    source:"../Images/indicator.png"
                    x:(indicator.width-positionIndicator.width)*(musicPlay.position/musicPlay.duration)
                    MouseArea{
                        id:positionArea
                        anchors.fill: parent
                        drag.target: positionIndicator
                        drag.axis: "XAxis"
                        drag.minimumX: 0
                        drag.maximumX: indicator.width-positionIndicator.width
                        onPositionChanged:{
                            if(musicPlay.playbackState!=1){
                             musicPlay.seek((positionIndicator.x*musicPlay.duration/(indicator.width-positionIndicator.width)))
                            musicPlay.play()
                            }
                            else
                                 musicPlay.seek((positionIndicator.x*musicPlay.duration/(indicator.width-positionIndicator.width)))

                            if(musicPlay.position===musicPlay.duration){
                                if(usb.isFolder(Utils.newIndex+1 )){
                                    Utils.newIndex=0
                                }
                                else if(Utils.newIndex+1>=usb.count)
                                    Utils.newIndex=0
                                else
                                    Utils.newIndex=Utils.newIndex+1
                                mainMusic.song=Utils.forwar()
                                musicPlay.play()
                            }
                            }
                    }
                }
            }
        }

        transform: Rotation {
            id: rotation
            origin.x: flipableMusic.width/2
            origin.y: flipableMusic.height/2
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: 0
        }

        states:[ State {
                name: "back"
                PropertyChanges { target: rotation; angle: 180 }
            },
            State{
                name:"front"
                PropertyChanges { target: rotation; angle: 0 }
            }
        ]

        transitions: Transition {
            NumberAnimation { target: rotation; property: "angle"; duration: 500;easing.type: "InOutQuad" }
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
                icon:"../Images/playList.png"
                Behavior on icon{NumberAnimation{target:playListRec;property:"scale";duration:800;easing.type:Easing.OutBounce}}
                onButtunClicked:{
                    flipableMusic.flipped=!flipableMusic.flipped
                    flipableMusic.state="front"
                }
            }
            Rectangle{
                height:parent.height-2
                width:1
                color:"#726464"
            }

            Button{
                id:rrRec
                width:parent.width/14
                height:parent.height
                icon:"../Images/icon_rr.png"
                onButtunClicked:{
                    musicPlay.seek(musicPlay.position-1000)
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
                icon:"../Images/icon_prev.png"
                onButtunClicked:{
                    if(Utils.newIndex===0){
                        Utils.newIndex=usb.count-1
                        while(usb.isFolder(Utils.newIndex)){
                            Utils.newIndex=Utils.newIndex-1
                        }
                    }
                    else
                        Utils.newIndex=Utils.newIndex-1
                    mainMusic.song=Utils.rewind()
                    musicPlay.play()
                    playpauseRec.icon="../Images/icon_pause.png"
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
                icon:"../Images/icon_play.png"
                onButtunClicked:{
                    if(musicPlay.playbackState===1){
                        musicPlay.pause()
                        playpauseRec.icon="../Images/icon_play.png"
                    }
                    else{
                        musicPlay.play()
                        playpauseRec.icon="../Images/icon_pause.png"
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
                icon:"../Images/icon_next.png"
                onButtunClicked:{
                    if(usb.isFolder(Utils.newIndex+1 )){
                        Utils.newIndex=0
                    }
                    else if(Utils.newIndex+1>=usb.count)
                        Utils.newIndex=0
                    else
                        Utils.newIndex=Utils.newIndex+1
                    mainMusic.song=Utils.forwar()
                    musicPlay.play()
                    playpauseRec.icon="../Images/icon_pause.png"
                }
            }

            Rectangle{
                height:parent.height-2
                width:1
                color:"#726464"
            }

            Button{
                id:ffRec
                width:parent.width/14
                height:parent.height
                icon:"../Images/icon_ff.png"
                onButtunClicked:{
                    musicPlay.seek(musicPlay.position+1000)
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
