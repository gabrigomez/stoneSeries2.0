import QtQuick
import QtQuick.Layouts

Rectangle {
  id: navBar
  height: 60
  width: parent.width
  color: "#27AE60"

  border.color: "black"

  Search {
    id: searchInput

    anchors {
      right: parent.right
      rightMargin: 4
      verticalCenter: parent.verticalCenter
    }
  }

  Image {
    source: "assets/Logo.png"
    width: 28
    height: 28
    anchors {
      right: title.left
      rightMargin: 4
    }
    y: 16
  }

  Text {
    id: title
    text: "STONE SERIES 2.0"
    color: "white"
    anchors {
      left: navBar.left
      leftMargin: 38
      verticalCenter: parent.verticalCenter
    }

    font.family: titleFont.font.family
    font.pixelSize: 28
    style: Text.Outline
    styleColor: "black"
  }
}
