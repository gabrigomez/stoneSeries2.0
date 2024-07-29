import QtQuick
import QtQuick.Controls.Material 2.12

import "../molecules" as Molecules

Item {
  id: celebrityDetailsInfoContainer
  width: root.width
  height: 900

  BusyIndicator {
    id: busyIndicator
    visible: celebrityImage.status === 1 ? false : true
    anchors.centerIn: parent

    width: 281
    height: 281
    Material.accent: settingsConfig.themeColor
  }

  Rectangle {
    id: celebrityDetailsInfo
    width: 512
    height: 800

    y: 10
    x: 1000
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
      height: 750

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

      Molecules.CelebrityCountry {
        id: celebrityCountryContainer
      }

      Molecules.CelebrityBirthday {
        id: celebrityBirthdayContainer
      }

      Molecules.CelebrityDeathday {
        id: celebrityDeathdayContainer
      }
    }
  }
}
