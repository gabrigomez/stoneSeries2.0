import QtQuick

import "../atoms" as Atoms

Rectangle {
  id: showDetailsSummary
  height: sinopseDescription.height

  anchors {
    top: showDescriptionCard.top
    left: showDescriptionCard.left
    topMargin: 10
    leftMargin: 10
  }

  Atoms.SinopseTitle {
    id: sinopseTitle
  }

  Atoms.SinopseDescription {
    id: sinopseDescription
  }
}
