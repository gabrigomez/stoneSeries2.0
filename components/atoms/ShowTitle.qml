import QtQuick

Text {
  id: trendingShowTitle
  width: infoCardImage.width
  anchors {
    top: infoCardImage.bottom
    topMargin: 10
  }

  color: "white"
  text: ""

  style: Text.Outline
  styleColor: "black"

  font.family: bodyFont.font.family
  font.pixelSize: 40
  maximumLineCount: 2
  wrapMode: Text.Wrap
}
