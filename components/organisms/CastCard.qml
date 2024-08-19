import QtQuick
import QtQuick.Controls.Material 2.12

import "../molecules" as Molecules

Item {
  id: castCardContainer

  property var castData

  BusyIndicator {
    id: busyIndicator
    visible: !castCardContainer.castData
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
    visible: castCardContainer.castData

    property bool isCastLoaded: castCard

    Molecules.NoCast {
      anchors.fill: parent
      visible: castModel.count === 0
    }

    ListView {
      anchors.fill: parent
      orientation: Qt.Horizontal
      spacing: 25
      model: castCardContainer.castData

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
  }
}
