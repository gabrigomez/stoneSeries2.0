import QtQuick

Rectangle {
  id: episodeDetailsPage

  Text {
    text: "Episode details page"
    anchors.centerIn: parent
  }

  Component.onCompleted: {
    console.log(episodeId)
  }
}
