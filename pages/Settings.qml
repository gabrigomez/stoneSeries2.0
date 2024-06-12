import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects

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
    width: 500
    height: 500

    color: 'lightgray'
    radius: 20

    MultiEffect {
      //to cut the userAvatar
      id: userAvatarMask
      source: userAvatar
      anchors.fill: userAvatar
      maskEnabled: true
      maskSource: mask
    }

    Image {
      id: userAvatar
      source: settingsConfig.userAvatar
      anchors {
        top: parent.top
        topMargin: 10
        horizontalCenter: parent.horizontalCenter
      }
      width: 200
      height: 200
      visible: false

      //transition when change avatar
      Behavior on source {
        SequentialAnimation {
          PropertyAnimation {
            target: userAvatarMask
            property: "opacity"
            from: 1
            to: 0
            duration: 500
          }
          PropertyAnimation {
            target: userAvatar
            property: "source"
            duration: 0
          }
          PropertyAnimation {
            target: userAvatarMask
            property: "opacity"
            from: 0
            to: 1
            duration: 500
          }
        }
      }
    }

    Item {
      id: mask
      width: userAvatar.width
      height: userAvatar.height
      layer.enabled: true
      visible: false

      Rectangle {
        width: userAvatar.width
        height: userAvatar.height
        radius: width / 2
        color: "black"
      }
    }

    TextField {
      id: settingsImageInput
      width: 160
      height: 40

      anchors {
        top: userAvatar.bottom
        topMargin: 20
        horizontalCenter: parent.horizontalCenter
      }

      placeholderText: "Coloque a URL da imagem"
      focus: true
    }

    Text {
      id: userName
      anchors {
        top: settingsImageInput.bottom
        topMargin: 10
        horizontalCenter: parent.horizontalCenter
      }

      text: settingsConfig.userName
      font.family: bodyFont.font.family
      font.pixelSize: 30

      // transition when change username
      Behavior on text {
        SequentialAnimation {
          PropertyAnimation {
            target: userName
            property: "opacity"
            from: 1
            to: 0
            duration: 500
          }
          PropertyAnimation {
            target: userName
            property: "text"
            duration: 0
          }
          PropertyAnimation {
            target: userName
            property: "opacity"
            from: 0
            to: 1
            duration: 500
          }
        }
      }
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
                   settingsConfig.userAvatar = settingsImageInput.text
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
