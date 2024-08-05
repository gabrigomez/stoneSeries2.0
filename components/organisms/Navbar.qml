import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

import "../atoms" as Atoms
import "../organisms" as Organisms
import "../molecules" as Molecules

Rectangle {
  id: navBar
  height: 100
  width: parent.width
  color: settingsConfig.navBarColor

  border.color: "black"

  ColorDialog {
    id: navBarColorDialog

    onAccepted: {
      settingsConfig.navBarColor = navBarColorDialog.selectedColor
    }
  }

  Organisms.UserOptions {
    id: optionsMenuButton
  }

  Atoms.UserNameInfo {
    id: userNameInfo
  }

  Molecules.FavCount {
    id: favCount
  }

  Molecules.ThemeButton {
    id: themeButton
    target: "navBar"

    anchors {
      left: userNameInfo.right
      leftMargin: 50
      verticalCenter: parent.verticalCenter
    }

    width: 34
    height: 34
  }

  Atoms.LogoIcon {}

  Atoms.AppTitle {
    id: title
  }

  Molecules.Search {
    id: search
  }
}
