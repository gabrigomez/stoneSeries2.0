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
      anchors {
        top: celebrityImage.bottom
        topMargin: 10
      }

      text: celebrityDetails?.name ? celebrityDetails.name : ""
      x: 5

      color: "white"
      style: Text.Outline
      styleColor: "black"
      font.family: bodyFont.font.family
      font.pixelSize: 50

      wrapMode: Text.WrapAtWordBoundaryOrAnywhere
      maximumLineCount: 2
    }

    //TODO: Birthday molecule
    Image {
      id: birthdayIcon
      source: "../../assets/Birthday.png"
      width: 30
      height: 30

      anchors {
        top: celebrityName.bottom
        topMargin: 10
        left: celebrityName.left
      }
    }

    Text {
      id: celebrityBirthday

      anchors {
        top: birthdayIcon.top
        topMargin: 8
        left: birthdayIcon.right
        leftMargin: 5
      }

      text: celebrityDetails?.birthday ? celebrityDetails.birthday : ""
      x: 5

      color: "white"
      style: Text.Outline
      styleColor: "black"
      font.family: bodyFont.font.family
      font.pixelSize: 16

      wrapMode: Text.WrapAtWordBoundaryOrAnywhere
      maximumLineCount: 2
    }

    //TODO: Deathday molecule
    Image {
      id: deathdayIcon
      source: "../../assets/Deathday.png"
      width: 30
      height: 30
      visible: celebrityDetails.deathday ? true : false

      anchors {
        top: birthdayIcon.bottom
        topMargin: 10
        left: birthdayIcon.left
      }
    }

    Text {
      id: celebrityDeathday
      visible: celebrityDetails.deathday ? true : false

      anchors {
        top: deathdayIcon.top
        topMargin: 4
        left: deathdayIcon.right
        leftMargin: 5
      }

      text: celebrityDetails?.deathday ? celebrityDetails.deathday : ""
      x: 5

      color: "white"
      style: Text.Outline
      styleColor: "black"
      font.family: bodyFont.font.family
      font.pixelSize: 16

      wrapMode: Text.WrapAtWordBoundaryOrAnywhere
      maximumLineCount: 2
    }
  }
}
