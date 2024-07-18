import QtQuick
import QtQuick.Controls

Button {
  id: favShowButton
  text: ""
  width: implicitContentWidth + 60
  height: 36

  anchors {
    top: showDetailsStatus.bottom
    topMargin: 20
  }

  property string bgColor: "#08FF5B"

  QtObject {
    id: favListManager

    function manageShow(showDetails, showId) {
      const newShow = {
        "name": showDetails.name,
        "imageUrl": showDetails?.image,
        "rating": showDetails.rating,
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
    favListManager.manageShow(showDetails, showId)
  }

  background: Rectangle {
    id: favShowButtonColor
    color: favShowButton.hovered ? favShowButton.bgColor : "white"
    border.color: "black"
    radius: 5
  }

  Image {
    source: favShowButton.text === "Adicionar aos favoritos" ? "../../assets/GoldStar.png" : "../../assets/TrashIcon.png"
    height: 20
    width: 20

    anchors {
      left: favShowButton.left
      leftMargin: 6
      top: favShowButton.top
      topMargin: 7
    }
  }

  contentItem: Text {
    id: favShowTextButton
    text: favShowButton.text
    color: "black"
    font.pixelSize: 16

    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
  }
}
