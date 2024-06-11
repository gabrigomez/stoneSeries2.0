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
        stackView.pop()
        listView.currentIndex = -1
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
    action: optionsMenuAction

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
      x: 10
      transformOrigin: Menu.BottomLeft
      Action {
        text: qsTr("Settings")
        onTriggered: stackView.push("pages/Settings.qml")
      }

      Action {
        text: qsTr("About")
        onTriggered: aboutDialog.open()
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
    font.family: bodyFont.font.family
    font.pixelSize: 20
  }

  Dialog {
    id: aboutDialog
    modal: true
    focus: true
    title: qsTr("About")
    x: (root.width - width) / 2
    y: root.height / 6
    width: 400
    contentHeight: aboutColumn.height

    Column {
      id: aboutColumn
      spacing: 20

      Text {
        width: aboutDialog.availableWidth
        text: qsTr("STONE SERIES 2.0")
        wrapMode: Label.Wrap
        font.pixelSize: 20
      }

      Text {
        width: aboutDialog.availableWidth
        text: qsTr(
                "Projeto desenvolvido como parte do deseafio técnico para vaga de Software Engineer na Stone.")
        wrapMode: Label.Wrap
        font.pixelSize: 20
      }
    }
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
