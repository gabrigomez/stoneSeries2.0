import QtQuick

Text {
  text: "Episode list"
  anchors {
    top: statusIcon.top
    topMargin: 12
    left: statusIcon.right
    leftMargin: 20
  }

  color: "Black"
  font.pixelSize: 16
  font.family: bodyFont.font.family

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: () => {
                 stackView.push("../pages/EpisodeList.qml")
               }
  }
}
