import QtQuick

import "../organisms" as Organisms

Rectangle {
  id: episodeListTemplate
  width: 710
  height: 850
  anchors.centerIn: parent

  property var episodeList: []

  Text {
    id: episodeListTitle
    text: "Episode List"
    font.pixelSize: 22
    anchors.horizontalCenter: parent.horizontalCenter
  }

  Rectangle {
    id: episodeListContainer
    anchors {
      top: episodeListTitle.bottom
      topMargin: 40
      fill: parent
    }
    clip: true

    ListView {
      width: parent.width
      height: 500

      orientation: Qt.Vertical
      spacing: 20
      model: episodeList

      delegate: Organisms.InfoCard {
        id: episodeCard
        width: 710
        height: 450

        imgWidth: 700
        imgHeight: 350
        text: name
        image: "https://static.tvmaze.com/uploads/images/original_untouched/4/12368.jpg"
      }
    }
  }
}
