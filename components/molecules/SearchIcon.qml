import QtQuick

Rectangle {
  width: 30
  height: 30
  anchors {
    right: search.right
    rightMargin: 10
    verticalCenter: parent.verticalCenter
  }

  color: mouse.hovered ? "white" : "transparent"
  radius: 15

  HoverHandler {
    id: mouse
    cursorShape: Qt.PointingHandCursor
  }

  Image {
    id: searchIcon
    source: "../../assets/searchIcon.png"
    width: 30
    height: 30

    MouseArea {
      anchors.fill: parent
      onClicked: {
        search.performSearch()
      }
      cursorShape: mouse.cursorShape
    }
  }
}
