import QtQuick

import "../templates" as Templates

Rectangle {
  id: noResultsPage
  objectName: "noResultsPage"
  width: root.width
  height: 820

  Templates.NotFoundTemplate {}
}
