import QtQuick

Image {
  id: calendarIcon
  source: "../../assets/CalendarIcon.png"
  width: 24
  height: 24

  anchors {
    left: parent.left
    top: showGenresRow.bottom
    topMargin: 4
  }
}
