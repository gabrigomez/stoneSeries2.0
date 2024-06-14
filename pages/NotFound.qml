import QtQuick
import QtQuick.Controls

Rectangle {
  id: noResultsPage
  objectName: "noResultsPage"
  width: root.width
  height: 820

  Text {
    id: noResultsMessage
    anchors.centerIn: noResultsPage
    text: "Nenhum resultado encontrado."
    color: "black"
    font.pixelSize: 40
  }

  Image {
    source: "../assets/NotFound.png"
    height: 120
    width: 120
    anchors {
      horizontalCenter: parent.horizontalCenter
      bottom: noResultsMessage.top
      bottomMargin: 20
    }
  }
}
