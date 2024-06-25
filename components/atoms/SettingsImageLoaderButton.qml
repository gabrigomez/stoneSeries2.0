import QtQuick
import QtQuick.Controls

Button {
  id: openImageLoader
  width: 140
  anchors {
    top: userName.bottom
    topMargin: 20
    horizontalCenter: parent.horizontalCenter
  }

  text: "Carregar avatar"
  onClicked: () => {
               fileDialog.open()
             }

  background: Rectangle {
    id: openImageLoaderColor
    color: "white"
    border.color: openImageLoader.hovered ? "#27AE60" : "silver"
    radius: 5

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
}
