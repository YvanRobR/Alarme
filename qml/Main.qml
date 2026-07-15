import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Shapes

ApplicationWindow {

    id: window

    visible: true
    width: 520
    height: 720

    title: "Alarme"
    color: "#202124"

    property string heure: ""
    property real demo: 1.0
    property string alarmTime: "07:30"

    Timer {
        interval: 1000
        running: true
        repeat: true

        onTriggered: {
            heure = Qt.formatTime(new Date(), "hh:mm:ss")
        }
    }

    Component.onCompleted: {
        heure = Qt.formatTime(new Date(), "hh:mm:ss")
    }

    Timer {
        interval: 40
        running: true
        repeat: true

        onTriggered: {

            demo -= 0.0015

            if (demo < 0)
                demo = 1

            progress.percent = demo
        }
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

        Item {

            width: 320
            height: 320

            anchors.horizontalCenter: parent.horizontalCenter

            Shape {

                anchors.fill: parent

                ShapePath {

                    strokeWidth: 14
                    strokeColor: "#3a3a3a"
                    fillColor: "transparent"

                    PathAngleArc {

                        centerX: 160
                        centerY: 160

                        radiusX: 130
                        radiusY: 130

                        startAngle: 0
                        sweepAngle: 360
                    }
                }

                ShapePath {

                    id: progress

                    property real percent: 1.0

                    strokeWidth: 14
                    strokeColor: "#4EA3FF"
                    fillColor: "transparent"

                    capStyle: ShapePath.RoundCap

                    PathAngleArc {

                        centerX: 160
                        centerY: 160

                        radiusX: 130
                        radiusY: 130

                        startAngle: -90
                        sweepAngle: 360 * progress.percent
                    }
                }
            }

            Text {

                anchors.centerIn: parent

                text: alarmTime

                color: "white"

                font.pixelSize: 44

                font.bold: true
            }
        }

        Text {

            anchors.horizontalCenter: parent.horizontalCenter

            text: "Réveil programmé à " + alarmTime

            color: "#aaaaaa"

            font.pixelSize: 18
        }

        Button {

            width: 250

            anchors.horizontalCenter: parent.horizontalCenter

            text: "Choisir l'heure"

            onClicked: heurePopup.open()
        }

        Button {

            width: 250

            anchors.horizontalCenter: parent.horizontalCenter

            text: "Choisir la sonnerie"
        }
    }

    Popup {

        id: heurePopup

        modal: true

        focus: true

        anchors.centerIn: parent

        width: 260
        height: 220

        closePolicy: Popup.CloseOnEscape

        Rectangle {

            anchors.fill: parent

            radius: 12

            color: "#2B2D31"

            border.color: "#4EA3FF"

            Column {

                anchors.centerIn: parent

                spacing: 20

                Row {

                    spacing: 10

                    SpinBox {

                        id: h

                        from: 0
                        to: 23

                        value: 7
                    }

                    Text {

                        text: ":"

                        color: "white"

                        font.pixelSize: 28

                        anchors.verticalCenter: parent.verticalCenter
                    }

                    SpinBox {

                        id: m

                        from: 0
                        to: 59

                        value: 30
                    }
                }

                Button {

                    text: "Valider"

                    onClicked: {

                        alarmTime =
                                ("0"+h.value).slice(-2)
                                + ":"
                                + ("0"+m.value).slice(-2)

                        heurePopup.close()
                    }
                }

            }

        }

    }

}