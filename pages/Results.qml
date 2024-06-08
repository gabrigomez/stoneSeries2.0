import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../Api.js" as Api

Rectangle {
  id: searchedShowCards
  color: "#08FF5B"
  border.color: "white"
  border.width: 2

  topRightRadius: 5
  topLeftRadius: 5
  bottomRightRadius: 20
  bottomLeftRadius: 20

  width: 512
  height: 820

  ListView {
    anchors.fill: parent
    orientation: Qt.Horizontal
    spacing: 40
    model: ListModel {
      id: resultsModel
    }
    delegate: searchDelegate
  }

  Rectangle {
    id: searchDelegate
    x: 6

    Image {
      id: searchedShowImage
      y: 2
      source: "https://static.tvmaze.com/uploads/images/original_untouched/501/1253519.jpg"
      width: 500
      height: 650
    }

    Rectangle {
      x: 4
      anchors {
        top: searchedShowImage.bottom
        topMargin: 10
      }
      width: 500
      height: 100

      Text {
        id: searchedShowTitle
        color: "white"
        text: "Show Result"
        style: Text.Outline

        styleColor: "black"
        wrapMode: Text.Wrap
        font.pixelSize: 40

        maximumLineCount: 2
        width: searchedShowImage.width
        height: 100
      }

      Text {
        color: "black"
        text: "8/10"

        style: Text.Outline
        styleColor: "white"
        font.pixelSize: 26
      }
    }
  }
  MouseArea {
    anchors.fill: parent
    onClicked: () => {
                 stackView.push("../pages/Show.qml")
               }
  }

  // Component.onCompleted: {
  //   console.log('chamou resultados')
  //   Api.fetchShows(show, function (result) {
  //     resultsModel.set({
  //                        "show": show,
  //                        "name": result.name,
  //                        "imageUrl": result.image.original,
  //                        "rating": result.rating.average.toString()
  //                      })
  //   })
  // }
}
