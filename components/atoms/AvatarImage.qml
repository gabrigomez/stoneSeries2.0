import QtQuick

Image {
  id: userNavbarAvatar
  source: stackView.depth > 1 ? "../../assets/BackIcon.png" : settingsConfig.userAvatar
  width: 50
  height: 50
  anchors.centerIn: parent
  visible: false
}
