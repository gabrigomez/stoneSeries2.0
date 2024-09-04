import QtQuick

Rectangle {
  id: episodeDetailsPage

  property var episodeTitle
  property var episodeImage

  Text {
    text: episodeDetailsPage.episodeTitle
    anchors.centerIn: parent
  }

  Component.onCompleted: {
    apiController.fetchEpisodeDetails(episodeId)
  }

  Connections {
    target: apiController

    function onEpisodeDetailsFetched(details) {
      episodeDetailsPage.episodeTitle = details.name
      episodeDetailsPage.episodeImage = details.image.original
    }

    function onErrorOccurred(errorString) {
      console.error("Error:", errorString)
    }
  }
}
