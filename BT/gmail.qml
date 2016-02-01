import QtQuick 2.0
import QtQuick.Window 2.0
import QtWebKit 3.0
import QtQuick.Controls 1.3
import "qrc:/home/"
Item {
    id:go
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
                url: "http://www.gmail.com"
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
