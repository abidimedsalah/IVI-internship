import QtQuick 2.0
import QtQuick.Window 2.0

Item{
    Image{
        id:background
        //anchors.fill:
        source:"qrc:/Images/background.jpg"
        fillMode: Image.PreserveAspectFit
        //anchors.fill: mainView
        Timer{
            interval:500;running:true;repeat:true
            onTriggered:{
                timeId.text=Qt.formatDateTime(new Date(),"hh:mm AP")
                //          timeId2.text=Qt.formatDateTime(new Date(),"ddd., MMMM d, yyyy")
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

            Button{
                id:retour
                height:toolBar.height
                width:toolBar.width/17
                anchors{
                    top:toolBar.top
                    left:toolBar.left
                }
                icon:"qrc:/Images/2.png"
                onButtunClicked: mainStackView.pop()
                //onButtonHovered:
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
    }
}
