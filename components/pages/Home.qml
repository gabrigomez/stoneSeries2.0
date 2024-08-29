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

  function addShowToModel(showIds) {
    for (var i = 0; i < showIds.length; i++) {
      showListView.append({
                            "name": "",
                            "imageUrl": "",
                            "rating": "",
                            "show": showIds[i]
                          })
    }
  }

  Templates.HomeTemplate {
    trendingTemplateData: showListView
  }

  ListModel {
    id: showListView
  }

  Component.onCompleted: {
    var showIds = [526, 169, 66, 73, 2993, 41007, 82, 46562, 44778, 15299]
    addShowToModel(showIds)
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
