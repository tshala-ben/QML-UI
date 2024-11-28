import QtQuick 2.15

Rectangle {
    id: bottomBar
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    color: "black"
    height: parent.height / 12

    Image {
        id: carRender
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height * .85
        fillMode: Image.PreserveAspectFit
        source: "file:///C:/Users/ailin/OneDrive/Bureau/qt/testla/UI/assets/car2.png"

    }

    HVACcomponent{
        id: driverHVACcontrol
        anchors{
            top: parent.top
            bottom: parent.bottom
            left: carRender.right
            leftMargin: 150
        }
        hvacController: driverHVAC
    }

   HVACcomponent{
        id: passengerHVACcontrol
        anchors{
            top: parent.top
            bottom: parent.bottom
            right: volumeid.left
            rightMargin: 150
        }
        hvacController: passengerHVAC
    }







Connections{

    target: audioController
    function onVolumeLevelChanged() {

    volumeIcon.visible = false
    visibleTimer.start()


    }
}

Timer{

    id : visibleTimer
    interval: 500
    repeat: false
    onTriggered:{
        volumeIcon.visible = true
    }
}

    ///////////volume////////////////
Rectangle{
    id: volumeid
    anchors.right:parent.right
    anchors.verticalCenter: parent.verticalCenter
    height: parent.height * .5
    anchors.rightMargin: 100
   // width: 120 * (parent.width / 1280)



    Rectangle{
        id: decrementeButton
        anchors{
            right: volumeIcon.left
            top: parent.top
            //leftMargin: 10
            bottom: parent.bottom
        }
        width: height / 2
        color: "black"
        Text {
            id: decrementText
            color: "#bbbdbf"
            anchors.centerIn: parent
            text: "<"
            font.pixelSize: 12
        }
        MouseArea{
            anchors.fill: parent
            onClicked: audioController.incrementeVolume(-1)
        }
    }

    Image{
        id: volumeIcon
        anchors{
            left: decrementeButton.right
            bottom:parent.bottom
            verticalCenter : parent.verticalCenter
        }
    source: {
        if (audioController.volumeLevel <= 1 )
            return "file:///C:/Users/ailin/OneDrive/Bureau/qt/testla/UI/assets/white0.png"
        else if (audioController.volumeLevel >= 50)
            return "file:///C:/Users/ailin/OneDrive/Bureau/qt/testla/UI/assets/white2.png"
        else
            return "file:///C:/Users/ailin/OneDrive/Bureau/qt/testla/UI/assets/white1.png"

    }

    width: 40
    }

    Text{
        id: volumeTextLabel
        visible: !volumeIcon.visible
        anchors{
            centerIn: volumeIcon
        }
        color: "#bbbdbf"
        font.pixelSize: 24
        text: audioController.volumeLevel
    }

    Rectangle{
        id: incrementeButton
        anchors{
            left: volumeIcon.right
            //leftMargin:10
            top: parent.top
            bottom: parent.bottom
        }
        width: height / 2
        color: "black"
        Text {
            id: incrementText
            color: "#bbbdbf"
            anchors.centerIn: parent
            text: ">"
            font.pixelSize: 12
        }
        MouseArea{
            anchors.fill: parent
            onClicked: audioController.incrementeVolume (1)
        }
     }
   }
 }


