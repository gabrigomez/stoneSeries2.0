import QtQuick
import QtQuick.Controls
import QtQuick.Effects

import "../atoms" as Atoms

Rectangle {
  id: userAvatarCard

  anchors {
    top: parent.top
    topMargin: 10
    horizontalCenter: parent.horizontalCenter
  }
  width: 206
  height: 206
  radius: 103

  color: "#27AE60"

  MultiEffect {
    //to cut the userAvatar
    id: userAvatarMask
    source: userAvatar
    anchors.fill: userAvatar
    maskEnabled: true
    maskSource: mask
  }

  Atoms.SettingsAvatar {
    id: userAvatar
  }

  Atoms.Mask {
    id: mask
    width: userAvatar.width
    height: userAvatar.height
  }
}
