import QtQuick
import QtQuick.Controls

Rectangle {
  id: search
  width: 200
  height: 40
  color: "transparent"

  anchors {
    right: parent.right
    rightMargin: 4
    verticalCenter: parent.verticalCenter
  }

  property string searchText: ""

  function performSearch() {
    root.searchText = searchInputText.text
    stackView.push("../pages/Results.qml")
  }

  TextField {
    id: searchInputText
    width: 160
    height: 40

    placeholderText: "Digite sua pesquisa"
    focus: true

    onAccepted: {
      searchText = searchInputText.text
      search.performSearch()
    }

    Keys.onEscapePressed: () => {
                            stackView.push("Home.qml")
                          }
  }

  Image {
    id: searchIcon
    source: "../../assets/searchIcon.png"
    width: 30
    height: 30

    anchors {
      right: search.right
      rightMargin: 10
      verticalCenter: parent.verticalCenter
    }

    MouseArea {
      anchors.fill: parent
      onClicked: {
        searchText = searchInputText.text
        search.performSearch()
      }
    }
  }
}
