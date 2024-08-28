import QtQuick
import QtQuick.Controls
import QtQuick.Effects

import "../atoms" as Atoms

Rectangle {
  id: userAvatarCard
  width: 206
  height: 206
  anchors {
    top: parent.top
    topMargin: 40
    horizontalCenter: parent.horizontalCenter
  }

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
