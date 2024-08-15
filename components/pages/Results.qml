import QtQuick
import QtQuick.Controls.Material 2.12

import "../templates" as Templates

Item {
  ListModel {
    id: resultsModel
  }

  Templates.ResultsTemplate {
    resultsData: resultsModel
  }

  Component.onCompleted: {
    if (searchType === 0) {
      apiController.fetchShows(searchController.search)
    } else {
      apiController.fetchCelebrities(searchController.search)
    }
  }

  Connections {
    target: apiController
    function onShowsFetched(shows) {
      resultsModel?.clear()
      if (shows.length === 0) {
        stackView.push("./NotFound.qml")
      }
      const results = shows.map(item => ({
                                           "name": item.show.name,
                                           "imageUrl": item.show.image.original,
                                           "rating": item.show.rating.average.toString(
                                                       ),
                                           "_id": item.show.id.toString()
                                         }))

      results.map(show => resultsModel.append(show))
    }

    function onCelebritiesFetched(celebrities) {
      resultsModel?.clear()
      if (celebrities.length === 0) {
        stackView.push("./NotFound.qml")
      }
      const results = celebrities.map(item => ({
                                                 "name": item.person.name,
                                                 "imageUrl": item.person.image.original,
                                                 "rating": "",
                                                 "_id": item.person.id.toString(
                                                          )
                                               }))

      results.map(show => resultsModel.append(show))
    }

    function onErrorOccurred(errorString) {
      console.error("Error:", errorString)
    }
  }
}
