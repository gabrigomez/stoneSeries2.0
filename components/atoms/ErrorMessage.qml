import QtQuick

Text {
  id: errorMessage
  anchors {
    top: settingsInfo.bottom
    topMargin: 10
    horizontalCenter: parent.horizontalCenter
  }
  text: "O username não pode ter mais de 15 caracteres."
  color: "red"
  visible: false
}
