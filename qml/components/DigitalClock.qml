import QtQuick 2.15

Item {

    id: root

    property string heure: ""

    implicitHeight: 90
    width: parent ? parent.width : 500

    Timer {
        interval: 1000
        repeat: true
        running: true

        onTriggered: {
            root.heure = Qt.formatTime(new Date(), "hh:mm:ss")
        }
    }

    Component.onCompleted: {
        root.heure = Qt.formatTime(new Date(), "hh:mm:ss")
    }

    Text {

        anchors.centerIn: parent

        text: root.heure

        color: "#4EA3FF"

        font.pixelSize: 52

        font.family: "Sans Serif"

    }

}