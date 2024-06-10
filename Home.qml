import QtQuick
import QtQuick.Controls.Material 2.12
import "Api.js" as Api

import "./components" as Components

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
      font.family: bodyFont.font.family
      font.pixelSize: 30
      font.bold: true

      style: Text.Outline
      styleColor: "black"
    }
  }

  Rectangle {
    height: 700
    width: root.width
    x: 10
    y: 70

    color: "transparent"

    ListView {
      anchors.fill: parent
      orientation: Qt.Horizontal
      spacing: 40
      model: ListModel {
        id: showListView
        ListElement {
          name: ""
          imageUrl: ""
          rating: ''
          show: 526
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: ''
          show: 169
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: ''
          show: 66
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: ''
          show: 73
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: 8.5
          show: 2993
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: ''
          show: 41007
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: ''
          show: 82
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: ''
          show: 46562
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: ''
          show: 44778
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: ''
          show: 15299
        }
      }

      delegate: Components.ShowCard {
        text: name
        image: imageUrl
        showRating: rating + "/10"

        Component.onCompleted: {
          if (typeof show !== 'undefined' && name === "") {
            console.log('chamou a api')
            Api.fetchShowDetails(show, function (result) {
              showListView.set(index, {
                                 "show": show,
                                 "name": result.name,
                                 "imageUrl": result.image.original,
                                 "rating": result.rating.average.toString()
                               })
            })
          }
        }

        MouseArea {
          anchors.fill: parent
          onClicked: () => {
                       showId = show
                       stackView.push("pages/Show.qml")
                     }
        }
      }
    }
  }
}
