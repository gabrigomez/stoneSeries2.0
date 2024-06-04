import QtQuick

Rectangle {
  id: home

  Rectangle {
    id: homeTitle
    height: 46
    width: parent.width
    y: 6

    color: "#08FF5B"
    border.color: "black"

    Text {
      anchors.centerIn: parent

      text: "Em alta"
      color: "white"
      font.pixelSize: 30
      font.bold: true
    }
  }

  Rectangle {
    height: 700
    width: root.width
    x: 10
    y: 100
    color: "transparent"

    ListView {
      anchors.fill: parent
      orientation: Qt.Horizontal
      spacing: 40
      model: ListModel {
        ListElement {
          bgColor: "red"
        }
        ListElement {
          bgColor: "black"
        }
        ListElement {
          bgColor: "dodgerblue"
        }
        ListElement {
          bgColor: "yellow"
        }
        ListElement {
          bgColor: "black"
        }
        ListElement {
          bgColor: "red"
        }
        ListElement {
          bgColor: "dodgerblue"
        }
        ListElement {
          bgColor: "red"
        }
        ListElement {
          bgColor: "yellow"
        }
        ListElement {
          bgColor: "red"
        }
      }

      delegate: Rectangle {
        id: homeCards
        color: "#08FF5B"
        border.color: "white"
        border.width: 2

        topRightRadius: 5
        topLeftRadius: 5
        bottomRightRadius: 20
        bottomLeftRadius: 20

        width: 512
        height: 760

        Rectangle {
          x: 6
          y: 6
          Rectangle {
            color: bgColor
            width: 500
            height: 650
          }
        }
      }
    }
  }
}
