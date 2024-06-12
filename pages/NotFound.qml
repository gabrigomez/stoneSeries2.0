import QtQuick
import QtQuick.Controls

Rectangle {
  id: searchedShowCards
  objectName: "noResultsPage"
  width: root.width
  height: 820

  Text {
    id: noResultsMessage
    anchors.centerIn: searchedShowCards
    text: "Nenhum resultado encontrado."
    color: "black"
    font.pixelSize: 40
  }

  Rectangle {
    id: backButton
    y: 80
    x: 10

    radius: 25
    width: 50
    height: 50

    Image {
      source: "https://static.thenounproject.com/png/1165042-200.png"
      anchors {
        right: parent.right
        margins: 10
        verticalCenter: parent.verticalCenter
        horizontalCenter: parent.horizontalCenter
      }
      height: 25
      width: 25
    }

    MouseArea {
      anchors.fill: parent
      onClicked: {
        stackView.pop(null)
      }

      hoverEnabled: true
      onEntered: backButton.color = "#08FF5B"
      onExited: backButton.color = "white"
    }

    Behavior on color {
      ColorAnimation {
        duration: 100
      }
    }
  }
}
