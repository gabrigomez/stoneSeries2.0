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

  property alias text: infoCardTitle.text
  property alias image: infoCardImage.source
  property alias showRating: infoCardRating.text

  Rectangle {
    x: 6
    y: 6

    BusyIndicator {
      id: busyIndicator
      visible: infoCardImage.status === 1 ? false : true

      x: 120
      y: 250

      width: 281
      height: 281
      Material.accent: settingsConfig.themeColor === "#000000" ? "white" : "black"
    }

    Rectangle {
      id: showCardContainer
      width: 500
      height: homeCards.height - 10
      color: "transparent"

      visible: infoCardImage.status === 1 ? true : false
      opacity: infoCardImage.status === 1 ? true : false

      Behavior on opacity {
        PropertyAnimation {
          duration: 800
          easing.type: Easing.InOutQuad
        }
      }

      Atoms.ShowImage {
        id: infoCardImage
      }

      Atoms.ShowTitle {
        id: infoCardTitle
      }

      Atoms.RatingIcon {
        id: ratingShowImage
        visible: homeCards.showRating ? true : false

        anchors {
          right: infoCardRating.left
          rightMargin: 6
          bottom: infoCardRating.bottom
          bottomMargin: 6
        }
      }

      Atoms.ShowRating {
        id: infoCardRating
      }
    }
  }
}
