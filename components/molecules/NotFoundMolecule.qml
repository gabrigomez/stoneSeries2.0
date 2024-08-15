import QtQuick

import "../atoms" as Atoms

Item {
  anchors.centerIn: parent

  Atoms.NotFoundDescription {
    id: noResultsMessage
  }

  Atoms.NotFoundImage {}
}
