import QtQuick

import "../templates" as Templates

Rectangle {
  id: episodeDetailsPage

  property var episodeTitle
  property var episodeImage
  property var episodeSinopse
  property var episodeAirdate
  property var episodeRating

  Templates.EpisodeDetailsTemplate {}

  Component.onCompleted: {
    apiController.fetchEpisodeDetails(episodeId)
  }

  Connections {
    target: apiController

    function onEpisodeDetailsFetched(details) {
      episodeDetailsPage.episodeTitle = details.name
      episodeDetailsPage.episodeImage = details.image.original
      episodeDetailsPage.episodeSinopse = details.summary

      episodeDetailsPage.episodeAirdate = "Airdate: " + details.airdate
      episodeDetailsPage.episodeRating = details.rating.average
    }

    function onErrorOccurred(errorString) {
      console.error("Error:", errorString)
    }
  }
}
