import QtQuick
import QtQuick.Controls.Material 2.12

import "../molecules" as Molecules

Item {
  Rectangle {
    id: celebrityShowListMainCard
    height: 800
    width: 600

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
        imageUrl: image
        celebrityShowId: id

        MouseArea {
          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor
          // onClicked: () => {
          //              celebrity_id = id
          //              stackView.push("../pages/CelebrityDetails.qml")
          //            }
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
                                               "image": item.image,
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
