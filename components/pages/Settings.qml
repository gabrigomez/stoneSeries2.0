import QtQuick
import QtQuick.Dialogs

import "../atoms" as Atoms
import "../organisms" as Organisms

Rectangle {
  id: settingsCard
  objectName: "settingsPage"

  width: root.width
  height: root.height
  color: "transparent"

  FileDialog {
    id: fileDialog
    nameFilters: ["Image Files (*.jpg *.png *.jpeg)"]
    onAccepted: settingsConfig.userAvatar = selectedFile
  }

  Atoms.SettingsTitle {}

  Organisms.SettingsCard {
    id: settingsInfo
  }
}
