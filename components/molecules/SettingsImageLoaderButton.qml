import QtQuick
import QtQuick.Controls

import "../atoms" as Atoms

Button {
  id: openImageLoader
  width: 40
  height: 40
  anchors {
    top: userAvatarCard.top
    right: userAvatarCard.right
    rightMargin: 16
    topMargin: 8
  }

  onClicked: () => {
               fileDialog.open()
             }

  background: Rectangle {
    id: openImageLoaderColor
    color: openImageLoader.hovered ? "#27AE60" : "white"
    border.color: openImageLoader.hovered ? "#27AE60" : "silver"
    radius: 20

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

  Atoms.SettingsImageLoaderIcon {}
}
