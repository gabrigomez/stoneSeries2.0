import QtQuick
import QtQuick.Controls.Material 2.12

import "../atoms" as Atoms

Rectangle {
  id: homeCards
  color: settingsConfig.themeColor
  border.color: "black"
  border.width: 2

  topRightRadius: 5
  topLeftRadius: 5
  bottomRightRadius: 20
  bottomLeftRadius: 20

  width: 512
  height: 760

  property alias text: trendingShowTitle.text
  property alias image: trendingShowImage.source
  property alias showRating: trendingShowRating.text

  Rectangle {
    x: 6
    y: 6

    BusyIndicator {
      id: busyIndicator
      visible: trendingShowImage.status === 1 ? false : true

      x: 120
      y: 250

      width: 281
      height: 281
      Material.accent: "black"
    }

    Rectangle {
      id: showCardContainer
      width: 500
      height: homeCards.height - 10
      color: "transparent"

      visible: trendingShowTitle.text === "" ? false : true

      Atoms.ShowImage {
        id: trendingShowImage
      }

      Atoms.ShowTitle {
        id: trendingShowTitle
      }

      Atoms.ShowRating {
        id: trendingShowRating
      }
    }
  }
}
