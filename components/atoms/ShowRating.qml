import QtQuick

Text {
  id: trendingShowRating

  color: "white"
  text: ""
  style: Text.Outline
  styleColor: "black"

  font.family: titleFont.font.family
  font.pixelSize: trendingShowRating.text === "SEM NOTA" ? 24 : 32
}
