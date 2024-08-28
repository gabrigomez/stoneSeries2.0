import QtQuick
import QtQuick.Dialogs

import "../atoms" as Atoms
import "../molecules" as Molecules

Rectangle {
  id: settingsInfo
  width: 500
  height: 550
  anchors.centerIn: parent

  color: settingsConfig.themeColor
  radius: 20
  border.color: "#27AE60"

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
      topMargin: 30
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
