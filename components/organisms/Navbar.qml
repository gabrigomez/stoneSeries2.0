import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

import "../atoms" as Atoms
import "../organisms" as Organisms
import "../molecules" as Molecules

Rectangle {
  id: navBar
  height: 80
  width: parent.width
  color: settingsConfig.navBarColor

  border.color: "black"

  ColorDialog {
    id: navBarColorDialog

    onAccepted: {
      settingsConfig.navBarColor = navBarColorDialog.selectedColor
    }
  }

  Molecules.ThemeButton {
    id: themeButton
    target: "navBar"

    anchors {
      right: search.left
      rightMargin: 30
      verticalCenter: parent.verticalCenter
    }

    width: 34
    height: 34
  }

  Molecules.Search {
    id: search
  }

  Atoms.LogoIcon {}

  Organisms.UserOptions {
    id: optionsMenuButton
  }

  Atoms.UserNameInfo {}

  Atoms.AppTitle {
    id: title
  }
}
