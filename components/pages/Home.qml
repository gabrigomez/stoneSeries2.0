import QtQuick

import "../molecules" as Molecules
import "../organisms" as Organisms

Rectangle {
  id: homePage

  Molecules.TrendingHeader {}

  Organisms.TrendingCards {}
}
