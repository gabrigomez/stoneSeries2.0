import QtQuick

Text {
  id: userNameInfo
  anchors {
    left: optionsMenuButton.right
    leftMargin: 14
  }
  y: 24

  text: "Olá, " + userNameInfo.hasUserName() + "!"
  color: "white"
  font.family: bodyFont.font.family
  font.pixelSize: 20

  style: Text.Outline
  styleColor: "black"

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: () => {
                 if (stackView.currentItem.objectName !== "settingsPage") {
                   stackView.push("../pages/Settings.qml")
                 }
               }
  }

  function hasUserName() {
    return settingsConfig.userName !== "" ? settingsConfig.userName : "usuário"
  }
}
