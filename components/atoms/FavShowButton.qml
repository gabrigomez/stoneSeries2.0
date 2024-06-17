import QtQuick
import QtQuick.Controls

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
