import QtQuick

Image {
  id: userAvatar
  source: settingsConfig.userAvatar !== "" ? settingsConfig.userAvatar : "../../assets/User.png"
  width: 200
  height: 200

  anchors {
    centerIn: parent
  }
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
