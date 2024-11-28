import QtQuick 2.15
import QtLocation
import QtPositioning


Rectangle {
    id: rightScreen

    anchors{
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }

    Plugin {
           id: mapPlugin
           name: "osm"
       }

       Map {
           id: map
           anchors.fill: parent
           plugin: mapPlugin
           center: QtPositioning.coordinate(59.91, 10.75) // Oslo
           zoomLevel: 14
           property geoCoordinate startCentroid

           PinchHandler {
               id: pinch
               target: null
               onActiveChanged: if (active) {
                   map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
               }
               onScaleChanged: (delta) => {
                   map.zoomLevel += Math.log2(delta)
                   map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
               }
               onRotationChanged: (delta) => {
                   map.bearing -= delta
                   map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
               }
               grabPermissions: PointerHandler.TakeOverForbidden
           }
           WheelHandler {
               id: wheel
               // workaround for QTBUG-87646 / QTBUG-112394 / QTBUG-112432:
               // Magic Mouse pretends to be a trackpad but doesn't work with PinchHandler
               // and we don't yet distinguish mice and trackpads on Wayland either
               acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                                ? PointerDevice.Mouse | PointerDevice.TouchPad
                                : PointerDevice.Mouse
               rotationScale: 1/120
               property: "zoomLevel"
           }
           DragHandler {
               id: drag
               target: null
               onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
           }
           Shortcut {
               enabled: map.zoomLevel < map.maximumZoomLevel
               sequence: StandardKey.ZoomIn
               onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
           }
           Shortcut {
               enabled: map.zoomLevel > map.minimumZoomLevel
               sequence: StandardKey.ZoomOut
               onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
           }
       }

       Image {
           id: lockIcon
           anchors{
              left: parent.left
              top: parent.top
              margins: 20
           }

           width: parent.width / 40
           fillMode: Image.PreserveAspectFit

           source:(systemHandler.carlocked ? "file:///C:/Users/ailin/OneDrive/Bureau/qt/testla/UI/assets/lock1.png" : "file:///C:/Users/ailin/OneDrive/Bureau/qt/testla/UI/assets/unlock3.png")
           MouseArea{
               anchors.fill:parent
               onClicked: systemHandler.setCarlocked(!systemHandler.carlocked)
           }
       }
       Text {
           id: dateTimeDisplay
           anchors{
               left: lockIcon.right
               leftMargin: 40
               bottom: lockIcon.bottom
           }
            font.pixelSize: 12
            font.bold: true
            color: "black"
            text: systemHandler.currentTime

       }

       Text {
           id: outdoorTemperatureeDisplay
           anchors{
               left: dateTimeDisplay.right
               leftMargin: 40
               bottom: lockIcon.bottom
           }
            font.pixelSize: 12
            font.bold: true
            color: "black"
            text: systemHandler.outdoor_temp + "°C"

       }

       Text {
           id: userNameDisplay
           anchors{
               left: outdoorTemperatureeDisplay.right
               leftMargin: 40
               bottom: lockIcon.bottom
           }
            font.pixelSize: 12
            font.bold: true
            color: "black"
            text: systemHandler.userName

       }

       Rectangle {
           id: navSearchBox
           radius: 5
           color: "#f5f0f0"
           width: parent.width * 1/3
           height: parent.height * 1/12

           anchors.left: lockIcon.left
           anchors.top: lockIcon.bottom
           anchors.topMargin: 15

           Image {
               id: searchIcon

               anchors{
                   left:parent.left
                   leftMargin:25
                   verticalCenter: parent.verticalCenter
               }
               height: parent.height * .25
               fillMode:Image.PreserveAspectFit

               source: "file:///C:/Users/ailin/OneDrive/Bureau/qt/testla/UI/assets/searchIcon.png"
           }

           Text {
               id: navigationTextHolder
               visible:navigationTextInput.text === ""
               color: "#999997"
               text:"recherche"
               anchors{
                   verticalCenter: parent.verticalCenter
                   left: searchIcon.right
                   leftMargin:20
               }
           }
           TextInput{
               id: navigationTextInput
               clip: true
               anchors{
                   top: parent.top
                   bottom:parent.bottom
                   right: parent.right
                   left: searchIcon.left
                   leftMargin:20
               }
               verticalAlignment: Text.AlignVCenter
               font.pixelSize:16
           }
       }


    width: parent.width * 2/3
}
