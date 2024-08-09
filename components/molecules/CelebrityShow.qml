import QtQuick

import QtQuick.Controls.Material 2.12

Rectangle {
  height: 260
  width: 604
  color: "black"

  topRightRadius: 5
  topLeftRadius: 5
  bottomRightRadius: 10
  bottomLeftRadius: 10

  property alias title: celebrityShowName.text
  property alias imageUrl: celebrityShowImage.source
  property var celebrityShowId

  Rectangle {
    id: celebrityShow
    height: 256
    width: 600
    x: 2
    y: 2

    color: settingsConfig.themeColor

    topRightRadius: 5
    topLeftRadius: 5
    bottomRightRadius: 10
    bottomLeftRadius: 10

    Rectangle {
      id: celebrityImageContainer
      width: 160
      height: 250
      color: "white"

      anchors {
        verticalCenter: parent.verticalCenter
        left: parent.left
        leftMargin: 4
      }

      BusyIndicator {
        id: busyIndicator
        visible: celebrityShowImage.status !== 1
        width: 100
        height: 100

        anchors.centerIn: parent
        Material.accent: settingsConfig.themeColor
      }

      Rectangle {
        anchors.fill: parent
        visible: celebrityShowImage.status === 1

        Image {
          id: celebrityShowImage
          source: celebrityCard.image
          width: 156
          height: 246

          anchors {
            centerIn: parent
          }
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
      width: 330

      color: "white"
      text: ""
      style: Text.Outline
      styleColor: "black"

      font.family: bodyFont.font.family
      font.pixelSize: 34

      wrapMode: Text.WrapAtWordBoundaryOrAnywhere
      maximumLineCount: 2
    }
  }
}
