import QtQuick

Item {
  id: noCastCard

  Image {
    id: noCastImage
    source: "../../assets/Alert.png"

    anchors {
      top: parent.top
      topMargin: 100
      horizontalCenter: parent.horizontalCenter
    }
  }

  Text {
    text: "No cast info"
    font.pixelSize: 24

    anchors {
      top: noCastImage.bottom
      topMargin: 10
      horizontalCenter: parent.horizontalCenter
    }
  }
}
