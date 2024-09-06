import QtQuick

import "../atoms" as Atoms
import "../molecules" as Molecules

Rectangle {
  id: episodeInfoContainer

  Text {
    text: episodeDetailsPage?.episodeAirdate ? episodeDetailsPage.episodeAirdate : ""
    anchors.verticalCenter: parent.verticalCenter
    color: "white"

    style: Text.Outline
    styleColor: "black"
    font.family: bodyFont.font.family
    font.pixelSize: 20
  }

  Molecules.RatingMolecule {
    id: ratingMolecule
    anchors {
      top: episodeInfoContainer.top
      topMargin: -6
      right: episodeInfoContainer.right
      rightMargin: 10
    }

    rating: episodeDetailsPage?.episodeRating ? episodeDetailsPage.episodeRating : ""
  }
}
