import QtQuick
import QtQuick.Controls

import "../atoms" as Atoms
import "../molecules" as Molecules

Flickable {
  id: flickable
  width: 500
  height: parent?.height

  anchors {
    left: showDetailsCard.right
    leftMargin: 40
  }

  contentHeight: showDescriptionCard.height + showDetailsStatus.height
                 + showDetailsStatus.height + castCard.height + 500
  y: 20
  clip: true

  property alias favButtonText: favShowButton.text
  property alias favButtonBgColor: favShowButton.bgColor

  Rectangle {
    id: showDescriptionCard
    width: 500
    height: 100 + showDetailsSummary.height

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

    Image {
      id: statusIcon
      source: showDetails.statusIcon
      height: 40
      width: 40

      anchors {
        left: showDetailsStatus.right
        leftMargin: 4
        bottom: showDetailsStatus.bottom
        bottomMargin: -8
      }
    }

    Molecules.FavShowButton {
      id: favShowButton
    }

    Molecules.ImdbButton {
      id: imdbButton
    }

    CastCard {
      id: castCard

      anchors {
        top: favShowButton.bottom
        topMargin: 20
        left: favShowButton.left
      }
    }
  }
}
