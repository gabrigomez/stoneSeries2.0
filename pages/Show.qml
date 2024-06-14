import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material 2.12

import "../Api.js" as Api

Rectangle {
  id: showDetails
  width: parent?.width
  height: parent?.height

  color: "white"

  property var name
  property var image
  property var genres
  property var rating
  property var description
  property var startDate
  property var endDate

  property var startYear: {
    if (startDate) {
      var dateParts = startDate.split("-")
      if (dateParts.length > 0) {
        return dateParts[0]
      }
    }
    return ""
  }

  property var endYear: {
    if (endDate) {
      var dateParts = endDate.split("-")
      if (dateParts.length > 0) {
        return dateParts[0]
      }
    }
    return ""
  }

  Rectangle {
    id: showDetailsCard
    width: 512
    height: 850

    x: 500
    y: 10
    color: "#08FF5B"

    border {
      color: "black"
      width: 2
    }

    topRightRadius: 5
    topLeftRadius: 5
    bottomRightRadius: 20
    bottomLeftRadius: 20

    BusyIndicator {
      id: busyIndicator
      visible: busy
      anchors.centerIn: parent
      width: 281
      height: 281
      Material.accent: "black"
    }

    Rectangle {
      id: showMainInfoCard
      width: 500
      height: 840

      x: 6
      y: 4
      color: "transparent"
      visible: !busy

      Image {
        id: showImage
        source: showDetails?.image ? showDetails.image : 'https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg'
        width: 500
        height: 660
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
        font.family: bodyFont.font.family
        font.pixelSize: 44

        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        maximumLineCount: 2
      }

      Image {
        id: genresIcon
        source: "../assets/GenresIcon.png"
        width: 24
        height: 24

        anchors {
          left: parent.left
          top: showName.bottom
        }
      }

      Row {
        id: showGenresRow
        anchors {
          bottom: genresIcon.bottom
          left: genresIcon.right
          leftMargin: 4
        }

        spacing: 2

        Repeater {
          id: showGenresRepeater
          model: showDetails.genres ? showDetails.genres : []
          Text {
            text: modelData + (index < showGenresRepeater.count - 1 ? ", " : "")
            color: "black"
            font.family: bodyFont.font.family
            font.pixelSize: 22

            style: Text.Outline
            styleColor: "lightgray"
            wrapMode: Text.Wrap
          }
        }
      }

      Text {
        id: showRating
        anchors {
          bottom: showMainInfoCard.bottom
          right: showMainInfoCard.right
        }

        text: showDetails?.rating ? `${showDetails?.rating.toString(
                                      )}/10` : "SEM NOTA"
        color: "white"

        style: Text.Outline
        styleColor: "black"
        font.family: titleFont.font.family
        font.pixelSize: 22
      }

      Image {
        id: calendarIcon
        source: "../assets/CalendarIcon.png"
        width: 24
        height: 24

        anchors {
          left: parent.left
          top: showGenresRow.bottom
          topMargin: 4
        }
      }

      Row {
        anchors {
          bottom: calendarIcon.bottom
          bottomMargin: 2
          left: calendarIcon.right
          leftMargin: 4
        }

        spacing: 4
        Text {
          id: showStartYear

          text: startYear ? startYear : ""
          color: "white"

          style: Text.Outline
          styleColor: "black"
          font.pixelSize: 16
        }

        Text {
          text: "-"
          color: "white"

          style: Text.Outline
          styleColor: "black"
          font.pixelSize: 16
        }

        Text {
          id: showEndYear

          text: endYear ? endYear : ""
          color: "white"

          style: Text.Outline
          styleColor: "black"
          font.pixelSize: 16
        }
      }
    }
  }

  Rectangle {
    id: showDescriptionCard
    width: 500
    height: 100 + description.height

    anchors {
      left: showDetailsCard.right
      leftMargin: 40
    }
    y: 20

    color: "#08FF5B"
    border {
      color: "black"
      width: 2
    }

    topRightRadius: 5
    topLeftRadius: 5
    bottomRightRadius: 20
    bottomLeftRadius: 20

    Text {
      id: showDetailsSummary
      anchors {
        top: showDescriptionCard.top
        left: showDescriptionCard.left
        topMargin: 10
        leftMargin: 10
      }

      Text {
        id: detailsTitle

        color: "white"
        text: "• SINOPSE "
        font.pixelSize: 50
        style: Text.Outline
        styleColor: "black"
      }

      Text {
        id: description
        width: 480
        height: contentHeight

        anchors {
          top: detailsTitle.bottom
          left: showDetailsSummary.left
          topMargin: 10
          leftMargin: 2
        }
        text: showDetails?.description ? showDetails.description : "Sem descrição"
        color: "black"

        wrapMode: Text.Wrap
        font.pixelSize: 16
        clip: true
        horizontalAlignment: Text.AlignJustify
      }
    }

    Button {
      id: favShowButton
      text: ""
      anchors {
        top: showDescriptionCard.bottom
        topMargin: 10
      }
      property string bgColor: "#08FF5B"

      QtObject {
        id: favListManager

        function manageShow(showDetails, showId) {
          const newShow = {
            "name": showDetails.name,
            "imageUrl": showDetails?.image ? showDetails.image : 'https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg',
            "rating": showDetails?.rating ? `${showDetails?.rating.toString(
                                              )}/10` : "SEM NOTA",
            "_id": showId.toString()
          }
          var favList = settingsConfig.favShowsList
          var index = favList.findIndex(show => show._id === newShow._id)

          if (index === -1) {
            favList.push(newShow)
            console.log("Show adicionado à lista de favoritos")
          } else {
            favList.splice(index, 1)
            console.log("Show removido da lista de favoritos")
          }

          settingsConfig.favShowsList = favList
          stackView.pop(null)
        }
      }

      onClicked: {
        console.log('clicou aqui')
        favListManager.manageShow(showDetails, showId)
      }

      background: Rectangle {
        id: favShowButtonColor
        color: favShowButton.hovered ? favShowButton.bgColor : "white"
        border.color: "black"
        radius: 5
      }

      contentItem: Text {
        text: favShowButton.text
        color: "black"
        font.pixelSize: 20
        anchors.centerIn: parent
      }
    }
  }

  Component.onCompleted: {
    console.log('chamou a api no detalhe')
    Api.fetchShowDetails(showId, function (result) {
      showDetails.name = result.name
      showDetails.image = result.image?.original
          ?? 'https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg'
      showDetails.rating = result.rating.average
      showDetails.genres = result.genres
      showDetails.description = result.summary
      showDetails.startDate = result?.premiered
      showDetails.endDate = result?.ended
    })

    var favList = settingsConfig.favShowsList
    var index = favList.findIndex(show => show._id === showId.toString())

    if (index === -1) {
      favShowButton.text = "Adicionar dos favoritos"
    } else {
      favShowButton.text = "Remover dos favoritos"
      favShowButton.bgColor = "red"
    }
  }
}
