import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts

import "../organisms" as Organisms

Item {
  Rectangle {
    id: favShowCards
    width: root.width
    height: 820
    x: 10
    y: 10

    color: "transparent"

    ListView {
      anchors.fill: parent
      orientation: Qt.Horizontal
      spacing: 40
      model: ListModel {
        id: favShowsModel
      }
      delegate: Organisms.ShowCard {
        id: favShowCard
        text: name
        image: imageUrl
        showRating: rating

        height: 820

        MouseArea {
          anchors.fill: parent
          onClicked: () => {
                       showId = _id
                       stackView.push("../pages/Show.qml")
                     }
        }
      }
    }

    Rectangle {
      id: noFavListShow
      anchors.fill: parent
      visible: false

      Text {
        anchors.centerIn: parent
        text: "Nenhuma série favoritada :("
        font.pixelSize: 40
      }
    }
  }

  Component.onCompleted: {
    if (settingsConfig.favShowsList.length === 0) {
      noFavListShow.visible = true
    }

    const shows = settingsConfig.favShowsList
    shows.forEach(show => favShowsModel.append(show))
  }
}
