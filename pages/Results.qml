import QtQuick
import QtQuick.Controls
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
        id: searchDelegate
        x: 6

        color: "#08FF5B"
        border.color: "white"
        border.width: 2

        topRightRadius: 5
        topLeftRadius: 5
        bottomRightRadius: 20
        bottomLeftRadius: 20

        width: 512
        height: parent?.height

        Image {
          id: searchedShowImage
          y: 2
          source: image
          width: 500
          height: 650
        }

        Rectangle {
          x: 4
          anchors {
            top: searchedShowImage.bottom
            topMargin: 10
          }
          width: 500
          height: 100

          color: "transparent"

          Text {
            id: searchedShowTitle
            color: "white"
            text: name
            style: Text.Outline

            styleColor: "black"
            wrapMode: Text.Wrap
            font.pixelSize: 40

            maximumLineCount: 2
            width: searchedShowImage.width
            height: 100
          }

          Text {
            color: "black"
            anchors {
              top: searchedShowTitle.bottom
            }
            text: rating

            style: Text.Outline
            styleColor: "white"
            font.pixelSize: 26
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
                                                                          "image": item.show.image ? item.show.image.original : "",
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
