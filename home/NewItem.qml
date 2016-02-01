import QtQuick 2.0
import "Utils.js" as Utils

Item{
    Rectangle {
        id:verRec
        width: 1
        height: parent.height-toolBar.height
        anchors.top:parent.top
        anchors.topMargin: toolBar.height
        x:parent.width/3
        color: "#726464"
    }
    Rectangle {
        id:middleRec
        width: parent.width*2/3
        height:1
        y:parent.height/2.5
        color: "#726464"
        anchors.right:parent.right
    }
    Rectangle{
        id:musicRec
        width:parent.width*2/3
        height:parent.height-toolBar.height
        anchors.top:middleRec.bottom
        anchors.topMargin: 30
        anchors.right: parent.right
        color:"transparent"
        Image{
            id:musicImage
            source:"qrc:/Images/musc.jpg"
            width:parent.width/2
            height:parent.height/3
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text{
            id:songName
            text:Utils.getName(musicPlay.source.toString())
            anchors.bottom: buttons.top
            anchors.left:musicImage.left
            anchors.bottomMargin: 10
            font.pixelSize: 22
            color:"white"
        }
        Rectangle{
            id:buttons
            anchors.top: musicImage.bottom
            anchors.topMargin: 40
            anchors.left:musicImage.left
            radius:20
            color:"transparent"
            width:musicImage.width/2
            height:60
            //anchors.horizontalCenter: parent.horizontalCenter
            Row{
                spacing:10
                //anchors.horizontalCenter: parent.horizontalCenter
                Image{
                    id:rr
                    source:"qrc:/Images/button_rewind.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
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
                        }
                    }
                }
                Image{
                    source:musicPlay.playbackState===1?"qrc:/Images/button_pause.png":"qrc:/Images/button_play.png"
                    width:rr.width
                    height:rr.height
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(musicPlay.playbackState===1){
                                musicPlay.pause()
                                timer.running=false
                                //playpauseRec.icon="../Images/icon_play.png"
                            }
                            else{
                                musicPlay.play()
                                timer.running=true
                                //playpauseRec.icon="../Images/icon_pause.png"
                            }
                        }
                    }
                }
                Image{
                    source:"qrc:/Images/button_forward.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
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
            }
        }
    }

    Rectangle{
        width:parent.width*2/3
        height:parent.height/2-toolBar.height
        anchors.right:parent.right
        anchors.bottom: middleRec.top
        color:"transparent"
        Text{
            anchors.centerIn: parent
            color:"white"
            font.pixelSize: 25
            text:"No map Content  Available \n Please Wait Content To Load"
        }/*
        Rectangle{
            color:"transparent"
            width:parent.width
            height:parent.height/9
            anchors.bottom: parent.bottom
            Text{
                //color:"white"
                text:"100%"
                anchors.centerIn: parent
            }

            Rectangle{
                color:"transparent"
                width:parent.width/10
                height:parent.height
                anchors.right:parent.right
                Text{
                    //color:"white"
                    text:"STOP"
                    anchors.centerIn: parent
                }
            }
        }*/
    }
    Image{
        id:home
        source:"qrc:/Images/home.png"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left:parent.left
        anchors.leftMargin: parent.width/12
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {home.width=124;home.height=110}
            onExited: {home.width=114;home.height=100}
            onClicked:{mainStackView.push("qrc:/home/MainItem.qml")}
        }
    }
    Image{
        id:media
        source:"qrc:/Images/multimedia.png"
        anchors.bottom: home.top
        anchors.bottomMargin: 20
        anchors.left:parent.left
        anchors.leftMargin: parent.width/20
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {media.width=124;media.height=110}
            onExited: {media.width=114;media.height=100}
            onClicked: mainStackView.push("qrc:/multimedia/MainMusic2.qml")
        }
    }
    Image{
        id:internet
        source:"qrc:/Images/internet.png"
        anchors.bottom: media.top
        anchors.bottomMargin: 20
        anchors.left:parent.left
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {internet.width=124;internet.height=110}
            onExited: {internet.width=114;internet.height=100}
            onClicked: mainStackView.push("qrc:/internet/acceuill.qml")
        }
    }
    Image{
        id:navigation
        source:"qrc:/Images/navigation.png"
        anchors.top: home.bottom
        anchors.topMargin: 20
        anchors.left:parent.left
        anchors.leftMargin: parent.width/20
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {navigation.width=124;navigation.height=110}
            onExited: {navigation.width=114;navigation.height=100}
              onClicked: mainStackView.push("qrc:/navigation/map.qml")
        }
    }
    Image{
        id:phone
        fillMode: Image.PreserveAspectFit
        source:"qrc:/Images/Phone.png"
        anchors.top: navigation.bottom
        anchors.topMargin: 20
        anchors.left:parent.left
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered:{phone.width=124;phone.height=110}
            onExited: {phone.width=114;phone.height=100}
        }
    }
}

