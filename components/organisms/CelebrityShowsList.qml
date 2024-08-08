import QtQuick
import QtQuick.Controls.Material 2.12

import "../molecules" as Molecules

Item {
  Text {
    id: celebrityShowListTitle
    anchors {
      bottom: celebrityShowListMainCard.top
      bottomMargin: 10
      left: celebrityShowListMainCard.left
      leftMargin: 10
    }

    color: "white"
    text: "Shows"
    style: Text.Outline
    styleColor: "black"

    font.family: bodyFont.font.family
    font.pixelSize: 44
  }

  Molecules.NoShows {
    id: noShows
    visible: celebrityShowListModel.count === 0
  }

  Rectangle {
    id: celebrityShowListMainCard
    height: 720
    width: 610

    color: "transparent"
    clip: true
    visible: celebrityShowListMainCard.isShowsLoaded ? true : false

    property bool isShowsLoaded: false

    ListView {
      anchors.fill: parent
      orientation: Qt.Vertical
      spacing: 25
      model: ListModel {
        id: celebrityShowListModel
      }

      delegate: Molecules.CelebrityShow {
        title: name
        imageUrl: celebrityImageUrl
        celebrityShowId: id

        MouseArea {
          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor
          onClicked: () => {
                       showId = celebrityShowId
                       stackView.push("../pages/ShowDetails.qml")
                     }
        }
      }
    }

    Component.onCompleted: {
      apiController.fetchCelebrityShows(celebrity_id)
    }

    Connections {
      target: apiController

      function onCelebrityShowsFetched(details) {
        celebrityShowListModel?.clear()
        const results = details.map(item => ({
                                               "name": item.name,
                                               "celebrityImageUrl": item.image,
                                               "id": item.id
                                             }))

        results.map(shows => celebrityShowListModel.append(shows))
        celebrityShowListMainCard.isShowsLoaded = true
      }

      function onErrorOccurred(errorString) {
        console.error("Error:", errorString)
      }
    }
  }
}
