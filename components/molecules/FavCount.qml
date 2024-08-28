import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
  id: favCount
  height: 20
  width: 50

  anchors {
    top: userNameInfo.bottom
    topMargin: 6
    left: userNameInfo.left
    leftMargin: -2
  }

  Image {
    id: favCountIcon
    source: "../../assets/GoldStar.png"
    width: 18
    height: 18

    anchors {
      left: favCount.left
      leftMargin: 6
    }
  }

  background: Rectangle {
    anchors.fill: parent
    color: favCount.hovered ? "white" : "#ececec"
    border.color: favCount.hovered ? "silver" : "white"
    radius: 20

    Behavior on color {
      PropertyAnimation {
        duration: 200
        easing.type: Easing.InOutQuad
      }
    }

    Behavior on border.color {
      PropertyAnimation {
        duration: 100
        easing.type: Easing.InOutQuad
      }
    }
  }

  Text {
    text: settingsConfig.favShowsList.length.toString()
    anchors {
      left: favCountIcon.right
      leftMargin: 6
      verticalCenter: parent.verticalCenter
    }

    font.pixelSize: 15
    font.family: bodyFont.font.family
    style: Text.Outline
    styleColor: "white"
  }

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: () => {
                 if (stackView.currentItem.objectName !== "favShowPage") {
                   stackView.push("../pages/FavShows.qml")
                 }
               }
  }
}
