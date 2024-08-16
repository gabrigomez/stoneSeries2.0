import QtQuick

import "../templates" as Templates

Rectangle {
  id: settingsCard
  objectName: "settingsPage"

  width: root.width
  height: root.height
  color: "transparent"

  Templates.SettingsTemplate {}
}
