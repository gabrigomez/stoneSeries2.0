import QtQuick
import QtQuick.Controls.Material 2.12
import "../../Api.js" as Api

import "../molecules" as Molecules
import "../organisms" as Organisms

Rectangle {
  id: homePage

  Molecules.TrendingHeader {}

  Organisms.TrendingCards {}
}
