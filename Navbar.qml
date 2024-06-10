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

  Text {
    id: title
    text: "STONE SERIES 2.0"
    color: "white"
    anchors {
      left: navBar.left
      leftMargin: 10
      verticalCenter: parent.verticalCenter
    }

    font.family: titleFont.font.family
    font.pixelSize: 28
    style: Text.Outline
    styleColor: "black"
  }
}
