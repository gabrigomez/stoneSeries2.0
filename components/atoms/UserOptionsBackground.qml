import QtQuick

Rectangle {
  anchors.fill: parent
  color: optionsMenuButton.hovered ? "black" : "white"
  border.color: "silver"
  radius: 40

  Behavior on color {
    PropertyAnimation {
      duration: 200
      easing.type: Easing.InOutQuad
    }
  }
}
