import QtQuick

Text {
  id: showDetailsStatus
  anchors {
    top: showDescriptionCard.bottom
    topMargin: 24
  }

  text: "Status: " + showDetails.status
  color: "black"
  font.pixelSize: 18
  font.family: bodyFont.font.family
}
