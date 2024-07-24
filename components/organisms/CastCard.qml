import QtQuick

import "../molecules" as Molecules

Rectangle {
  height: 400
  width: 500

  color: "transparent"
  clip: true

  ListView {
    anchors.fill: parent
    orientation: Qt.Horizontal
    spacing: 25
    model: ListModel {
      id: castModel
    }

    delegate: Molecules.CelebrityCard {
      text: name
      image: imageUrl

      //TODO: click to show celebrity shows

      // MouseArea {
      //   anchors.fill: parent
      //   onClicked: () => {
      //                showId = show
      //                stackView.push("../pages/ShowDetails.qml")
      //              }
      // }
    }
  }

  Component.onCompleted: {
    apiController.fetchCast(showId)
  }

  Connections {
    target: apiController

    function onCastFetched(cast) {
      castModel?.clear()
      const results = cast.map(item => ({
                                          "name": item.person.name,
                                          "imageUrl": item.person.image.medium
                                        }))

      results.map(cast => castModel.append(cast))
    }

    function onErrorOccurred(errorString) {
      console.error("Error:", errorString)
    }
  }
}
