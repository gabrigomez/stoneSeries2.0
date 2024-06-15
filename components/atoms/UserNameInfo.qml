import QtQuick

Text {
  id: userNameInfo
  anchors {
    left: optionsMenuButton.right
    leftMargin: 10
    verticalCenter: parent.verticalCenter
  }
  text: "Olá, " + settingsConfig.userName + "!"
  color: "white"
  font.family: bodyFont.font.family
  font.pixelSize: 20

  style: Text.Outline
  styleColor: "black"
}
