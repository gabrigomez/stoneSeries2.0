import QtQuick

Text {
  id: title
  text: "STONE SERIES 2.0"
  color: "white"
  anchors {
    left: navBar.left
    leftMargin: 38
    centerIn: parent
  }

  font.family: titleFont.font.family
  font.pixelSize: 28
  style: Text.Outline
  styleColor: "black"
}
