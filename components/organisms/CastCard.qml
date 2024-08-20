import QtQuick
import QtQuick.Controls.Material 2.12

import "../molecules" as Molecules

Item {
  id: castCardContainer

  property var castData

  Rectangle {
    id: castMainCard
    height: 400
    width: 500

    color: "transparent"
    clip: true

    Molecules.NotFoundMolecule {
      visible: castListView.count === 0

      image: "../../assets/Alert.png"
      message: "No cast info"
      textSize: 24
      imageSize: 60
    }

    ListView {
      id: castListView
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
