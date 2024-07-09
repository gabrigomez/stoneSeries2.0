import QtQuick

Text {
  id: showRating
  anchors {
    bottom: showMainInfoCard.bottom
    right: showMainInfoCard.right
    rightMargin: 5
  }

  text: showDetails?.rating ? showDetails.rating : ""
  color: "white"

  style: Text.Outline
  styleColor: "black"
  font.family: titleFont.font.family
  font.pixelSize: showDetails.rating === "SEM NOTA" ? 24 : 38
}
