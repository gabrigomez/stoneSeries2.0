import QtQuick

Text {
  id: showName
  width: showImage.width
  height: 100
  anchors {
    top: showImage.bottom
    topMargin: 10
    bottomMargin: 10
  }

  text: showDetails?.name ? showDetails.name : ""

  color: "white"
  style: Text.Outline
  styleColor: "black"

  font.family: bodyFont.font.family
  font.pixelSize: 40
  wrapMode: Text.WrapAtWordBoundaryOrAnywhere
  maximumLineCount: 2
}
