import QtQuick

Image {
  id: genresIcon
  source: "../../assets/GenresIcon.png"
  width: 24
  height: 24

  anchors {
    left: parent.left
    top: showName.bottom
  }
}
