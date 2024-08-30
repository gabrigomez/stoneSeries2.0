import QtQuick

Rectangle {
  id: episodeListTemplate
  width: 1300
  height: 850
  anchors.centerIn: parent

  color: "red"

  Text {
    text: "Episode List"
    font.pixelSize: 22
    anchors.horizontalCenter: parent.horizontalCenter
  }
}
