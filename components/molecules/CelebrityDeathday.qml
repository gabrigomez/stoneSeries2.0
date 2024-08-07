import QtQuick

Rectangle {
  width: deathdayIcon.width + celebrityDeathday.contentWidth + 20
  height: 36
  anchors {
    bottom: parent.bottom
    left: celebrityBirthdayContainer.right
    leftMargin: 10
  }

  color: "transparent"

  Image {
    id: deathdayIcon
    source: "../../assets/Deathday.png"
    width: 30
    height: 30
    visible: celebrityDetails.deathday ? true : false
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
