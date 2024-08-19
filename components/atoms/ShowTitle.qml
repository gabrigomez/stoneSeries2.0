import QtQuick

Text {
  id: trendingShowTitle
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
  width: infoCardImage.width
  wrapMode: Text.Wrap
}
