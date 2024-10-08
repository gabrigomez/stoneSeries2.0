import QtQuick
import QtQuick.Controls.Material 2.12

import "../molecules" as Molecules
import "../organisms" as Organisms

Item {
  id: celebrityDetailsInfoContainer
  width: root.width
  height: 700

  BusyIndicator {
    id: busyIndicator
    width: 281
    height: 281
    anchors.centerIn: parent

    visible: celebrityDetailsInfoCard.imageStatus === 1 ? false : true
    Material.accent: settingsConfig.themeColor
  }

  Organisms.CelebrityShowsList {
    id: celebrityShowListContainer
    y: 80
    x: 350
    visible: celebrityDetailsInfo.visible
  }

  Rectangle {
    id: celebrityDetailsInfo
    width: 512
    height: 820

    y: 10
    x: 1000
    visible: celebrityDetailsInfoCard.imageStatus === 1 ? true : false
    color: settingsConfig.themeColor

    border {
      color: "black"
      width: 2
    }

    topRightRadius: 5
    topLeftRadius: 5
    bottomRightRadius: 20
    bottomLeftRadius: 20

    Organisms.CelebrityDetailsInfoCard {
      id: celebrityDetailsInfoCard
    }
  }
}
