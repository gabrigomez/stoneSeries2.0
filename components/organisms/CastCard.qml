import QtQuick
import QtQuick.Controls.Material 2.12

import "../molecules" as Molecules

Item {
  BusyIndicator {
    id: busyIndicator
    visible: castMainCard.isCastLoad ? false : true
    x: 150
    y: 50

    width: 200
    height: 200
    Material.accent: settingsConfig.themeColor
  }

  Rectangle {
    id: castMainCard
    height: 400
    width: 500

    color: "transparent"
    clip: true
    visible: castMainCard.isCastLoad ? true : false

    property bool isCastLoad: false

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
        castMainCard.isCastLoad = true
      }

      function onErrorOccurred(errorString) {
        console.error("Error:", errorString)
      }
    }
  }
}
