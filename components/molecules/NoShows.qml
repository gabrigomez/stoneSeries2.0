import QtQuick

Rectangle {
  height: 250
  width: 600
  color: settingsConfig.themeColor

  topRightRadius: 5
  topLeftRadius: 5
  bottomRightRadius: 10
  bottomLeftRadius: 10

  Image {
    id: noShowsImage
    source: "../../assets/NoResult.png"
    height: 120
    width: 120

    anchors.centerIn: parent
  }

  Text {
    id: noShowsText
    anchors {
      top: noShowsImage.bottom
      topMargin: 10
      horizontalCenter: parent.horizontalCenter
    }

    color: "white"
    text: "Nenhum show encontrado."

    font.family: bodyFont.font.family
    font.pixelSize: 18
    style: Text.Outline
    styleColor: "black"
  }
}
