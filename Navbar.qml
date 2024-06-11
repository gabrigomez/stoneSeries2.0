import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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
    height: 40
    width: 40
    action: optionsMenuAction

    anchors {
      left: parent.left
      leftMargin: 10
      verticalCenter: parent.verticalCenter
    }

    Image {
      source: stackView.depth > 1 ? "assets/BackIcon.png" : "assets/Settings.png"
      width: 30
      height: 30
      anchors.centerIn: parent
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

  Dialog {
    id: aboutDialog
    modal: true
    focus: true
    title: qsTr("About")
    x: (root.width - width) / 2
    y: root.height / 6
    width: Math.min(root.width, root.height) / 3 * 2
    contentHeight: aboutColumn.height

    Column {
      id: aboutColumn
      spacing: 20

      Label {
        width: aboutDialog.availableWidth
        text: qsTr(
                "The Qt Quick Controls module delivers the next generation user interface controls based on Qt Quick.")
        wrapMode: Label.Wrap
        font.pixelSize: 12
      }

      Label {
        width: aboutDialog.availableWidth
        text: qsTr("In comparison to Qt Quick Controls 1, Qt Quick Controls "
                   + "are an order of magnitude simpler, lighter, and faster.")
        wrapMode: Label.Wrap
        font.pixelSize: 12
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
