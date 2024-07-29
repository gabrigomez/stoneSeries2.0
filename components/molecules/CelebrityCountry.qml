import QtQuick

Rectangle {
  width: countryIcon.width + celebrityCountry.contentWidth + 20
  anchors {
    bottom: parent.bottom
    left: celebrityName.left
  }

  Image {
    id: countryIcon
    source: "../../assets/BornAt.png"
    width: 30
    height: 30
  }

  Text {
    id: celebrityCountry

    anchors {
      top: countryIcon.top
      topMargin: 8
      left: countryIcon.right
      leftMargin: 5
    }

    text: celebrityDetails?.country ? celebrityDetails.country : ""
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
