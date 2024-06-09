import QtQuick
import QtQuick.Controls
import "../Api.js" as Api

Rectangle {
  id: showDetails
  width: parent.width
  height: parent.height

  color: "yellowgreen"

  property var name
  property var image
  property var genres
  property var rating
  property var description

  Rectangle {
    id: showDetailsCard
    width: 512
    height: 920
    anchors.horizontalCenter: showDetails.horizontalCenter

    color: "#08FF5B"

    border {
      color: "white"
      width: 2
    }

    topRightRadius: 5
    topLeftRadius: 5
    bottomRightRadius: 20
    bottomLeftRadius: 20

    Rectangle {
      x: 6
      y: 4

      Image {
        id: showImage
        source: showDetails?.image ? showDetails.image : 'https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg'
        width: 500
        height: 600
      }

      Text {
        id: showName
        width: showImage.width
        height: 100
        anchors {
          top: showImage.bottom
          topMargin: 10
          bottomMargin: 10
        }

        text: showDetails?.name ? showDetails.name : ""

        color: "white"
        style: Text.Outline
        styleColor: "black"
        font.pixelSize: 44

        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        maximumLineCount: 2
      }

      Row {
        id: showGenresRow
        anchors.top: showName.bottom
        spacing: 2

        Repeater {
          id: showGenresRepeater
          model: showDetails.genres ? showDetails.genres : []
          Text {
            text: modelData + (index < showGenresRepeater.count - 1 ? ", " : "")
            color: "black"
            font.pixelSize: 24
            wrapMode: Text.Wrap
          }
        }
      }

      Text {
        id: showRating
        anchors {
          top: showGenresRow.bottom
          topMargin: 10
          bottomMargin: 10
        }

        text: showDetails?.rating ? `${showDetails?.rating.toString(
                                      )}/10` : "Sem avaliação"
        color: "white"

        style: Text.Outline
        styleColor: "black"
        font.pixelSize: 16
      }

      Text {
        id: showDetailsSummary
        anchors {
          top: showRating.bottom
          topMargin: 10
          bottomMargin: 10
        }
        text: showDetails?.description ? showDetails.description : "Sem descrição"
        color: "black"

        wrapMode: Text.Wrap
        font.pixelSize: 16
        clip: true
        maximumLineCount: 7

        horizontalAlignment: Text.AlignJustify
        width: showImage.width
      }
    }
  }

  Component.onCompleted: {
    console.log('chamou a api no detalhe')
    Api.fetchShowDetails(showId, function (result) {
      showDetails.name = result.name
      showDetails.image = result.image.original
      showDetails.rating = result.rating.average
      showDetails.genres = result.genres
      showDetails.description = result.summary
    })
  }
}
