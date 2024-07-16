import QtQuick
import QtQuick.Controls

Button {
  id: imdbButton
  width: 46
  height: 28

  anchors {
    left: statusIcon.right
    leftMargin: 10
    top: statusIcon.top
    topMargin: 6
  }

  background: Rectangle {
    color: "transparent"
  }

  Image {
    source: "../../assets/ImdbLogo.png"
    anchors.centerIn: parent
  }

  MouseArea {
    cursorShape: Qt.PointingHandCursor
    anchors.fill: parent
    onClicked: () => {
                 Qt.openUrlExternally(showDetails.imdbLink)
               }
  }
}
