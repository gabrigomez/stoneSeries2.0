import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts

import "../components" as Components

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
        ListElement {
          name: ""
          imageUrl: ""
          rating: ""
          _id: ""
        }
      }
      delegate: Components.ShowCard {
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
        font.pixelSize: 30
      }
    }
  }

  Component.onCompleted: {
    console.log(settingsConfig.favShowsList)

    if (settingsConfig.favShowsList.length === 0) {
      noFavListShow.visible = true
    }

    const shows = settingsConfig.favShowsList
    shows.forEach(show => favShowsModel.append(show))
  }
}
