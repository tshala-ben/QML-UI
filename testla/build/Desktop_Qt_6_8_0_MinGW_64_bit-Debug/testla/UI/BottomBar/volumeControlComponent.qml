import QtQuick 2.15

Item {
    property string fontColor: "#bbbdbf"

    Rectangle{
        id: decrementeButton
        anchors{
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        width: height / 2
        color: "black"
        Text {
            id: decrementText
            color: fontColor
            anchors.centerIn: parent
            text: "<"
            font.pixelSize: 12
        }
        MouseArea{
            anchors.fill: parent
           // onClicked: hvacController.incrementeTargetTemperature (-1)
        }
    }

    Image{
        id: volumeIcon
        anchors{
            left: decrementeButton.right
            leftMargin: 15
            verticalCenter : parent.verticalCenter
        }
    source: "file:///C:/Users/ailin/OneDrive/Bureau/qt/testla/UI/assets/audio2.png"
    }

    Rectangle{
        id: incrementeButton
        anchors{
            left: targetTemperatureText.right
            leftMargin: 15
            top: parent.top
            bottom: parent.bottom
        }
        width: height / 2
        color: "black"
        Text {
            id: incrementText
            color: fontColor
            anchors.centerIn: parent
            text: ">"
            font.pixelSize: 12
        }
        MouseArea{
            anchors.fill: parent
            //onClicked: hvacController.incrementeTargetTemperature (1)
        }
    }

}
