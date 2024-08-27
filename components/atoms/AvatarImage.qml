import QtQuick

Image {
  id: userNavbarAvatar
  source: stackView.depth > 1 ? "../../assets/BackIcon.png" : userNavbarAvatar.avatarSource()
  width: 50
  height: 50

  anchors.centerIn: parent
  visible: false

  function avatarSource() {
    return settingsConfig.userAvatar !== "" ? settingsConfig.userAvatar : "../../assets/User.png"
  }
}
