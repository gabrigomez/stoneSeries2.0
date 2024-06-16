import QtQuick
import QtQuick.Controls.Material 2.12

Rectangle {
  id: homeCards
  color: "#08FF5B"
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
      visible: trendingShowTitle.text === "" ? true : false
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
      Image {
        id: trendingShowImage
        y: 2
        source: homeCards.image
        width: 500
        height: 650
      }

      Text {
        id: trendingShowTitle
        anchors {
          top: trendingShowImage.bottom
        }
        color: "white"
        text: ""
        style: Text.Outline
        styleColor: "black"
        font.family: bodyFont.font.family
        font.pixelSize: 40

        maximumLineCount: 2
        width: trendingShowImage.width
        wrapMode: Text.Wrap
      }

      Text {
        id: trendingShowRating
        anchors {
          bottom: showCardContainer.bottom
          right: showCardContainer.right
        }
        color: "white"
        text: ""
        style: Text.Outline
        styleColor: "black"
        font.family: titleFont.font.family
        font.pixelSize: 30
      }
    }
  }
}
