import QtQuick 2.15
import "UI/BottomBar"
import "UI/RightScreen"
import "UI/LeftScreen"

Window {
    width: 1280
    height: 720
    visible: true
    title: qsTr("Tesla")


    LeftScreen  {
        id: leftScreen
    }


    BottomBar {
        id: bottomBar
    }

    RightScreen {
        id: rightScreen
    }




}
