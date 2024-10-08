import QtQuick

Text {
  id: userName
  anchors {
    top: userAvatarCard.bottom
    topMargin: 10
    horizontalCenter: parent.horizontalCenter
  }

  text: settingsConfig.userName
  font.family: bodyFont.font.family
  font.pixelSize: 30

  color: "white"
  style: Text.Outline
  styleColor: "black"

  // transition when change username
  Behavior on text {
    SequentialAnimation {
      PropertyAnimation {
        target: userName
        property: "opacity"
        from: 1
        to: 0
        duration: 500
      }
      PropertyAnimation {
        target: userName
        property: "text"
        duration: 0
      }
      PropertyAnimation {
        target: userName
        property: "opacity"
        from: 0
        to: 1
        duration: 500
      }
    }
  }
}
