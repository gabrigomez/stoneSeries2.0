import QtQuick

import "../molecules" as Molecules

Rectangle {
  id: celebrityDetailsInfoCard
  width: 500
  height: 800

  x: 6
  y: 4
  color: "transparent"

  visible: celebrityImage.status === 1 ? true : false
  opacity: celebrityImage.status === 1 ? true : false

  property int imageStatus: celebrityImage.status

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
    width: 500

    text: celebrityDetails?.name ? celebrityDetails.name : ""
    x: 5

    color: "white"
    style: Text.Outline
    styleColor: "black"
    font.family: bodyFont.font.family
    font.pixelSize: 38

    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    maximumLineCount: 2
  }

  Text {
    id: celebrityAge
    anchors {
      top: celebrityName.bottom
      topMargin: 4
    }
    text: celebrityDetails?.age ? celebrityDetails.age + " years" : ""
    x: 5

    color: "white"
    style: Text.Outline
    styleColor: "black"
    font.family: bodyFont.font.family
    font.pixelSize: 24
  }

  Molecules.CelebrityInfoContainer {
    id: celebrityCountryContainer
    info: celebrityDetails?.country ? celebrityDetails.country : ""
    imgSource: "../../assets/BornAt.png"

    anchors {
      bottom: parent.bottom
      left: celebrityName.left
    }
  }

  Molecules.CelebrityInfoContainer {
    id: celebrityBirthdayContainer
    info: celebrityDetails?.birthday ? celebrityDetails.birthday : ""
    imgSource: "../../assets/Birthday.png"

    anchors {
      bottom: parent.bottom
      left: celebrityCountryContainer.right
    }
  }

  Molecules.CelebrityInfoContainer {
    id: celebrityDeathdayContainer
    visible: celebrityDetails.deathday ? true : false
    info: celebrityDetails?.deathday ? celebrityDetails.deathday : ""
    imgSource: "../../assets/Deathday.png"

    anchors {
      bottom: parent.bottom
      left: celebrityBirthdayContainer.right
    }
  }
}
