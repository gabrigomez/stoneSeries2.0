import QtQuick

Rectangle {
  id: celebrityDetailsInfo
  width: 512
  height: 850

  anchors.horizontalCenter: parent.horizontalCenter
  y: 10
  visible: celebrityImage.status === 1 ? true : false

  color: settingsConfig.themeColor
  border {
    color: "black"
    width: 2
  }

  topRightRadius: 5
  topLeftRadius: 5
  bottomRightRadius: 20
  bottomLeftRadius: 20

  Rectangle {
    id: celebrityDetailsInfoCard
    width: 500
    height: 840

    x: 6
    y: 4
    color: "transparent"

    visible: celebrityImage.status === 1 ? true : false
    opacity: celebrityImage.status === 1 ? true : false

    Behavior on opacity {
      PropertyAnimation {
        duration: 500
        easing.type: Easing.InOutQuad
      }
    }

    Image {
      id: celebrityImage
      source: celebrityDetails.image ? celebrityDetails.image : ""
      width: 500
      height: 660
    }

    Text {
      id: celebrityName
      width: celebrityImage.width
      height: 100
      anchors {
        top: celebrityImage.bottom
        topMargin: 10
        horizontalCenter: parent.horizontalCenter
      }

      text: celebrityDetails?.name ? celebrityDetails.name : ""

      color: "white"
      style: Text.Outline
      styleColor: "black"
      font.family: bodyFont.font.family
      font.pixelSize: 50

      wrapMode: Text.WrapAtWordBoundaryOrAnywhere
      maximumLineCount: 2
    }
  }
}
