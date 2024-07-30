import QtQuick
import QtQuick.Controls.Material 2.12

import "../molecules" as Molecules

Item {
  BusyIndicator {
    id: busyIndicator
    visible: castMainCard.isCastLoaded ? false : true
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
    visible: castMainCard.isCastLoaded ? true : false

    property bool isCastLoaded: false

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
        celebrityId: id

        MouseArea {
          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor
          onClicked: () => {
                       celebrity_id = id
                       stackView.push("../pages/CelebrityDetails.qml")
                     }
        }
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
                                            "imageUrl": item.person.image.medium,
                                            "id": item.person.id
                                          }))

        results.map(cast => castModel.append(cast))
        castMainCard.isCastLoaded = true
      }

      function onErrorOccurred(errorString) {
        console.error("Error:", errorString)
      }
    }
  }
}
