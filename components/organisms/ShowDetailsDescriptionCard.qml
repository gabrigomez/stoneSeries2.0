import QtQuick
import QtQuick.Controls

import "../atoms" as Atoms
import "../molecules" as Molecules

Rectangle {
  id: showDescriptionCard
  width: 500
  height: 100 + showDetailsSummary.height

  property alias favButtonText: favShowButton.text
  property alias favButtonBgColor: favShowButton.bgColor

  anchors {
    left: showDetailsCard.right
    leftMargin: 40
  }
  y: 20

  color: settingsConfig.themeColor
  border {
    color: "black"
    width: 2
  }

  topRightRadius: 5
  topLeftRadius: 5
  bottomRightRadius: 20
  bottomLeftRadius: 20

  Molecules.ShowDetailsDescription {
    id: showDetailsSummary
  }

  Atoms.ShowDetailsStatus {
    id: showDetailsStatus
  }

  Molecules.FavShowButton {
    id: favShowButton
  }
}
