import QtQuick

Image {
  id: userAvatar
  source: settingsConfig.userAvatar
  anchors {
    top: parent.top
    topMargin: 10
    horizontalCenter: parent.horizontalCenter
  }
  width: 200
  height: 200
  visible: false

  //transition when change avatar
  Behavior on source {
    SequentialAnimation {
      PropertyAnimation {
        target: userAvatarMask
        property: "opacity"
        from: 1
        to: 0
        duration: 500
      }
      PropertyAnimation {
        target: userAvatar
        property: "source"
        duration: 0
      }
      PropertyAnimation {
        target: userAvatarMask
        property: "opacity"
        from: 0
        to: 1
        duration: 500
      }
    }
  }
}
