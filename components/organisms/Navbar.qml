import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

import "../atoms" as Atoms
import "../organisms" as Organisms
import "../molecules" as Molecules

Rectangle {
  id: navBar
  height: 60
  width: parent.width
  color: "#27AE60"

  border.color: "black"

  Molecules.Search {}

  Atoms.LogoIcon {}

  Organisms.UserOptions {
    id: optionsMenuButton
  }

  Atoms.UserNameInfo {}

  Atoms.AppTitle {
    id: title
  }
}
