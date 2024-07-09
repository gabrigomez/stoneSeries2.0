import QtQuick
import QtQuick.Controls.Material 2.12

import "../atoms" as Atoms
import "../molecules" as Molecules

Rectangle {
  id: showDetailsCard
  width: 512
  height: 850

  x: 500
  y: 10
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
    visible: showImage.status === 1 ? false : true
    anchors.centerIn: parent
    width: 281
    height: 281
    Material.accent: settingsConfig.themeColor === "#000000" ? "white" : "black"
  }

  Rectangle {
    id: showMainInfoCard
    width: 500
    height: 840

    x: 6
    y: 4
    color: "transparent"
    visible: showImage.status === 1 ? true : false

    Atoms.ShowDetailsImage {
      id: showImage
    }

    Atoms.ShowDetailsTitle {
      id: showName
    }

    Atoms.GenresIcon {
      id: genresIcon
    }

    Molecules.GenresInfo {
      id: showGenresRow
    }

    Atoms.RatingIcon {
      id: ratingShowImage

      anchors {
        right: showRating.left
        rightMargin: 4
        bottom: showRating.bottom
        bottomMargin: showDetails.rating === "SEM NOTA" ? 4 : 8
      }
    }

    Atoms.ShowDetailsRating {
      id: showRating
    }

    Atoms.CalendarIcon {
      id: calendarIcon
    }

    Molecules.ShowDetailsYears {}
  }
}
