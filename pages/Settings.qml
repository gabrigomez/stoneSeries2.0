import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
  id: settingsCard
  width: root.width
  height: root.height
  color: "transparent"

  Text {
    anchors {
      bottom: settingsInfo.top
      bottomMargin: 10
      horizontalCenter: parent.horizontalCenter
    }
    text: "Suas Informações"
    font.family: bodyFont.font.family
    font.pixelSize: 24
  }

  Rectangle {
    id: settingsInfo
    anchors.centerIn: parent
    width: 300
    height: 300

    color: 'lightgray'
    radius: 20

    Text {
      id: userName
      anchors {
        top: parent.top
        topMargin: 10
        horizontalCenter: parent.horizontalCenter
      }

      text: settingsConfig.userName
      font.family: bodyFont.font.family
      font.pixelSize: 30
    }

    TextField {
      id: settingsInput
      width: 160
      height: 40

      anchors {
        top: userName.bottom
        topMargin: 20
        horizontalCenter: parent.horizontalCenter
      }

      placeholderText: "Edite seu username"
      focus: true

      onTextChanged: {
        if (settingsInput.text.length > 15) {
          warningText.visible = true
          saveButton.enabled = false
        } else {
          warningText.visible = false
          saveButton.enabled = true
        }
      }
    }

    Button {
      id: saveButton
      anchors {
        bottom: parent.bottom
        bottomMargin: 10
        horizontalCenter: parent.horizontalCenter
      }

      text: "Salvar"
      onClicked: () => {
                   settingsConfig.userName = settingsInput.text
                 }
    }

    Text {
      id: warningText
      anchors {
        top: settingsInfo.bottom
        topMargin: 10
        horizontalCenter: parent.horizontalCenter
      }
      text: "O username não pode ter mais de 15 caracteres."
      color: "red"
      visible: false
    }
  }
}
