import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material 2.12

import "../../Api.js" as Api
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

  property string favButtonText
  property string favButtonBg

  property var startYear: {
    if (startDate) {
      var dateParts = startDate.split("-")
      if (dateParts.length > 0) {
        return dateParts[0]
      }
    }
    return ""
  }

  property var endYear: {
    if (endDate) {
      var dateParts = endDate.split("-")
      if (dateParts.length > 0) {
        return dateParts[0]
      }
    }
    return ""
  }

  Organisms.ShowDetailsInfo {
    id: showDetailsCard
  }

  Organisms.ShowDetailsDescriptionCard {
    id: showDescriptionCard
    favButtonText: showDetails.favButtonText
    favButtonBgColor: showDetails.favButtonBg
  }

  Component.onCompleted: {
    console.log('chamou a api no detalhe')
    Api.fetchShowDetails(showId, function (result) {
      showDetails.name = result.name
      showDetails.image = result.image?.original
          ?? 'https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg'
      showDetails.rating = result.rating.average
      showDetails.genres = result.genres
      showDetails.description = result.summary
      showDetails.startDate = result?.premiered
      showDetails.endDate = result?.ended
    })

    var favList = settingsConfig.favShowsList
    var index = favList.findIndex(show => show._id === showId.toString())

    if (index === -1) {
      showDetails.favButtonText = "Adicionar dos favoritos"
      showDetails.favButtonBg = "#08FF5B"
    } else {
      showDetails.favButtonText = "Remover dos favoritos"
      showDetails.favButtonBg = "red"
    }
  }
}
