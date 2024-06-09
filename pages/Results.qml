import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts
import "../Api.js" as Api

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
          image: ""
          rating: ""
          _id: ""
        }
      }
      delegate: Rectangle {
        id: homeCards
        color: "#08FF5B"
        border.color: "black"
        border.width: 2

        topRightRadius: 5
        topLeftRadius: 5
        bottomRightRadius: 20
        bottomLeftRadius: 20

        width: 512
        height: 820

        Rectangle {
          x: 6
          y: 6

          BusyIndicator {
            id: busyIndicator
            x: 120
            y: 250
            visible: image === "" ? true : false

            width: 281
            height: 281
            Material.accent: "black"
          }

          Rectangle {
            color: "transparent"
            width: 500
            height: 650

            visible: image === "" ? false : true

            Image {
              id: trendingShowImage
              y: 2
              source: image
              width: 500
              height: 650
            }

            Text {
              id: trendingShowTitle
              width: trendingShowImage.width
              height: 100
              anchors {
                top: trendingShowImage.bottom
              }
              color: "white"
              text: name
              style: Text.Outline
              styleColor: "black"
              font.pixelSize: 40

              maximumLineCount: 2
              wrapMode: Text.Wrap
            }

            Text {
              anchors {
                top: trendingShowTitle.bottom
              }
              color: "black"
              text: rating
              style: Text.Outline
              styleColor: "white"
              font.pixelSize: 26
            }
          }
        }

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
                                      const shows = result.map(item => ({
                                                                          "name": item.show.name,
                                                                          "image": item.show.image ? item.show.image.original : "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg",
                                                                          "rating": item.show.rating.average ? `${item.show.rating.average.toString()}/10` : "Sem nota",
                                                                          "_id": item.show.id.toString()
                                                                        }))
                                      shows.forEach(
                                        show => resultsModel.append(show))
                                    }).catch(error => {
                                               console.error(error)
                                             })
  }
}
