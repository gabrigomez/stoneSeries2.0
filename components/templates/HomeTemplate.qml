import QtQuick

import "../molecules" as Molecules
import "../organisms" as Organisms

Item {
  property var trendingTemplateData: []

  Molecules.TrendingHeader {}

  Organisms.TrendingCards {
    trendingData: trendingTemplateData
  }
}
