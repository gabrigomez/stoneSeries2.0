import QtQuick
import QtQuick.Controls.Material 2.12

import "../atoms" as Atoms
import "../molecules" as Molecules

Rectangle {
  id: showDetailsCard
  width: 512
  height: 835

  x: 500
  y: 10
  z: 10
  color: settingsConfig.themeColor

  border {
    color: "black"
    width: 2
  }

  topRightRadius: 5
  topLeftRadius: 5
  bottomRightRadius: 20
  bottomLeftRadius: 20

  BusyIndicator {
    id: busyIndicator
    width: 281
    height: 281
    anchors.centerIn: parent

    visible: showImage.status === 1 ? false : true
    Material.accent: settingsConfig.themeColor === "#000000" ? "white" : "black"
  }

  Rectangle {
    id: showMainInfoCard
    width: 500
    height: 825

    x: 6
    y: 4
    color: "transparent"
    visible: showImage.status === 1 ? true : false
    opacity: showImage.status === 1 ? true : false

    Behavior on opacity {
      PropertyAnimation {
        duration: 500
        easing.type: Easing.InOutQuad
      }
    }

    Atoms.ShowDetailsImage {
      id: showImage
    }

    Atoms.ShowDetailsTitle {
      id: showName
    }

    Molecules.GenresInfo {
      id: showGenresRow
    }

    Molecules.RatingMolecule {
      id: ratingMolecule
      width: 80
      height: 40
      anchors {
        bottom: showMainInfoCard.bottom
        right: showMainInfoCard.right
        rightMargin: 4
      }

      rating: showDetails.rating ? showDetails.rating : ""
    }

    Atoms.CalendarIcon {
      id: calendarIcon
    }

    Molecules.ShowDetailsYears {}
  }
}
