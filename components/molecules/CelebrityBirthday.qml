import QtQuick

Rectangle {
  width: birthdayIcon.width + celebrityBirthday.contentWidth + 20
  anchors {
    top: celebrityName.bottom
    topMargin: 10
    left: celebrityCountryContainer.right
    leftMargin: 16
  }

  Image {
    id: birthdayIcon
    source: "../../assets/Birthday.png"
    width: 30
    height: 30
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
}
