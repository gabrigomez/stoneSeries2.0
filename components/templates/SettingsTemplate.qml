import QtQuick
import QtQuick.Dialogs

import "../atoms" as Atoms
import "../organisms" as Organisms

Item {
  anchors.fill: parent

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
