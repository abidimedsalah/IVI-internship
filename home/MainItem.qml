import QtQuick 2.0
import QtQuick.Window 2.0
import QtMultimedia 5.0

Item{
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
            source:"qrc:/Images/media1.png"
            anchors.fill: rec1
            fillMode: Image.PreserveAspectCrop
        }
        MouseArea{
            id:rec1Area
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
            onClicked: mainStackView.push("qrc:/multimedia/MainMusic2.qml")
        }
    }
    Text{
        id:mediaText
        text:"MEDIA"
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
            source:"qrc:/Images/Bluetooth.png"
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
            onClicked:mainStackView.push("qrc:/Bluetooth/Media-Bluetooth.qml")
        }
    }
    Text{
        id:radioText
        text:"MediaBluetooth"
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
            source:"qrc:/Images/navigation5.png"
            anchors.fill: rec3
            fillMode: Image.PreserveAspectFit
        }
        MouseArea{
            id:rec3Area
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
              onClicked: mainStackView.push("qrc:/navigation/map.qml")
        }

    }
    Text{
        id:navigationText
        text:"NAVIGATION"
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
            source:"qrc:/Images/internet4.png"
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
              onClicked: mainStackView.push("qrc:/internet/acceuill.qml")
        }
    }
    Text{
        id:internetText
        text:"INTERNET"
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
            source:"qrc:/Images/phone.png"
            anchors.fill: rec5
            fillMode: Image.PreserveAspectFit
        }
        MouseArea{
            id:rec5Area
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
            onClicked:{
                mainStackView.push("qrc:/Bluetooth/Dialpad.qml")
            }
        }
    }
    Text{
        id:phoneText
        text:"PHONEBluetooth"
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
            source:"qrc:/Images/gallery.png"
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
        }
    }
    Text{
        id:galleryText
        text:"GALLERY"
        x:rec6.x+rec6.width/2-width/2
        font.pixelSize: 20
        color:"white"
        anchors.top: rec6.bottom
        anchors.topMargin: 10
    }
}
