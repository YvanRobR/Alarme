import QtQuick 2.15

Rectangle {

    id: root

    signal clicked()

    property alias text: label.text

    width: 240
    height: 52

    radius: 12

    color: "#3B82F6"

    border.color: "#5AA0FF"

    border.width: 1

    Text {

        id: label

        anchors.centerIn: parent

        color: "white"

        font.pixelSize: 18

    }

    MouseArea {

        anchors.fill: parent

        hoverEnabled: true

        onEntered: root.color = "#5AA0FF"

        onExited: root.color = "#3B82F6"

        onPressed: root.scale = 0.97

        onReleased: {

            root.scale = 1.0

            root.clicked()

        }

    }

    Behavior on scale {

        NumberAnimation {

            duration: 80

        }

    }

}