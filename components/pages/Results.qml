import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts

import "../../Api.js" as Api
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
      delegate: Organisms.ShowCard {
        id: homeCards
        text: name
        image: imageUrl
        showRating: rating

        height: 820

        MouseArea {
          anchors.fill: parent
          onClicked: () => {
                       showId = _id
                       stackView.push("./ShowDetails.qml")
                     }
        }
      }
    }
  }

  Component.onCompleted: {
    Api.fetchShows(searchController.search).then(result => {
                                                   resultsModel.clear()
                                                   if (result.length === 0) {
                                                     stackView.push(
                                                       "./NotFound.qml")
                                                   }
                                                   const shows = result.map(
                                                     item => ({
                                                                "name": item.show.name,
                                                                "imageUrl": item.show.image ? item.show.image.original : "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg",
                                                                "rating": item.show.rating.average ? `${item.show.rating.average.toString()}/10` : "SEM NOTA",
                                                                "_id": item.show.id.toString()
                                                              }))
                                                   shows.forEach(
                                                     show => resultsModel.append(
                                                       show))
                                                 }).catch(error => {
                                                            console.error(error)
                                                          })
  }
}
