import QtQuick

Image {
  source: "../../assets/NotFound.png"
  height: 120
  width: 120
  anchors {
    horizontalCenter: parent.horizontalCenter
    bottom: noResultsMessage.top
    bottomMargin: 20
  }
}
