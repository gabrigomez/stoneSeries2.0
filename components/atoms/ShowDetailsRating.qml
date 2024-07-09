import QtQuick

Text {
  id: showRating
  anchors {
    bottom: showMainInfoCard.bottom
    right: showMainInfoCard.right
  }

  text: showDetails?.rating ? showDetails.rating : ""
  color: "white"

  style: Text.Outline
  styleColor: "black"
  font.family: titleFont.font.family
  font.pixelSize: 28
}
