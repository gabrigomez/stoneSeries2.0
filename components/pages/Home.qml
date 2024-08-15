import QtQuick

import "../templates" as Templates

Rectangle {
  id: homePage

  function findIndexByShowId(model, showId) {
    for (var i = 0; i < model.count; i++) {
      if (model.get(i).show === showId) {
        return i
      }
    }
    return -1
  }

  Templates.HomeTemplate {
    trendingTemplateData: showListView
  }

  ListModel {
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

  Connections {
    target: apiController
    function onShowDetailsFetched(details) {
      var index = findIndexByShowId(showListView, details.id)
      if (index >= 0) {
        showListView.set(index, {
                           "show": details.id,
                           "name": details.name,
                           "imageUrl": details.image.original,
                           "rating": details.rating.average.toString()
                         })
      }
    }
    function onErrorOccurred(errorString) {
      console.error("Error:", errorString)
    }
  }
}
