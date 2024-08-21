import QtQuick

import "../organisms" as Organisms
import "../molecules" as Molecules

Rectangle {
  id: favShowCards

  width: root.width - 40
  height: 820
  x: 10
  y: 10

  color: "transparent"

  property var favShowsData: []
  property bool noResults

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

  Molecules.NotFoundMolecule {
    id: noFavListShow
    visible: favShowCards.noResults
    message: "Nenhuma série favoritada :("
    image: "../../assets/Alert.png"
    imageSize: 70

    anchors {
      horizontalCenter: parent.horizontalCenter
      top: parent.top
      topMargin: 300
    }
  }
}
