import QtQuick

import "../atoms" as Atoms

Rectangle {
  id: showDetailsSummary
  height: sinopseDescription.height
  color: "transparent"

  property alias sinopseContent: sinopseDescription.text
  property alias contentWidth: sinopseDescription.width

  Atoms.SinopseTitle {
    id: sinopseTitle
  }

  Atoms.SinopseDescription {
    id: sinopseDescription
  }
}
