import QtQuick

Rectangle {
  id: celebrityDetailsInfo
  width: 512
  height: 850

  anchors.horizontalCenter: parent.horizontalCenter
  y: 10
  visible: true

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

    // visible: showImage.status === 1 ? true : false
    // opacity: showImage.status === 1 ? true : false
    Behavior on opacity {
      PropertyAnimation {
        duration: 500
        easing.type: Easing.InOutQuad
      }
    }
  }

  Component.onCompleted: {
    apiController.fetchCelebrityDetails(celebrity_id)
  }
}
