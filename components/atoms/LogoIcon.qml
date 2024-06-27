import QtQuick

Image {
  source: "../../assets/Logo.png"
  width: 50
  height: 50
  anchors {
    right: title.left
    rightMargin: 4
    verticalCenter: parent.verticalCenter
  }
}
