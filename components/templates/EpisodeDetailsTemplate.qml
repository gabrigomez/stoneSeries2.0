import QtQuick

import "../organisms" as Organisms

Rectangle {
  id: episodeDetailsTemplate
  width: root.width
  height: root.height
  anchors {
    horizontalCenter: parent.horizontalCenter
    top: episodeDetailsPage.top
    topMargin: 10
  }

  //todo: create EpisodeDetailsOrganism
  Text {
    id: episodeTitle
    anchors {
      horizontalCenter: parent.horizontalCenter
      top: parent.top
      topMargin: 10
    }

    text: episodeDetailsPage?.episodeTitle ? episodeDetailsPage.episodeTitle : ""
    color: "white"
    style: Text.Outline
    styleColor: "black"

    font.family: bodyFont.font.family
    font.pixelSize: 30
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    maximumLineCount: 2
  }

  Organisms.InfoCard {
    id: episodeDetailsCard
    width: 710
    height: 410

    anchors {
      horizontalCenter: parent.horizontalCenter
      top: episodeTitle.bottom
      topMargin: 10
    }

    image: episodeDetailsPage?.episodeImage ? episodeDetailsPage.episodeImage : ""
    imgWidth: 700
    imgHeight: 380
    isEpisode: true
  }
}
