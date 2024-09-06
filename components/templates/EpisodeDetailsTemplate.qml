import QtQuick

import "../organisms" as Organisms
import "../molecules" as Molecules

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
    color: "black"

    font.family: bodyFont.font.family
    font.pixelSize: 30
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    maximumLineCount: 2
  }

  Organisms.InfoCard {
    id: episodeDetailsCard
    width: 712
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

  Organisms.EpisodeInfo {
    id: episodeInfoContainer
    width: episodeDetailsCard.width
    height: 40
    anchors {
      top: episodeDetailsCard.bottom
      topMargin: 10
      left: episodeDetailsCard.left
    }
  }

  Rectangle {
    id: episodeSinopseContainer
    width: 712
    height: 100 + showDetailsSummary.height
    anchors {
      top: episodeInfoContainer.bottom
      topMargin: 10
      left: episodeInfoContainer.left
    }

    color: settingsConfig.themeColor
    border {
      color: "black"
      width: 2
    }

    topRightRadius: 5
    topLeftRadius: 5
    bottomRightRadius: 20
    bottomLeftRadius: 20

    Molecules.Sinopse {
      id: showDetailsSummary
      width: episodeSinopseContainer.width
      anchors {
        top: episodeSinopseContainer.top
        left: episodeSinopseContainer.left
        topMargin: 10
        leftMargin: 10
      }

      contentWidth: episodeSinopseContainer.width - 20
      sinopseContent: episodeDetailsPage?.episodeSinopse ? episodeDetailsPage.episodeSinopse : ""
    }
  }
}
