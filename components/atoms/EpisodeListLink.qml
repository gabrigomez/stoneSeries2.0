import QtQuick

Text {
  text: "Episode list"
  anchors {
    top: statusIcon.top
    topMargin: 12
    left: statusIcon.right
    leftMargin: 20
  }

  color: mouseAreaLink.containsMouse ? "#2D2D2D" : "black"
  font.pixelSize: 16
  font.family: bodyFont.font.family

  MouseArea {
    id: mouseAreaLink
    hoverEnabled: true
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor

    onClicked: () => {
                 stackView.push("../pages/EpisodeList.qml")
               }
  }
}
