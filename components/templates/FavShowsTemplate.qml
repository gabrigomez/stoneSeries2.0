import QtQuick

import "../organisms" as Organisms
import "../molecules" as Molecules

Rectangle {
  id: favShowCards

  width: root.width
  height: 820
  x: 10
  y: 10

  color: "transparent"

  property var favShowsData: []

  ListView {
    anchors.fill: parent
    orientation: Qt.Horizontal
    spacing: 40
    model: favShowsData
    delegate: Organisms.InfoCard {
      id: favShowCard
      text: name
      image: imageUrl
      showRating: rating

      height: 820

      MouseArea {
        anchors.fill: parent
        onClicked: () => {
                     showId = _id
                     stackView.push("../pages/ShowDetails.qml")
                   }
      }
    }
  }

  Molecules.NoFavListShow {
    id: noFavListShow
  }
}
