import QtQuick

Rectangle {
  id: noFavListShow
  anchors.fill: parent
  visible: false

  Text {
    anchors.centerIn: parent
    text: "Nenhuma série favoritada :("
    font.pixelSize: 40
  }
}
