import QtQuick
import QtQuick.Controls.Material 2.12

import "../molecules" as Molecules
import "../organisms" as Organisms

Rectangle {
  height: 700
  width: root.width - 20
  x: 10
  y: 70

  color: "transparent"

  property var trendingData: []

  ListView {
    anchors.fill: parent
    orientation: Qt.Horizontal
    spacing: 40

    model: trendingData

    delegate: Organisms.InfoCard {
      text: name
      image: imageUrl
      showRating: rating

      Component.onCompleted: {
        if (typeof show !== 'undefined' && name === "") {
          apiController.fetchShowDetails(show)
        }
      }

      MouseArea {
        anchors.fill: parent
        onClicked: () => {
                     showId = show
                     stackView.push("../pages/ShowDetails.qml")
                   }
      }
    }
  }
}
