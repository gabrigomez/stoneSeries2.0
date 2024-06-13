import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

Rectangle {
  id: navBar
  height: 60
  width: parent.width
  color: "#27AE60"

  border.color: "black"

  Action {
    id: optionsMenuAction
    onTriggered: {
      if (stackView.depth > 1) {
        //returns directly to home in noResultsPage
        if (stackView.currentItem.objectName === "noResultsPage") {
          stackView.pop(null)
        } else {
          stackView.pop()
        }
      } else {
        optionsMenu.open()
      }
    }
  }

  Search {
    id: searchInput

    anchors {
      right: parent.right
      rightMargin: 4
      verticalCenter: parent.verticalCenter
    }
  }

  Image {
    source: "assets/Logo.png"
    width: 28
    height: 28
    anchors {
      right: title.left
      rightMargin: 4
    }
    y: 16
  }

  RoundButton {
    id: optionsMenuButton
    height: 55
    width: 55

    background: Rectangle {
      anchors.fill: parent
      color: optionsMenuButton.hovered ? "black" : "white"
      border.color: "silver"
      radius: 40

      Behavior on color {
        PropertyAnimation {
          duration: 200
          easing.type: Easing.InOutQuad
        }
      }
    }

    anchors {
      left: parent.left
      leftMargin: 10
      verticalCenter: parent.verticalCenter
    }
    MultiEffect {
      //to cut the userAvatar
      source: userNavbarAvatar
      anchors.fill: userNavbarAvatar
      maskEnabled: true
      maskSource: mask
    }

    Image {
      id: userNavbarAvatar
      source: stackView.depth > 1 ? "assets/BackIcon.png" : settingsConfig.userAvatar
      width: 50
      height: 50
      anchors.centerIn: parent
      visible: false
    }

    Item {
      id: mask
      width: userNavbarAvatar.width
      height: userNavbarAvatar.height
      layer.enabled: true
      visible: false

      Rectangle {
        width: userNavbarAvatar.width
        height: userNavbarAvatar.height
        radius: width / 2
        color: "black"
      }
    }

    Menu {
      id: optionsMenu
      x: 4
      y: 60

      Action {
        text: qsTr("Meus favoritos")
        onTriggered: stackView.push("pages/FavShows.qml")
      }

      Action {
        text: qsTr("Configurações")
        onTriggered: stackView.push("pages/Settings.qml")
      }

      Action {
        text: qsTr("Sobre")
        onTriggered: Qt.openUrlExternally(
                       "https://github.com/gabrigomez/stoneSeries2.0")
      }
    }
    MouseArea {
      anchors.fill: parent
      cursorShape: Qt.PointingHandCursor
      onClicked: {
        optionsMenu.open()
      }
    }
  }

  Text {
    id: userNameInfo
    anchors {
      left: optionsMenuButton.right
      leftMargin: 10
      verticalCenter: parent.verticalCenter
    }
    text: "Olá, " + settingsConfig.userName + "!"
    color: "white"
    font.family: bodyFont.font.family
    font.pixelSize: 20

    style: Text.Outline
    styleColor: "black"
  }

  Text {
    id: title
    text: "STONE SERIES 2.0"
    color: "white"
    anchors {
      left: navBar.left
      leftMargin: 38
      //verticalCenter: parent.verticalCenter
      centerIn: parent
    }

    font.family: titleFont.font.family
    font.pixelSize: 28
    style: Text.Outline
    styleColor: "black"
  }
}
