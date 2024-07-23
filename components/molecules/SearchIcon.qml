import QtQuick

Rectangle {
  anchors {
    right: search.right
    rightMargin: 10
    verticalCenter: parent.verticalCenter
  }

  color: mouse.hovered ? "white" : "transparent"
  width: 30
  height: 30
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
