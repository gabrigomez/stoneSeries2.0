import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

import "../atoms" as Atoms
import "../molecules" as Molecules

RoundButton {
  id: optionsMenuButton
  height: 55
  width: 55
  anchors {
    left: parent.left
    leftMargin: 10
    verticalCenter: parent.verticalCenter
  }

  action: optionsMenuAction

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
      searchController.clear()
    }
  }

  background: Atoms.UserOptionsBackground {}

  MultiEffect {
    //to cut the userAvatar
    source: userNavbarAvatar
    anchors.fill: userNavbarAvatar
    maskEnabled: true
    maskSource: mask
  }

  Atoms.AvatarImage {
    id: userNavbarAvatar
  }

  Atoms.Mask {
    id: mask
    width: userNavbarAvatar.width
    height: userNavbarAvatar.height
  }

  Molecules.UserOptionsActions {
    id: optionsMenu
  }

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: optionsMenuAction.trigger()
  }
}
