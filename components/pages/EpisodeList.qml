import QtQuick

import "../templates" as Templates

Item {
  ListModel {
    id: episodeListModel
  }

  Templates.EpisodeListTemplate {
    episodeList: episodeListModel
  }

  Component.onCompleted: {
    apiController.fetchEpisodes(showId)
  }

  Connections {
    target: apiController
    function onEpisodesFetched(episodes) {
      episodeListModel?.clear()
      if (episodes.length === 0) {
        console.log("No episodes") // implements NotFound for this
      }

      const results = episodes.map(item => ({
                                              "name": item.name,
                                              "_id"//"imageUrl": item.image.original,
                                              : item.id.toString()
                                            }))

      results.map(episode => episodeListModel.append(episode))
    }
  }
}
