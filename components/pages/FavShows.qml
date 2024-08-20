import QtQuick

import "../templates" as Templates

Item {
  objectName: "favShowPage"

  Templates.FavShowsTemplate {
    id: favShowsTemplate
    favShowsData: favShowsModel
  }

  ListModel {
    id: favShowsModel
  }

  Component.onCompleted: {
    if (settingsConfig.favShowsList.length === 0) {
      favShowsTemplate.noResults = true
    }
    const shows = settingsConfig.favShowsList
    shows.forEach(show => favShowsModel.append(show))
  }
}
