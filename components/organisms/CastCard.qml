import QtQuick
import QtQuick.Controls.Material 2.12

import "../molecules" as Molecules

Item {
  id: castCardContainer

  property var castData

  BusyIndicator {
    id: busyIndicator
    visible: apiController.isCastLoad === false
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
    visible: apiController.isCastLoad

    property bool isCastLoaded: castCard

    Molecules.NotFoundMolecule {
      visible: castModel.count === 0

      image: "../../assets/Alert.png"
      message: "No cast info"
      textSize: 24
      imageSize: 60
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
