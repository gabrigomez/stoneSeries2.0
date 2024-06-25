import QtQuick
import QtQuick.Controls

Button {
  id: themeButton
  anchors {
    top: userName.bottom
    topMargin: 14
    horizontalCenter: parent.horizontalCenter
  }

  width: 44
  height: 44

  background: Rectangle {
    id: themeButtonBackground
    color: themeButton.hovered ? "#27AE60" : "white"
    border.color: themeButton.hovered ? "#27AE60" : "silver"
    radius: 22

    Behavior on color {
      PropertyAnimation {
        duration: 200
        easing.type: Easing.InOutQuad
      }
    }
    Behavior on border.color {
      PropertyAnimation {
        duration: 200
        easing.type: Easing.InOutQuad
      }
    }
  }

  onClicked: {
    colorDialog.open()
  }

  Image {
    source: "../../assets/Theme.png"

    width: 32
    height: 32

    anchors {
      centerIn: parent
    }
  }
}
