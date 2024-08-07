import QtQuick

Row {
  id: showGenresRow
  anchors {
    bottom: genresIcon.bottom
    left: genresIcon.right
    leftMargin: 4
  }

  spacing: 2

  Repeater {
    id: showGenresRepeater
    model: showDetails.genres === null ? ["No Info"] : showDetails.genres
    Text {
      text: modelData + (index < showGenresRepeater.count - 1 ? ", " : "")
      font.family: bodyFont.font.family
      font.pixelSize: 22

      color: "white"
      style: Text.Outline
      styleColor: "black"
      wrapMode: Text.Wrap
    }
  }
}
