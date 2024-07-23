import QtQuick
import QtQuick.Controls

Rectangle {
  id: search
  width: 220
  height: 40
  color: "transparent"

  anchors {
    right: parent.right
    rightMargin: 4
    verticalCenter: parent.verticalCenter
  }

  function performSearch() {
    searchController.search = searchInputText.text
    stackView.push("../pages/Results.qml")
  }

  TextField {
    id: searchInputText
    width: 170
    height: 40

    placeholderText: "Digite sua pesquisa"
    focus: true

    onAccepted: {
      search.performSearch()
    }

    Keys.onEscapePressed: () => {
                            stackView.push("Home.qml")
                          }
  }

  SearchIcon {}
}
