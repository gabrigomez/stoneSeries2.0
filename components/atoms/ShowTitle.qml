import QtQuick

Text {
  id: trendingShowTitle
  anchors {
    top: trendingShowImage.bottom
  }
  color: "white"
  text: ""
  style: Text.Outline
  styleColor: "black"
  font.family: bodyFont.font.family
  font.pixelSize: 40

  maximumLineCount: 2
  width: trendingShowImage.width
  wrapMode: Text.Wrap
}
