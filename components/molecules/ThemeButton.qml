import QtQuick
import QtQuick.Controls

Button {
  id: themeButton

  property string target: ""

  width: 44
  height: 44

  background: Rectangle {
    id: themeButtonBackground
    color: themeButton.hovered ? settingsConfig.themeColor : "white"
    border.color: themeButton.hovered ? settingsConfig.themeColor : "silver"
    radius: 22

    Behavior on color {
      PropertyAnimation {
        duration: 200
        easing.type: Easing.InOutQuad
      }
    }
    Behavior on border.color {
      PropertyAnimation {
        duration: 200
        easing.type: Easing.InOutQuad
      }
    }
  }

  onClicked: {
    if (themeButton.target === "navBar") {
      navBarColorDialog.open()
    } else {
      colorDialog.open()
    }
  }

  Image {
    source: "../../assets/Theme.png"

    width: 28
    height: 28

    anchors {
      centerIn: parent
    }
  }
}
