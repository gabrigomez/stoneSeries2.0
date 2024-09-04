import QtQuick

import "../templates" as Templates

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

  property var startYear: getYear(startDate)
  property var endYear: getYear(endDate)
  property var statusIcon: getStatusIcon(status)

  property bool isFetchFinished: false

  Templates.ShowDetailsTemplate {
    favButtonBg: showDetails.favButtonBg
    favButtonText: showDetails.favButtonText
    castData: castModel
  }

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

  Component.onCompleted: {
    apiController.fetchShowDetails(showId)
    apiController.fetchCast(showId)

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

  ListModel {
    id: castModel
  }

  Connections {
    target: apiController
    function onShowDetailsFetched(details) {
      showDetails.name = details.name
      showDetails.image = details.image?.original
      showDetails.rating = details.rating.average.toString()
      showDetails.imdbLink = details.imdbLink

      showDetails.genres = details?.genres.length === 0 ? null : details.genres
      showDetails.description = details.summary
      showDetails.startDate = details?.premiered
      showDetails.endDate = details?.ended
      showDetails.status = details?.status
    }

    function onCastFetched(cast) {
      castModel?.clear()
      const results = cast.map(item => ({
                                          "name": item.person.name,
                                          "imageUrl": item.person.image?.medium,
                                          "id": item.person.id
                                        }))

      results.map(cast => castModel.append(cast))
      showDetails.isFetchFinished = true // only load the component after all api calls
    }

    function onErrorOccurred(errorString) {
      console.error("Error:", errorString)
    }
  }
}
