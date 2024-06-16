import QtQuick

Text {
  id: trendingShowRating
  anchors {
    bottom: showCardContainer.bottom
    right: showCardContainer.right
  }
  color: "white"
  text: ""
  style: Text.Outline
  styleColor: "black"
  font.family: titleFont.font.family
  font.pixelSize: 30
}
