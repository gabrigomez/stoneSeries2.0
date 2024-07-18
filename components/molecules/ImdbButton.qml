import QtQuick
import QtQuick.Controls

Button {
  id: imdbButton
  width: 46
  height: 28

  anchors {
    top: favShowButton.top
    topMargin: 4
    left: favShowButton.right
    leftMargin: 14
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
