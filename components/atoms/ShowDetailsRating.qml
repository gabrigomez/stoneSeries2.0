import QtQuick

Text {
  id: showRating
  anchors {
    bottom: showMainInfoCard.bottom
    right: showMainInfoCard.right
  }

  text: showDetails?.rating ? `${showDetails?.rating.toString(
                                )}/10` : "SEM NOTA"
  color: "white"

  style: Text.Outline
  styleColor: "black"
  font.family: titleFont.font.family
  font.pixelSize: 28
}
