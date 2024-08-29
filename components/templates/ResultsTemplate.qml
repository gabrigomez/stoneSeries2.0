import QtQuick
import QtQuick.Controls.Material 2.12

import "../organisms" as Organisms

Item {
  anchors.fill: parent

  property var resultsData: []

  BusyIndicator {
    id: busyIndicator
    width: 281
    height: 281
    anchors {
      centerIn: parent
    }

    visible: resultsModel.count === 0 ? true : false
    Material.accent: settingsConfig.themeColor === "#000000" ? "white" : "black"
  }

  Rectangle {
    id: searchedShowCards
    width: root.width - 40
    height: 820
    x: 10
    y: 10

    visible: resultsModel.count > 0 ? true : false
    color: "transparent"

    ListView {
      anchors.fill: parent
      orientation: Qt.Horizontal
      spacing: 40
      model: resultsData

      delegate: Organisms.InfoCard {
        id: homeCards
        text: name
        image: imageUrl
        showRating: rating

        height: 820

        MouseArea {
          anchors.fill: parent
          onClicked: () => {
                       if (searchType === 0) {
                         showId = _id
                         stackView.push("../pages/ShowDetails.qml")
                       } else {
                         celebrity_id = _id
                         stackView.push("../pages/CelebrityDetails.qml")
                       }
                     }
        }
      }
    }
  }
}
