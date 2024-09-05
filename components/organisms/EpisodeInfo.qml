import QtQuick

import "../atoms" as Atoms

Rectangle {
  id: episodeInfoContainer

  Text {
    text: episodeDetailsPage?.episodeAirdate ? episodeDetailsPage.episodeAirdate : ""
    color: "black"

    font.family: bodyFont.font.family
    font.pixelSize: 20
  }
}
