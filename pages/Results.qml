import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts
import "../Api.js" as Api

import "../components" as Components

Item {
  Rectangle {
    id: searchedShowCards
    width: root.width
    height: 820
    x: 10
    y: 10

    color: "transparent"

    ListView {
      anchors.fill: parent
      orientation: Qt.Horizontal
      spacing: 40
      model: ListModel {
        id: resultsModel
        ListElement {
          name: ""
          imageUrl: ""
          rating: ""
          _id: ""
        }
      }
      delegate: Components.ShowCard {
        id: homeCards
        text: name
        image: imageUrl
        showRating: rating

        height: 820

        MouseArea {
          anchors.fill: parent
          onClicked: () => {
                       showId = _id
                       stackView.push("../pages/Show.qml")
                     }
        }
      }
    }
  }

  Component.onCompleted: {
    console.log('chamou resultados')
    Api.fetchShows(searchText).then(result => {
                                      resultsModel.clear()
                                      if (result.length === 0) {
                                        stackView.push("../pages/NotFound.qml")
                                      }
                                      const shows = result.map(item => ({
                                                                          "name": item.show.name,
                                                                          "imageUrl": item.show.image ? item.show.image.original : "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg",
                                                                          "rating": item.show.rating.average ? `${item.show.rating.average.toString()}/10` : "SEM NOTA",
                                                                          "_id": item.show.id.toString()
                                                                        }))
                                      shows.forEach(
                                        show => resultsModel.append(show))
                                    }).catch(error => {
                                               console.error(error)
                                             })
  }
}
