import QtQuick

import "../atoms" as Atoms

Rectangle {
  anchors.centerIn: parent

  property alias message: notFoundMessage.text
  property alias textSize: notFoundMessage.font.pixelSize
  property alias image: notFoundImage.source
  property alias imageSize: notFoundImage.height

  Atoms.NotFoundImage {
    id: notFoundImage
  }

  Atoms.NotFoundDescription {
    id: notFoundMessage
  }
}
