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
  border.color: settingsConfig.themeColor

  ColorDialog {
    id: colorDialog

    onAccepted: {
      settingsConfig.themeColor = colorDialog.selectedColor
      console.log(settingsConfig.themeColor)
    }
  }

  Molecules.UserAvatarCard {
    id: userAvatarCard
  }

  Molecules.SettingsImageLoaderButton {
    id: openImageLoader
  }

  Atoms.SettingsUserName {
    id: userName
  }

  Molecules.ThemeButton {
    id: themeButton

    anchors {
      top: userName.bottom
      topMargin: 14
      horizontalCenter: parent.horizontalCenter
    }
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
