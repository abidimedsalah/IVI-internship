import QtQuick 2.0
import QtQuick.Window 2.0
import QtWebKit 3.0
import QtQuick.Controls 1.3
import "qrc:/home/"
Item {
    id:yo
        ScrollView {
            x: 0
            y: 63
            width: 1600
            height: 1121

            WebView {
                id: webview
                x: -71
                y: 17
                width: parent.width
                height: parent.height
                contentHeight: 24
                contentWidth: 29
                flickableDirection: Flickable.VerticalFlick
                anchors.rightMargin: 81
                anchors.bottomMargin: 67
                anchors.leftMargin: 0
                anchors.topMargin: 0
                url: "http://www.youtube.com"
                anchors.fill: parent
                onNavigationRequested: {
                    // detect URL scheme prefix, most likely an external link
                    var schemaRE = /^\w+:/;
                    if (schemaRE.test(request.url)) {
                        request.action = WebView.AcceptRequest;
                    } else {
                        request.action = WebView.IgnoreRequest;
                        // delegate request.url here
                    }
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

                MouseArea {
                    id: mouseArea2
                    x: 67
                    y: 0
                    width: 60
                    height: 28
                    onClicked: webview.goForward()
                }
            }

            Text{
                id:timeId
                anchors.top: parent.top
                font.pixelSize: 30
                //font.bold: true
                style: Text.Raised
                font.family: "Times New Roman"
                color:"white"
                x:toolBar.width/2-2*width
                //                anchors.centerIn: toolBar
            }

            Rectangle{
                id:connectivite
                height:toolBar.height
                width:toolBar.width/20
                x:Screen.width-width
                radius:5
                color:"transparent"
                Image{
                    source:"qrc:/home/network_connection_w.png"
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

        Image {
            id: image1
            x: 0
            y: 35
            width: 60
            height: 28
            source: "qrc:/Images/icon_back.png"
        }

        Image {
            id: image2
            x: 69
            y: 35
            width: 60
            height: 28
            source: "qrc:/Images/icon_forward.png"
        }

        Image {
            id: image3
            x: 140
            y: 35
            width: 60
            height: 28
            source: "qrc:/Images/icon_reload.png"

            MouseArea {
                id: mouseArea3
                x: 0
                y: 0
                width: 60
                height: 28
                 onClicked: webview.reload()
            }
        }

        Image {
            id: image4
            x: 213
            y: 36
            width: 60
            height: 28
            source: "qrc:/Images/icon_url.png"

            MouseArea {
                id: mouseArea4
                x: 0
                y: 0
                width: 60
                height: 28
                    onClicked: mainStackView.push("qrc:/internet/rechercher.qml")
            }
        }


    MouseArea {
        id: mouseArea1
        x: 0
        y: 35
        width: 62
        height: 28
            onClicked: webview.goBack()
    }
}
