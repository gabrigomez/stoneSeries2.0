import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Dialogs

import "../atoms" as Atoms
import "../molecules" as Molecules

Rectangle {
  id: settingsInfo
  anchors.centerIn: parent
  width: 500
  height: 500

  color: 'transparent'
  radius: 20
  border.color: "#27AE60"

  Molecules.UserAvatarCard {
    id: userAvatarCard
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
