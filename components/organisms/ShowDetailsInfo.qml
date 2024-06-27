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
    visible: busy
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
    visible: !busy

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

    Atoms.ShowDetailsRating {
      id: showRating
    }

    Atoms.CalendarIcon {
      id: calendarIcon
    }

    Molecules.ShowDetailsYears {}
  }
}
