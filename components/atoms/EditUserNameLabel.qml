import QtQuick
import QtQuick.Controls

Label {
  anchors {
    bottom: editUserNameInput.top
    bottomMargin: 4
    left: editUserNameInput.left
  }
  text: "Edite o username"

  color: "white"
  font.pixelSize: 12
  style: Text.Outline
  styleColor: "black"
}
