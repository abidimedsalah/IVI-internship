import QtQuick 2.0
import QtQuick.Window 2.0
import "qrc:/home/"
Item {
    id:nav


        Rectangle{
            id:rec1
            x:mainMusic.width/2-width/2
            y:mainMusic.height/2-height
            width: 160
            height: 160
            color:"#00000000"
            radius: 50
            border.width: 1
            border.color: "#726464"
            Image{
                id:media
                anchors.rightMargin: 8
                anchors.bottomMargin: 11
                anchors.leftMargin: 8
                anchors.topMargin: 11
                source:"qrc:/Images/facebook_2.png"
                anchors.fill: rec1
                fillMode: Image.PreserveAspectCrop
            }

            MouseArea{
                id:rec1Area
                width: 170
                anchors.bottomMargin: 0
                anchors.leftMargin: -25
                anchors.topMargin: 0
                anchors.rightMargin: -38
                anchors.fill: rec1
                hoverEnabled: true
                onEntered: {
                    rec1.width=180
                    rec1.height=180
                    rec1.border.color="#ab3595"
                    rec1.border.width=2
                }
                onExited: {
                    rec1.width=160
                    rec1.height=160
                    rec1.border.color="#726464"
                    rec1.border.width=1
                }
                onClicked: mainStackView.push("qrc:/internet/facebook.qml")
            }

        }
        Text{
            id:mediaText
            text:"FACEBOOK"
            x:rec1.x+rec1.width/2-width/2
            font.pixelSize: 20
            color:"white"
            anchors.top: rec1.bottom
            anchors.topMargin: 10
        }
        Rectangle{
            id:rec2
            width: 160
            height: 160
            color:"#00000000"
            radius: 50
            border.width: 1
            border.color: "#726464"
            anchors{
                top:rec1.bottom
                topMargin: 50
                left:rec1.left
            }
            Image{
                id:radio
                anchors.rightMargin: 14
                anchors.bottomMargin: 15
                anchors.topMargin: 15
                anchors.leftMargin: 14
                source:"qrc:/Images/Google-Mobile-App-Logo.png"
                anchors.fill: rec2
                fillMode: Image.PreserveAspectFit
            }
            MouseArea{
                id:rec2Area
                anchors.fill: rec2
                hoverEnabled: true
                onEntered: {
                    rec2.width=180
                    rec2.height=180
                    rec2.border.color="#1738da"
                    rec2.border.width=2
                }
                onExited: {
                    rec2.width=160
                    rec2.height=160
                    rec2.border.color="#726464"
                    rec2.border.width=1
                }
               onClicked: mainStackView.push("qrc:/internet/google.qml")
            }
        }
        Text{
            id:radioText
            text:"GOOGLE"
            x:rec2.x+rec2.width/2-width/2
            font.pixelSize: 20
            color:"white"
            anchors.top: rec2.bottom
            anchors.topMargin: 10
        }
        Rectangle{
            id:rec3
            width: 160
            height: 160
            color:"#00000000"
            radius: 50
            border.width: 1
            border.color: "#726464"
            anchors{
                right:rec1.left
                rightMargin: 60
                top:rec1.top
            }
            Image{
                id:navigation
                anchors.bottomMargin: 0
                anchors.leftMargin: 17
                anchors.topMargin: 0
                anchors.rightMargin: 8
                source:"qrc:/Images/256px-Linkedin_icon.svg_.png"
                anchors.fill: rec3
                fillMode: Image.PreserveAspectFit
            }
            MouseArea{
                id:rec3Area
                width: 170
                anchors.rightMargin: -9
                anchors.fill: rec3
                hoverEnabled: true
                onEntered: {
                    rec3.width=180
                    rec3.height=180
                    rec3.border.color="#16a465"
                    rec3.border.width=2
                }
                onExited: {
                    rec3.width=160
                    rec3.height=160
                    rec3.border.color="#726464"
                    rec3.border.width=1
                }
                 onClicked: mainStackView.push("qrc:/internet/linkedin.qml")
            }
        }
        Text{
            id:navigationText
            text:"LINKEDIN"
            x:rec3.x+rec3.width/2-width/2
            font.pixelSize: 20
            color:"white"
            anchors.top: rec3.bottom
            anchors.topMargin: 10
        }
        Rectangle{
            id:rec4
            width: 160
            height: 160
            color:"#00000000"
            radius: 50
            border.width: 1
            border.color: "#726464"
            anchors{
                right:rec2.left
                rightMargin: 60
                top:rec2.top
            }
            Image{
                id:internet
                source:"qrc:/Images/Communication-gmail-icon.png"
                anchors.fill: rec4
                fillMode: Image.PreserveAspectFit
            }
            MouseArea{
                id:rec4Area
                anchors.fill: rec4
                hoverEnabled: true
                onEntered: {
                    rec4.width=180
                    rec4.height=180
                    rec4.border.color="#f31515"
                    rec4.border.width=2
                }
                onExited: {
                    rec4.width=160
                    rec4.height=160
                    rec4.border.color="#726464"
                    rec4.border.width=1
                }
                 onClicked: mainStackView.push("qrc:/internet/gmail.qml")
            }
        }
        Text{
            id:internetText
            text:"GMAIL"
            x:rec4.x+rec4.width/2-width/2
            font.pixelSize: 20
            color:"white"
            anchors.top: rec4.bottom
            anchors.topMargin: 10
        }
        Rectangle{
            id:rec5
            width: 160
            height: 160
            color:"#00000000"
            radius: 50
            border.width: 1
            border.color: "#726464"
            anchors{
                left:rec2.right
                leftMargin: 60
                top:rec2.top
            }
            Image{
                id:phone
                anchors.bottomMargin: 16
                anchors.leftMargin: 12
                anchors.topMargin: 17
                anchors.rightMargin: 12
                source:"qrc:/Images/youtube_icon.png"
                anchors.fill: rec5
                fillMode: Image.PreserveAspectFit
            }
            MouseArea{
                id:rec5Area
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.fill: rec5
                hoverEnabled: true
                onEntered: {
                    rec5.width=180
                    rec5.height=180
                    rec5.border.color="#e87777"
                    rec5.border.width=2
                }
                onExited: {
                    rec5.width=160
                    rec5.height=160
                    rec5.border.color="#726464"
                    rec5.border.width=1
                }
                 onClicked: mainStackView.push("qrc:/internet/youtube.qml")
            }
        }
        Text{
            id:phoneText
            text:"YOUTUBE"
            x:rec5.x+rec5.width/2-width/2
            font.pixelSize: 20
            color:"white"
            anchors.top: rec5.bottom
            anchors.topMargin: 10
        }
        Rectangle{
            id:rec6
            width: 160
            height: 160
            color:"#00000000"
            radius: 50
            border.width: 1
            border.color: "#726464"
            anchors{
                left:rec1.right
                leftMargin: 60
                top:rec1.top
            }
            Image{
                id:gallery
                width: 144
                height: 138
                anchors.bottomMargin: 12
                anchors.leftMargin: 18
                anchors.topMargin: 12
                anchors.rightMargin: 13
                source:"qrc:/Images/twitter.png"
                anchors.fill: rec6
                fillMode: Image.PreserveAspectFit
            }
            MouseArea{
                id:rec6Area
                anchors.fill: rec6
                hoverEnabled: true
                onEntered: {
                    rec6.width=180
                    rec6.height=180
                    rec6.border.color="black"
                    rec6.border.width=2
                }
                onExited: {
                    rec6.width=160
                    rec6.height=160
                    rec6.border.color="#726464"
                    rec6.border.width=1
                }
                 onClicked: mainStackView.push("qrc:/internet/twitter.qml")
            }
        }
        Text{
            id:galleryText
            text:"TWITTER"
            x:rec6.x+rec6.width/2-width/2
            font.pixelSize: 20
            color:"white"
            anchors.top: rec6.bottom
            anchors.topMargin: 10
        }
    }


