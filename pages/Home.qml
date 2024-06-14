import QtQuick
import QtQuick.Controls.Material 2.12
import "../Api.js" as Api

import "../components/molecules" as Molecules
import "../components/organisms" as Organisms

Rectangle {
  id: homePage

  Molecules.TrendingCard {}

  Organisms.HomeCard {}
}
