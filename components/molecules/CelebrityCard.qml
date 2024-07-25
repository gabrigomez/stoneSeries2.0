import QtQuick

Rectangle {
  id: celebrityCard
  height: 350
  width: 200

  color: settingsConfig.themeColor
  topRightRadius: 5
  topLeftRadius: 5
  bottomRightRadius: 10
  bottomLeftRadius: 10

  property alias text: celebrityName.text
  property alias image: celebrityImage.source

  property var celebrityId

  Image {
    id: celebrityImage
    source: celebrityCard.image
    width: 190
    height: 280

    anchors {
      top: parent.top
      topMargin: 4
      horizontalCenter: parent.horizontalCenter
    }
  }

  Text {
    id: celebrityName
    anchors {
      top: celebrityImage.bottom
      topMargin: 10
      left: celebrityImage.left
      leftMargin: 10
    }

    color: "white"
    text: ""
    style: Text.Outline
    styleColor: "black"

    font.family: bodyFont.font.family
    font.pixelSize: 16
  }
}
