import QtQuick 2.0
import QtMultimedia 5.0
import QtQuick.Window 2.0
import "qrc:/home"
import "qrc:/home/Utils.js" as Utils

Item{
    id:item
    property string filename
    property real playHeadPos: 0
    Rectangle{
        id:listContainer
        width:parent.width/2
        height:parent.height-mediaButtons.height-toolBar.height*2
        x:parent.width/2 - 5
        anchors.bottom:mediaButtons.top
        color:"transparent"
        border.color:"#726464"
        border.width:1
        state:"front"
        states:[ State{
                name:"back"
                PropertyChanges {
                    target: listContainer
                    x:item.width
                }
            },State{
                name:"front"
                PropertyChanges{
                    target:listContainer
                    x:item.width/2 - 5
                }
            }]
        transitions: [
            Transition {
                from: "front"
                to: "back"
                NumberAnimation {property:"x";easing.type: Easing.OutBack;duration:1500 }
            },
            Transition {
                from: "back"
                to: "front"
                NumberAnimation{property:"x";easing.type: Easing.OutBack;duration:1500}
            }
        ]
        ListView{
            id:listMusic
            //spacing:1
            anchors.fill: parent
            model:usb
            delegate: TrackItem{
                id:track
                onClicked:{if(usb.isFolder(index)){
                        usb.mod ="file://" + filePath +"/"
                        console.log(usb.mod)
                    } else{
                        timer.running=true
                        mainMusic.song="file://" + filePath
                        console.log(mainMusic.song)
                        playpauseRec.icon="qrc:/Images/icon_pause.png"
                        musicPlay.play()
                        path=index
                        path=index
                    }
                }
            }
        }
        ScrollIndicator {
            id: scroller
            x: listContainer.width - scroller.width
            position: listMusic.visibleArea.yPosition
            zoom: listMusic.visibleArea.heightRatio
            shown: listMusic.moving
            height: listMusic.height
        }
    }

    Rectangle{
        id:leftRec
        width:parent.width/2 - 5
        height:listContainer.height
        anchors.left: parent.left
        anchors.bottom:mediaButtons.top
        color:"transparent"
        border.color:"transparent"
        border.width:1
        state:"front"
        states:[ State{
                name:"back"
                PropertyChanges {
                    target: leftRec
                    width:item.width
                }
            },State{
                name:"front"
                PropertyChanges{
                    target:leftRec
                    width:item.width/2 - 5
                }
            }]
        transitions: [
            Transition {
                from: "front"
                to: "back"
                NumberAnimation {property:"width";easing.type: Easing.OutBack;duration:1500 }
            },
            Transition {
                from: "back"
                to: "front"
                NumberAnimation{property:"width";easing.type: Easing.OutBack;duration:1500}
            }
        ]

        Image{
            id:musicImage
            source:"qrc:/Images/musc.jpg"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:parent.top
            anchors.topMargin: 50
        }

        Text{
            id:time
            color:"white"
            text:Utils.milliSecondsToString((positionIndicator.x*musicPlay.duration/(indicator.width-positionIndicator.width)))+"/"+Utils.milliSecondsToString(musicPlay.duration)
            anchors.verticalCenter: indicator.verticalCenter
            anchors.left:indicator.right
            anchors.leftMargin: 10
            font.pixelSize:indicator.height
        }

        Text{
            id:songName
            text:Utils.getName(musicPlay.source.toString())
            anchors.bottom: indicator.top
            anchors.left:indicator.left
            anchors.bottomMargin: 10
            font.pixelSize: 22
            color:"white"
        }
        Rectangle{
            id:fullScreen
            anchors.top: musicImage.bottom
            anchors.right:musicImage.right
            width:musicImage.width/3
            height:50
            color:"transparent"
            radius:10
            Image{
                anchors.fill: parent
                source:"qrc:/Images/fuulScreen.png"
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {parent.width=parent.width+50;fullScreen.border.color="black"}
                onExited: {parent.width=musicImage.width/3;fullScreen.border.color="transparent"}
                onClicked:{
                    if(leftRec.state==="front"){
                    leftRec.state="back"
                    listContainer.state="back"
                    }
                    else{
                        leftRec.state="front"
                        listContainer.state="front"
                    }
                }
            }
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
                leftMargin: 20
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
                    }
                    else
                        musicPlay.seek((playHeadPos*musicPlay.duration/(indicator.width-positionIndicator.width)))
                    if(musicPlay.position===musicPlay.duration){
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
            Image{
                id:positionIndicator
                source:"qrc:/Images/indicator.png"
                x:(indicator.width-positionIndicator.width)*(musicPlay.position/musicPlay.duration)
                MouseArea{
                    id:positionArea
                    anchors.fill: parent
                    drag.target: positionIndicator
                    drag.axis: "XAxis"
                    drag.minimumX: 0
                    drag.maximumX: indicator.width-positionIndicator.width
                    onPositionChanged:{
                        if(musicPlay.playbackState!==1){
                            musicPlay.seek((positionIndicator.x*musicPlay.duration/(indicator.width-positionIndicator.width)))
                        }
                        else
                            musicPlay.seek((positionIndicator.x*musicPlay.duration/(indicator.width-positionIndicator.width)))

                        if(musicPlay.position===musicPlay.duration){
                            if(usb.isFolder(path+1 )){
                                path=0
                            }
                            else if(path+1>=usb.count)
                                path=0
                            else
                                path=path+1
                            mainMusic.song=Utils.forwar()
                        }
                    }
                }
            }
        }
    }

    Rectangle{
        id:devices
        anchors.bottom: mediaButtons.top
        anchors.bottomMargin: 3
        anchors.left:mediaButtons.left
        width:mediaButtons.width/4.5
        height:parent.height/3.5
        radius:10
        visible: false
        //color:"transparent"
        border.color: "black"
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#626e6a"  }
            GradientStop {
                    position: 0.7
                    color: "#000000" }
            }
        MouseArea{
            anchors.fill:parent
            hoverEnabled: true
            onExited: devices.visible=false
        }

        Rectangle{
            id:cd
            height: parent.height/2
            radius:10
            width:parent.width/2
            color:"transparent"
            //border.color: "white"
            Image{
                source:"qrc:/Images/mp3_cd.png"
                fillMode: Image.PreserveAspectFit
                height:parent.height
                width:parent.width
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {parent.height=devices.height/1.5;parent.width=devices.width/1.5}
                onExited: {parent.height=devices.height/2;parent.width=devices.width/2}
            }
        }

        Rectangle{
            id:sD
            height: parent.height/2
            radius:10
            width:parent.width/2
            color:"transparent"
            anchors.right: parent.right
            Image{
                source:"qrc:/Images/sdCard.png"
                fillMode: Image.PreserveAspectFit
                height:parent.height
                width:parent.width
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {parent.height=devices.height/1.5;parent.width=devices.width/1.5}
                onExited: {parent.height=devices.height/2;parent.width=devices.width/2}
                onClicked: {usb.mod="file:///home/";mainMusic.type=true}
            }
        }

        Rectangle{
            id:flash
            height: parent.height/2
            radius:10
            width:parent.width
            color:"transparent"
            anchors.bottom:parent.bottom
            Image{
                source:"qrc:/Images/usb.png"
                fillMode: Image.PreserveAspectFit
                height:parent.height
                width:parent.width
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {parent.height=devices.height/1.5;parent.width=devices.width/1.5}
                onExited: {parent.height=devices.height/2;parent.width=devices.width}
                onClicked:{usb.mod="file:///media/";mainMusic.type=false}
            }
        }
    }

    Rectangle{
        id:mediaButtons
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
                id:deviceRec
                height:parent.height
                width:parent.width/14
                icon:"qrc:/Images/device.png"
                Behavior on icon{NumberAnimation{target:playListRec;property:"scale";duration:800;easing.type:Easing.OutBounce}}
            }
            Rectangle{
                height:parent.height-2
                width:1
                color:"#726464"
            }

            Button{
                id:playListRec
                height:parent.height
                width:parent.width/14
                icon:"qrc:/Images/playList.png"
                Behavior on icon{NumberAnimation{target:playListRec;property:"scale";duration:800;easing.type:Easing.OutBounce}}
                onButtunClicked:{
                    devices.visible=true
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
                icon:"qrc:/Images/icon_rr.png"
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
                icon:"qrc:/Images/icon_prev.png"
                onButtunClicked:{
                    if(path===0){
                        path=usb.count-1
                        while(usb.isFolder(path)){
                            path=path-1
                        }
                    }
                    else
                        path=path-1
                    mainMusic.song=Utils.rewind()
                    musicPlay.play()
                    playpauseRec.icon="qrc:/Images/icon_pause.png"
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
                icon:musicPlay.playbackState===1?"qrc:/Images/icon_pause.png":"qrc:/Images/icon_play.png"
                onButtunClicked:{
                    if(musicPlay.playbackState===1){
                        musicPlay.pause()
                        timer.running=false
                        playpauseRec.icon="qrc:/Images/icon_play.png"
                    }
                    else{
                        musicPlay.play()
                        timer.running=true
                        playpauseRec.icon="qrc:/Images/icon_pause.png"
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
                icon:"qrc:/Images/icon_next.png"
                onButtunClicked:{
                    if(usb.isFolder(path+1 )){
                        path=0
                    }
                    else if(path+1>=usb.count)
                        path=0
                    else
                        path=path+1
                    mainMusic.song=Utils.forwar()
                    musicPlay.play()
                    playpauseRec.icon="qrc:/Images/icon_pause.png"
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
                icon:"qrc:/Images/icon_ff.png"
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
