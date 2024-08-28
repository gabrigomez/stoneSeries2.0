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

  Atoms.LogoIcon {}

  Atoms.AppTitle {
    id: title
  }

  Molecules.Search {
    id: search
  }

  Molecules.ThemeButton {
    id: themeButton
    width: 28
    height: 28
    anchors {
      right: parent.right
      rightMargin: 16
    }

    target: "navBar"
    y: 56
  }
}
