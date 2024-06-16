import QtQuick
import QtQuick.Controls

import "../atoms" as Atoms

Rectangle {
  id: noResultsPage
  objectName: "noResultsPage"
  width: root.width
  height: 820

  Atoms.NotFoundDescription {
    id: noResultsMessage
  }

  Atoms.NotFoundImage {}
}
