import QtQuick
import QtQuick.Controls.Material 2.12

import "../organisms" as Organisms

Item {
  BusyIndicator {
    id: busyIndicator
    visible: resultsModel.count === 0 ? true : false

    anchors {
      centerIn: parent
    }

    width: 281
    height: 281
    Material.accent: settingsConfig.themeColor === "#000000" ? "white" : "black"
  }

  Rectangle {
    id: searchedShowCards
    width: root.width - 40
    height: 820
    x: 10
    y: 10

    visible: resultsModel.count > 0 ? true : false
    color: "transparent"

    ListView {
      anchors.fill: parent
      orientation: Qt.Horizontal
      spacing: 40
      model: ListModel {
        id: resultsModel
      }
      delegate: Organisms.InfoCard {
        id: homeCards
        text: name
        image: imageUrl
        showRating: rating

        height: 820

        MouseArea {
          anchors.fill: parent
          onClicked: () => {
                       if (searchType === 0) {
                         showId = _id
                         stackView.push("./ShowDetails.qml")
                       } else {
                         celebrity_id = _id
                         stackView.push("./CelebrityDetails.qml")
                       }
                     }
        }
      }
    }
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
                                                 "imageUrl": item.person.image ? item.person.image?.original : "",
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
