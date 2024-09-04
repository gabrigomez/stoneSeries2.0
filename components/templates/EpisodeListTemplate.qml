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
    font.pixelSize: 28
    anchors.horizontalCenter: parent.horizontalCenter

    color: "white"
    style: Text.Outline
    styleColor: "black"
    font.family: bodyFont.font.family
  }

  Rectangle {
    id: episodeListContainer
    anchors {
      top: episodeListTitle.bottom
      topMargin: 44
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

        text: name
        image: imageUrl
        seasonInfo: season

        imgWidth: 700
        imgHeight: 350
        isEpisode: true
        textSize: 32

        MouseArea {
          anchors.fill: parent
          onClicked: () => {
                       episodeId = _id
                       stackView.push("../pages/EpisodeDetails.qml")
                     }
        }
      }
    }
  }
}
