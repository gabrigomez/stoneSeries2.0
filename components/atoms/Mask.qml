import QtQuick

Item {
  id: mask
  layer.enabled: true
  visible: false

  Rectangle {
    width: parent.width
    height: parent.height
    radius: width / 2
    color: "black"
  }
}
