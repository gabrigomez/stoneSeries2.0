import QtQuick

Text {
  id: noResultsMessage
  anchors {
    top: notFoundImage.bottom
    topMargin: 10
    horizontalCenter: parent.horizontalCenter
  }

  color: "black"
  font.pixelSize: 40
}
