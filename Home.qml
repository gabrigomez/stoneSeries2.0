import QtQuick
import "Api.js" as Api

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
        id: showListView
        ListElement {
          name: ""
          imageUrl: ""
          rating: 0
          show: 526
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: 0
          show: 169
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: 0
          show: 66
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: 0
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
          rating: 0
          show: 41007
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: 0
          show: 82
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: 0
          show: 46562
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: 0
          show: 44778
        }
        ListElement {
          name: ""
          imageUrl: ""
          rating: 0
          show: 15299
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
            color: "green"
            width: 500
            height: 650

            Image {
              id: trendingShowImage
              y: 2
              source: imageUrl
              width: 500
              height: 650
            }

            Text {
              id: trendingShowTitle
              anchors {
                top: trendingShowImage.bottom
              }
              color: "white"
              text: name
              style: Text.Outline
              styleColor: "black"
              font.pixelSize: 40
            }
          }
        }

        Component.onCompleted: {
          if (typeof show !== 'undefined' && trendingShowTitle.text === "") {
            console.log('chamou a api')
            Api.fetchShowDetails(show, function (result) {
              console.log(result.image.original)
              showListView.set(index, {
                                 "show": show,
                                 "name": result.name,
                                 "imageUrl": result.image.original
                               })
            })
          }
        }

        MouseArea {
          anchors.fill: parent
          onClicked: () => {
                       stackView.push("pages/Show.qml")
                     }
        }
      }
    }
  }
}
