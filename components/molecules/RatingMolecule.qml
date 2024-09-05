import QtQuick

import "../atoms" as Atoms

Rectangle {
  id: ratingMoleculeContainer
  color: "transparent"

  property alias rating: infoCardRating.text

  Atoms.RatingIcon {
    id: ratingShowImage
    anchors {
      right: infoCardRating.left
      rightMargin: 6
      bottom: infoCardRating.bottom
      bottomMargin: infoCardRating.text === "SEM NOTA" ? 4 : 8
    }

    visible: infoCardRating.text === "SEM NOTA" ? false : true
  }

  Atoms.ShowRating {
    id: infoCardRating
    anchors {
      right: ratingMoleculeContainer.right
      leftMargin: 2
      top: ratingMoleculeContainer.top
      topMargin: 6
    }
  }
}
