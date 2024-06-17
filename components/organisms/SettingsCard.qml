import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Dialogs

import "../atoms" as Atoms

Rectangle {
  id: settingsInfo
  anchors.centerIn: parent
  width: 500
  height: 500

  color: 'lightgray'
  radius: 20
  border {
    color: "#27AE60"
  }

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

  Atoms.SettingsUserName {
    id: userName
  }

  Atoms.SettingsImageLoaderButton {
    id: openImageLoader
  }

  Atoms.EditUserNameLabel {}

  Atoms.EditUserNameInput {
    id: editUserNameInput
  }

  Atoms.SaveSettingsButton {
    id: saveButton
  }

  Atoms.ErrorMessage {
    id: errorMessage
  }
}
