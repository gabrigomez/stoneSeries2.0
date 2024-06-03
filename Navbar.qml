import QtQuick

Rectangle {
  id: navBar

  height: 50
  width: parent.width
  color: "#27AE60"

  FontLoader {
    id: titleFont
    source: "fonts/TopShow.otf"
  }

  Text {
    id: title
    anchors {
      centerIn: parent
    }
    text: "STONE SERIES 2.0"

    font.family: titleFont.font.family
    font.pixelSize: 32
    style: Text.Outline
    styleColor: "lightgray"
  }
}
