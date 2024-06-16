import QtQuick

Item {
  id: mask
  width: userNavbarAvatar.width
  height: userNavbarAvatar.height
  layer.enabled: true
  visible: false

  Rectangle {
    width: userNavbarAvatar.width
    height: userNavbarAvatar.height
    radius: width / 2
    color: "black"
  }
}
