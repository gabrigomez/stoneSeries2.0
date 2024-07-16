import QtQuick
import QtQuick.Controls.Material 2.12

import "../organisms" as Organisms

Rectangle {
  id: showDetails
  width: parent?.width
  height: parent?.height
  color: "white"

  property var name
  property var image
  property var genres
  property var rating
  property var description
  property var startDate
  property var endDate
  property var status
  property var imdbLink

  property string favButtonText
  property string favButtonBg

  function getYear(date) {
    if (date) {
      var dateParts = date.split("-")
      if (dateParts.length > 0) {
        return dateParts[0]
      }
    }
  }

  function getStatusIcon(status) {
    if (status === "Ended") {
      return "../../assets/Ended.png"
    } else if (status === "Running") {
      return "../../assets/OnAir.png"
    } else {
      return "../../assets/Doubt.png"
    }
  }

  property var startYear: getYear(startDate)
  property var endYear: getYear(endDate)
  property var statusIcon: getStatusIcon(status)

  Organisms.ShowDetailsInfo {
    id: showDetailsCard
  }

  BusyIndicator {
    id: busyIndicator
    visible: showDetails?.description ? false : true

    anchors {
      top: showDetails.top
      left: showDetailsCard.right
      topMargin: 60
      leftMargin: 150
    }

    width: 281
    height: 281
    Material.accent: settingsConfig.themeColor
  }

  Organisms.ShowDetailsDescriptionCard {
    id: showDescriptionCard
    visible: showDetails?.description ? true : false

    favButtonText: showDetails.favButtonText
    favButtonBgColor: showDetails.favButtonBg
  }

  Component.onCompleted: {
    apiController.fetchShowDetails(showId)
    var favList = settingsConfig.favShowsList
    var index = favList.findIndex(show => show._id === showId.toString())

    if (index === -1) {
      showDetails.favButtonText = "Adicionar aos favoritos"
      showDetails.favButtonBg = "#08FF5B"
    } else {
      showDetails.favButtonText = "Remover dos favoritos"
      showDetails.favButtonBg = "red"
    }
  }

  Connections {
    target: apiController
    function onShowDetailsFetched(details) {
      showDetails.name = details.name
      showDetails.image = details.image?.original
      showDetails.rating = details.rating.average.toString()

      showDetails.genres = details?.genres.length === 0 ? null : details.genres
      showDetails.description = details.summary
      showDetails.startDate = details?.premiered
      showDetails.endDate = details?.ended
      showDetails.status = details?.status
    }

    function onErrorOccurred(errorString) {
      console.error("Error:", errorString)
    }
  }
}
