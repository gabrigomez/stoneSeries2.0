import QtQuick

import "../templates" as Templates

Item {
  objectName: "favShowPage"

  Templates.FavShowsTemplate {
    favShowsData: favShowsModel
  }

  ListModel {
    id: favShowsModel
  }

  Component.onCompleted: {
    if (settingsConfig.favShowsList.length === 0) {
      noFavListShow.visible = true
    }
    const shows = settingsConfig.favShowsList
    shows.forEach(show => favShowsModel.append(show))
  }
}
