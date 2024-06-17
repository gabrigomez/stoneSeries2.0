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
    model: showDetails.genres ? showDetails.genres : []
    Text {
      text: modelData + (index < showGenresRepeater.count - 1 ? ", " : "")
      color: "black"
      font.family: bodyFont.font.family
      font.pixelSize: 22

      style: Text.Outline
      styleColor: "lightgray"
      wrapMode: Text.Wrap
    }
  }
}
