import QtQuick

Image {
  id: calendarIcon
  source: "../../assets/CalendarIcon.png"
  width: 24
  height: 24

  anchors {
    left: parent.left
    leftMargin: 4
    top: showGenresRow.bottom
    topMargin: 4
  }
}
