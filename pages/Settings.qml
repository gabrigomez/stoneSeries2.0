import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material 2.12

import "../Api.js" as Api

Rectangle {
  id: showDetails
  width: parent.width
  height: parent.height

  color: "white"

  Text {
    text: "Settings Page"
    anchors.centerIn: parent
  }
}
