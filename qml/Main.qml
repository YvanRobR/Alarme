import QtQuick
import QtQuick.Window
import QtQuick.Controls

ApplicationWindow {

    id: window

    visible: true

    width: 520
    height: 720

    title: "Alarme"

    color: "#202124"

    property string heure: ""

    Timer {
        interval: 1000
        running: true
        repeat: true

        onTriggered: {
            heure = Qt.formatTime(new Date(),"hh:mm:ss")
        }
    }

    Component.onCompleted: {
        heure = Qt.formatTime(new Date(),"hh:mm:ss")
    }

    Column {

        anchors.fill: parent

        anchors.margins: 30

        spacing: 25

        Text {

            text: "Alarme"

            anchors.horizontalCenter: parent.horizontalCenter

            color: "white"

            font.pixelSize: 34

            font.bold: true

        }

        Text {

            text: heure

            anchors.horizontalCenter: parent.horizontalCenter

            color: "#4EA3FF"

            font.pixelSize: 56

        }

        Rectangle {

            width: 300
            height: 300

            radius: 150

            anchors.horizontalCenter: parent.horizontalCenter

            color: "#2B2D31"

            border.color: "#4EA3FF"

            border.width: 6

            Text {

                anchors.centerIn: parent

                text: "--:--"

                color: "white"

                font.pixelSize: 46

            }

        }

        Button {

            width: 250

            anchors.horizontalCenter: parent.horizontalCenter

            text: "Choisir l'heure"

        }

        Button {

            width: 250

            anchors.horizontalCenter: parent.horizontalCenter

            text: "Choisir la sonnerie"

        }

    }

}