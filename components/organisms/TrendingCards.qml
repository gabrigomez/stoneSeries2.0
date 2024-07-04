import QtQuick
import QtQuick.Controls.Material 2.12

import "../../Api.js" as Api
import "../molecules" as Molecules
import "../organisms" as Organisms

Rectangle {
  height: 700
  width: root.width - 20
  x: 10
  y: 70

  color: "transparent"

  function findIndexByShowId(model, showId) {
    for (var i = 0; i < model.count; i++) {
      if (model.get(i).show === showId) {
        return i
      }
    }
    return -1
  }

  ListView {
    anchors.fill: parent
    orientation: Qt.Horizontal
    spacing: 40
    model: ListModel {
      id: showListView
      ListElement {
        name: ""
        imageUrl: ""
        rating: ""
        show: 526
      }
      ListElement {
        name: ""
        imageUrl: ""
        rating: ""
        show: 169
      }
      ListElement {
        name: ""
        imageUrl: ""
        rating: ""
        show: 66
      }
      ListElement {
        name: ""
        imageUrl: ""
        rating: ""
        show: 73
      }
      ListElement {
        name: ""
        imageUrl: ""
        rating: ""
        show: 2993
      }
      ListElement {
        name: ""
        imageUrl: ""
        rating: ""
        show: 41007
      }
      ListElement {
        name: ""
        imageUrl: ""
        rating: ""
        show: 82
      }
      ListElement {
        name: ""
        imageUrl: ""
        rating: ""
        show: 46562
      }
      ListElement {
        name: ""
        imageUrl: ""
        rating: ""
        show: 44778
      }
      ListElement {
        name: ""
        imageUrl: ""
        rating: ""
        show: 15299
      }
    }

    delegate: Organisms.ShowCard {
      text: name
      image: imageUrl
      showRating: rating + "/10"

      // Component.onCompleted: {
      //   if (typeof show !== 'undefined' && name === "") {
      //     Api.fetchShowDetails(show, function (result) {
      //       showListView?.set(index, {
      //                           "show": show,
      //                           "name": result.name,
      //                           "imageUrl": result.image.original,
      //                           "rating": result.rating.average.toString()
      //                         })
      //     })
      //   }
      // }
      Component.onCompleted: {
        if (typeof show !== 'undefined' && name === "") {
          apiController.fetchShowDetails(show)
        }
      }

      MouseArea {
        anchors.fill: parent
        onClicked: () => {
                     showId = show
                     stackView.push("../pages/ShowDetails.qml")
                   }
      }
    }

    Connections {
      target: apiController
      function onShowDetailsFetched(details) {
        var index = findIndexByShowId(showListView, details.id)
        // console.log("Index:", index)
        // if (index >= 0) {
        showListView.set(index, {
                           "show": details.id,
                           "name": details.name,
                           "imageUrl": details.image.original,
                           "rating": details.rating.average.toString()
                         })
        // }
      }

      function onErrorOccurred(errorString) {
        console.error("Error:", errorString)
      }
    }
  }
}
