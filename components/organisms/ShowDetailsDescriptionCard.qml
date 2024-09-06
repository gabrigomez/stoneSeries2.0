import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material 2.12

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
  property bool isCastLoaded
  property var castModelData

  BusyIndicator {
    id: busyIndicator
    width: 281
    height: 281
    anchors.centerIn: parent

    visible: !flickable.isCastLoaded
    Material.accent: settingsConfig.themeColor
  }

  Rectangle {
    id: showDescriptionCard
    width: 500
    height: 100 + showDetailsSummary.height
    visible: flickable.isCastLoaded

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
      sinopseContent: showDetails?.description ? showDetails.description : "Sem descrição"

      anchors {
        top: showDescriptionCard.top
        left: showDescriptionCard.left
        topMargin: 10
        leftMargin: 10
      }
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

    Atoms.EpisodeListLink {}

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
      castData: flickable.castModelData
    }
  }
}
