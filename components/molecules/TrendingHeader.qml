import QtQuick
import "../atoms" as Atoms

Rectangle {
  id: homeTitle
  height: 46
  width: root.width
  y: 6

  color: settingsConfig.themeColor
  border.color: "black"

  Atoms.TrendingIcon {
    anchors {
      left: trendingTitle.right
      leftMargin: 4
    }
  }

  Atoms.TrendingTitle {
    id: trendingTitle
  }
}
