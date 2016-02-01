import QtQuick 2.4
import QtLocation 5.1
import QtPositioning 5.1
import QtQuick 2.0
import QtQuick.Controls 1.3
import "qrc:/home/"
    Item {
        id: idmap
     //var  myPlace = Qt.createQmlObject('import QtLocation 5.1; Place { }', parent);
            Plugin {
                id: myPlugin
                name: "nokia"
                parameters: [
                PluginParameter { name: "app_id"; value: "yPekA8XmzeeHMUZnN2zb"
                },
                PluginParameter { name: "token"; value: "_SegXACTD6ysokkgNibNhg"
                }
                ]
            }

            property variant startCoordinate: QtPositioning.coordinate(37.05, 10.062888) ;
           property variant start: QtPositioning
            property variant end :QtPositioning

            Map {
                id: map
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 35
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       // map.update()
                        searchModel.searchTerm = editRouteFrom.text;
                        searchModel.update();
                        searchModel1.searchTerm = editRouteTo.text;
                        searchModel1.update();
                        console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

                              aQuery.clearWaypoints()
                              aQuery.addWaypoint(start)
                              aQuery.addWaypoint(end)
                              aQuery.travelModes = RouteQuery.CarTravel
                              aQuery.routeOptimizations = RouteQuery.FastestRoute
                              routeModel.update()
                }

                    }
                PlaceSearchModel {
                    id: searchModel
                    plugin: myPlugin
                 //  searchTerm : "tunis";
                     searchArea: QtPositioning.circle(startCoordinate);
                      //Component.onCompleted: update()
                                   }
                MapItemView {
                            model: searchModel

                            delegate: MapQuickItem {
                                coordinate: place.location.coordinate
                               anchorPoint.x: image11.width * 0.5
                                anchorPoint.y: image11.height
                                sourceItem:
                                    end =place.location.coordinate
                                    Image {
                                    id: image11
                                    source: "qrc:/Images/aa.png"
                                }

                            }

                        }
                PlaceSearchModel {
                    id: searchModel1
                    plugin: myPlugin
                 //  searchTerm : "tunis";
                     searchArea: QtPositioning.circle(startCoordinate);
                      //Component.onCompleted: update()
}
                MapItemView {
                            model: searchModel1

                            delegate: MapQuickItem {
                                coordinate: place.location.coordinate

                               anchorPoint.x: image12.width * 0.5
                                anchorPoint.y: image12.height
                                sourceItem:
                                    start =place.location.coordinate
                                    Image {
                                    id: image12
                                    source: "qrc:/Images/aa.png"
                                }

                            }

                        }

                PlaceSearchModel {
                    id: searchModel2
                    plugin: myPlugin
                 //  searchTerm : "tunis";
                     searchArea: QtPositioning.circle(startCoordinate);
                      //Component.onCompleted: update()
}
                MapItemView {
                            model: searchModel2

                            delegate: MapQuickItem {
                                coordinate: place.location.coordinate

                               anchorPoint.x: image13.width * 0.5
                                anchorPoint.y: image13.height
                                sourceItem:
                                    Image {
                                    id: image13
                                    source: "qrc:/Images/aa.png"
                                }

                            }

                        }

                Image {
                    id:image
                    source: "qrc:/Images/icon_locate.png"
                    x: 3
                    y: 0
                    width:50
                    height: 50
                    anchors.top: destination.bottom
                    MouseArea{
                        anchors.fill: image
                        hoverEnabled: true
                        onClicked: destination.visible=true

                    }
                }

                Image {
                    id:imagea
                    x: 63
                    y: 30
                    source: "qrc:/Images/icon_zoom_in.png"
                    width:50
                    height: 50
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: map.zoomLevel=map.zoomLevel+2
                    }

                }
                Image {
                    id:imagev
                    x: 0
                    y: 30
                    source: "qrc:/Images/icon_zoom_out.png"
                    width:50
                    height: 50

                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: map.zoomLevel=map.zoomLevel-2
                    }
                }

                InputBox {
                    id: search
                    width: 250
                    x: 125
                    y: 35
                   // anchors.verticalCenter: parent.verticalCenter
                    height:41
                    pixelSize: 18
                    label: "Chercher"
                    text: ""
                }

                Image {
                    id: image1
                    x: 380
                    y: 30
                    width: 50
                    height: 50
                    source: "qrc:/Images/search.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                           // map.update()
                            searchModel2.searchTerm = search.text;
                            searchModel2.update();

                    }

                        }
                }

                Rectangle{
                    id:destination
                    width:350
                    height:300
                    visible:false
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onExited: destination.visible=false
                    }

                        Text {
                            id: routeFromText
                            x: 20
                            y: 34
                            text: "Route from"
                                //editRouteFrom.text
                            font.pixelSize: 20
                            font.bold: true
                           }
                        Row {
                            id: routeFrom
                            x: 8
                            y: 74
                            height: editRouteFrom.height
                            spacing: 15

                            // 'A' icon
                            Image {
                                source: "qrc:/Images/icon_routepoint.png"
                                id: iconA

                                Text {
                                    text: "A"
                                    anchors.bottom: iconA.bottom
                                    anchors.bottomMargin: 10
                                    anchors.left: iconA.left
                       anchors.leftMargin: 25
                                    font.pixelSize: 24
                                    font.bold: true
                                    color: "white"
                                }
                            }

                        InputBox {
                            id: editRouteFrom
                            width: 250

                            anchors.verticalCenter: parent.verticalCenter
                            height:41
                            pixelSize: 18
                            label: "Route from"
                            text: search.text
                        }
                        Text {
                            id: routeToText
                            x: 20
                            y: 164
                            text: "Route to:"
                            font.pixelSize: 20
                            font.bold: true
                            //color: "white"
                        }
}
                        // Arrange end location icon and input field in row
                        Row {
                            id: routeTo
                            x: 8
                            y: 202
                            height: editRouteTo.height
                            spacing: 15

                            // Icon 'B'
                            Image {
                                id: iconB
                                source: "qrc:/Images/icon_routepoint.png"

                                Text {
                                    text: "B"
                                    anchors.bottom: iconB.bottom
                                    anchors.bottomMargin: 10
                                    anchors.left: iconB.left
                                    anchors.leftMargin: 25
                                    font.pixelSize: 24
                                    font.bold: true
                                    color: "white"
                                }
                            }

                            // Input field for the end location
                            InputBox {
                                id: editRouteTo
                                width: 250
                                anchors.verticalCenter: iconB.verticalCenter
                                height:40
                                pixelSize: 18
                                label: "Route to"
                                text: ""
                            }
}
}


                anchors.fill: parent
                plugin: myPlugin;
                center {
                    latitude: 37.05
                    longitude: 10.062888
                }

                    RouteQuery {
                        id: aQuery
                    }

                    RouteModel {
                        id: routeModel
                        plugin: myPlugin
                        query: aQuery
                        autoUpdate: false
                    }

                    MapItemView {
                        model: routeModel
                        delegate: routeDelegate
                    }

                    Component {
                        id: routeDelegate

                        MapRoute {
                            route: routeData
                            line.color: "blue"
                            line.width: 5
                            smooth: true
                        }

                    }

            }

}

