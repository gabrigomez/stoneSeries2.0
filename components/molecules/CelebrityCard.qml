import QtQuick
import QtQuick.Controls.Material 2.12

Rectangle {
  height: 354
  width: 204
  color: "black"

  topRightRadius: 5
  topLeftRadius: 5
  bottomRightRadius: 10
  bottomLeftRadius: 10

  property alias text: celebrityName.text
  property alias image: celebrityImage.source

  property var celebrityId

  BusyIndicator {
    id: busyIndicator
    visible: celebrityImage.status !== 1
    width: 100
    height: 100

    anchors.centerIn: parent
    Material.accent: settingsConfig.themeColor
  }

  Rectangle {
    id: celebrityCard
    height: 350
    width: 200
    x: 2
    y: 2

    visible: celebrityImage.status === 1
    opacity: celebrityImage.status === 1
    color: settingsConfig.themeColor

    topRightRadius: 5
    topLeftRadius: 5
    bottomRightRadius: 10
    bottomLeftRadius: 10

    Behavior on opacity {
      PropertyAnimation {
        duration: 500
        easing.type: Easing.InOutQuad
      }
    }

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
        leftMargin: 4
      }
      width: 190

      color: "white"
      text: ""
      style: Text.Outline
      styleColor: "black"

      font.family: bodyFont.font.family
      font.pixelSize: 16
      wrapMode: Text.WrapAtWordBoundaryOrAnywhere
      maximumLineCount: 2
    }
  }
}
