import QtQuick

Text {
  id: showDetailsStatus

  anchors {
    top: showDescriptionCard.bottom
    topMargin: 14
  }

  text: "Status: " + showDetails.status
  font.pixelSize: 18
  color: "black"
}
