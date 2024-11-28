import QtQuick 2.15

Rectangle {
    id: leftScreen
    anchors {
        left: parent.left
        right: rightScreen.left
        bottom: bottomBar.top
        top: parent.top
    }

    color: "white"

    Image {
        id: carRender
        anchors.centerIn: parent
        width: parent.width * .99
        fillMode: Image.PreserveAspectFit
        source: "file:///C:/Users/ailin/OneDrive/Bureau/qt/testla/UI/assets/carRender.png"

    }
}
