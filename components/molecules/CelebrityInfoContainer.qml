import QtQuick

Rectangle {
  width: celebrityInfoIcon.width + celebrityInfoText.contentWidth + 20
  height: 36
  color: "transparent"

  property alias imgSource: celebrityInfoIcon.source
  property alias info: celebrityInfoText.text

  Image {
    id: celebrityInfoIcon
    width: 30
    height: 30
  }

  Text {
    id: celebrityInfoText

    anchors {
      top: celebrityInfoIcon.top
      topMargin: 8
      left: celebrityInfoIcon.right
      leftMargin: 5
    }
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
