import QtQuick
import QtQuick.Controls.Material 2.12

import "../organisms" as Organisms

Rectangle {
  id: showDetails
  width: parent?.width
  height: parent?.height
  color: "white"

  property var name
  property var image

  BusyIndicator {
    id: busyIndicator
    visible: false
    anchors.centerIn: parent

    width: 281
    height: 281
    Material.accent: settingsConfig.themeColor
  }

  Organisms.CelebrityDetailsInfo {}
}
