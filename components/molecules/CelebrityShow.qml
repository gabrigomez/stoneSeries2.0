import QtQuick

Rectangle {
  id: celebrityShow
  height: 260
  width: 600
  color: settingsConfig.themeColor

  topRightRadius: 5
  topLeftRadius: 5
  bottomRightRadius: 10
  bottomLeftRadius: 10

  property alias title: celebrityShowName.text
  property alias imageUrl: celebrityShowImage.source

  property var celebrityShowId

  Rectangle {
    id: celebrityImageContainer
    width: 160
    height: 250
    color: "black"

    anchors {
      verticalCenter: parent.verticalCenter
      left: parent.left
      leftMargin: 4
    }

    Image {
      id: celebrityShowImage
      source: celebrityCard.image
      width: 150
      height: 240

      anchors {
        centerIn: parent
      }
    }
  }

  Text {
    id: celebrityShowName
    anchors {
      left: celebrityImageContainer.right
      leftMargin: 12
      verticalCenter: parent.verticalCenter
    }

    color: "white"
    text: ""
    style: Text.Outline
    styleColor: "black"

    font.family: bodyFont.font.family
    font.pixelSize: 34
  }
}
