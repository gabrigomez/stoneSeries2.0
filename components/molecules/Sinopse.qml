import QtQuick

import "../atoms" as Atoms

Rectangle {
  id: showDetailsSummary
  height: sinopseDescription.height

  property alias sinopseContent: sinopseDescription.text

  Atoms.SinopseTitle {
    id: sinopseTitle
  }

  Atoms.SinopseDescription {
    id: sinopseDescription
  }
}
