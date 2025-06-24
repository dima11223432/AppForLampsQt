import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects

Rectangle {
    id: mainwindow
    color: "#1D1D1D"
    width: 1512
    height: 983
        Rectangle{
        id: header
        color: "#282828"
        width: parent.width
        height: 121
        Rectangle{
            id: settingswrapper
            color: "transparent"
            height: 25
            width: 42
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 40.5
            anchors.leftMargin: 50
            Rectangle{
                color:"#9D9D9D"
                width: 42
                height: 5
                radius: 5
                anchors.top: parent.top
            }
            Rectangle{
                color:"#9D9D9D"
                width: 42
                height: 5
                radius: 5
                anchors.top: parent.top
                anchors.topMargin: 10
            }
            Rectangle{
                color:"#9D9D9D"
                width: 42
                height: 5
                radius: 5
                anchors.top: parent.top
                anchors.topMargin: 20
            }
        }
        Label{
            text: "Мой дом"
            font.pixelSize: 30
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 400
            anchors.topMargin: 40.5
        }
        }

        Rectangle{
            color:"#242424"
            width: 875
            height: 198
            radius: 10
            anchors.top:parent.top
            anchors.left:parent.left
            anchors.topMargin: 200
            anchors.leftMargin: 50
            Rectangle{
            color: "#ABABAB"
            width: 73
            height: 73
            radius: 36.5
            anchors.top:parent.top
            anchors.left:parent.left
            anchors.topMargin: 25
            anchors.leftMargin: 10
            Image {
                id: lampimage
                width: parent.width* 0.6
                Layout.fillWidth: true
                anchors.top:parent.top
                anchors.left:parent.left
                anchors.topMargin: 10
                anchors.leftMargin: 14
                source: "qrc:/images/lampicon.svg"
            }
            Label{
                text: "Умная лампа"
                font.pixelSize: 20
                anchors.top:parent.top
                anchors.left:parent.left
                anchors.topMargin: 20
                anchors.leftMargin: 100
            }
            Image {
                id: sunicon
                width: 23.66
                Layout.fillWidth: true
                anchors.top:parent.top
                anchors.left:parent.left
                anchors.topMargin: 100
                anchors.leftMargin: 10
                source: "qrc:/images/SunnyIcon.svg"
            }

            Slider {
                id: slider
                from: 0
                to: 100
                value: 0
                width: 800
                height: 40
                anchors.top:parent.top
                anchors.left:parent.left
                anchors.topMargin: 92
                anchors.leftMargin: 35

                property real lineHeight: 3
                property color emptyColor: "#e0e0e0"
                onValueChanged:{
                    bulbcontroller.Set_Brightness(value);
                }

                background: Rectangle {
                    width: 800
                    height: 3
                    anchors.verticalCenter: parent.verticalCenter
                    color: emptyColor
                    radius: 1.5

                    Rectangle {
                        width: slider.visualPosition * parent.width
                        height: parent.height
                        radius: parent.radius
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#737373" }
                            GradientStop { position: 1.0; color: "#ffffff" }
                        }
                    }
                }

                handle: Rectangle {
                    x: slider.visualPosition * (slider.width - width)
                    anchors.verticalCenter: parent.verticalCenter
                    width: 15
                    height: 15
                    radius: 10
                    color: "white"
                    border.width: 1
                    border.color: "#999"
                }
            }
            Rectangle {
                id: turn_on_button_wrapper
                width: 126
                height: 56
                radius: 56
                color: "transparent"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 710
                anchors.topMargin: 10

                property bool isOn: false
                signal toggled(bool state)

                Rectangle {
                    id: turn_on_button
                    width: parent.width
                    height: parent.height
                    radius: 56
                    color: "#3D3D3D"
                    z: 0

                    // Надписи всегда видимы
                    Label {
                        text: "On"
                        font.pixelSize: 20
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 25
                    }

                    Label {
                        text: "Off"
                        font.pixelSize: 20
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 25
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            turn_on_button_wrapper.isOn = !turn_on_button_wrapper.isOn
                            turn_on_button_wrapper.toggled(turn_on_button_wrapper.isOn)
                            bulbcontroller.Set_Power(turn_on_button_wrapper.isOn)
                        }
                    }

                    Rectangle {
                        id: circle_button
                        width: 56
                        height: 56
                        radius: 28
                        color: "#585858"
                        anchors.verticalCenter: parent.verticalCenter
                        x: turn_on_button_wrapper.isOn ? parent.width - width : 0
                        z: 1

                        Behavior on x {
                            NumberAnimation {
                                duration: 300
                                easing.type: Easing.InOutQuad
                            }
                        }

                        Rectangle {
                            color: "#9F9F9F"
                            width: 4
                            height: 19
                            radius: 2
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.leftMargin: 25
                            anchors.topMargin: 9
                            z: 2
                        }

                        Rectangle {
                            id: turnbutton
                            color: "#9F9F9F"
                            width: 31
                            height: 31
                            radius: 15.5
                            anchors.centerIn: parent

                            Rectangle {
                                color: "#585858"
                                width: 16
                                height: 15
                                anchors.left: parent.left
                                anchors.top: parent.top
                                anchors.leftMargin: 7
                            }

                            Rectangle {
                                color: "#585858"
                                width: 25
                                height: 25
                                radius: 12.5
                                anchors.centerIn: parent
                            }
                        }
                    }
                }
            }
        }
      }
        Rectangle{
            id: __downbuttonswrapper__
            width:323
            height: 73
            radius:40
            color:"transparent"
            anchors.left:parent.left
            anchors.top:parent.top
            anchors.topMargin: 500
            anchors.leftMargin: 324
            Rectangle{
                id: firstbutton
                width: 73
                height: 73
                radius: 36.5
                color: "#3A3A3A"
                Canvas {
                    width: 92
                    height: 78
                    anchors.left:parent.left
                    anchors.top:parent.top
                    anchors.topMargin: 20
                    anchors.leftMargin: 17.5
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0, 0, width, height)

                        // Рисуем прямоугольник (основание домика)
                        ctx.fillStyle = "#CCCCCC"
                        ctx.fillRect(7, 14, 23, 17)

                        // Рисуем треугольник (крышу)
                        ctx.beginPath()
                        ctx.moveTo(18.5, 0)         // Верхняя точка
                        ctx.lineTo(34.5215, 18.75)  // Правая точка
                        ctx.lineTo(2.47853, 18.75)  // Левая точка
                        ctx.closePath()
                        ctx.fill()
                    }
                }
            }
            Rectangle {
                id: secondButton
                width: 73
                height: 73
                radius: width / 2
                color: "#3A3A3A"
                anchors.left: parent.left
                anchors.leftMargin: 125

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("Second button clicked")
                        secondWindow.visible = true
                    }
                }
            }
            Rectangle{
                width:73
                height:73
                radius:36.5
                color: "#3A3A3A"
                anchors.left:parent.left
                anchors.leftMargin: 250
                Rectangle{
                    id: square1
                    width:17
                    height:17
                    color:"#CCCCCC"
                    anchors.left:parent.left
                    anchors.top:parent.top
                    anchors.leftMargin: 18
                    anchors.topMargin: 18
                    z:1
                    Rectangle{
                        width:11
                        height:11
                        color:"#3A3A3A"
                        anchors.centerIn: square1
                        z:2
                    }
                }
                Rectangle{
                    id: square2
                    width:17
                    height:17
                    color:"#CCCCCC"
                    anchors.left:parent.left
                    anchors.top:parent.top
                    anchors.leftMargin: 39
                    anchors.topMargin: 18
                    Rectangle{
                        width:11
                        height:11
                        color:"#3A3A3A"
                        anchors.centerIn: square2
                    }
                }
                Rectangle{
                    id: square3
                    width:17
                    height:17
                    color:"#CCCCCC"
                    anchors.left:parent.left
                    anchors.top:parent.top
                    anchors.leftMargin: 18
                    anchors.topMargin: 39
                    Rectangle{
                        width:11
                        height:11
                        color:"#3A3A3A"
                        anchors.centerIn: square3
                    }
                }
                Rectangle{
                    id: square4
                    width:17
                    height:17
                    color:"#CCCCCC"
                    anchors.left:parent.left
                    anchors.top:parent.top
                    anchors.leftMargin: 39
                    anchors.topMargin: 39
                    Rectangle{
                        width:11
                        height:11
                        color:"#3A3A3A"
                        anchors.centerIn: square4
                    }
                }
            }
        }
        Rectangle{
            width:536
            height:2
            color:"#D9D9D9"
            anchors.left:parent.left
            anchors.top:parent.top
            anchors.topMargin: 600
            anchors.leftMargin: 226
        }

        // хотел сделать colorpicker, но получилось очень коряво
    Window{
        id:secondWindow
            width: 400
            height: 400
            title: "Color Picker"

            Rectangle {
                id: colorCircle
                width: Math.min(parent.width, parent.height) * 0.8
                height: width
                radius: width / 2
                anchors.centerIn: parent
                border.color: "black"
                border.width: 1

                ConicalGradient {
                    anchors.fill: parent
                    angle: 0
                    gradient: Gradient {
                        GradientStop { position: 0.00; color: "red" }
                        GradientStop { position: 0.16; color: "yellow" }
                        GradientStop { position: 0.33; color: "green" }
                        GradientStop { position: 0.50; color: "cyan" }
                        GradientStop { position: 0.66; color: "blue" }
                        GradientStop { position: 0.83; color: "magenta" }
                        GradientStop { position: 1.00; color: "red" }
                    }
                }

                Rectangle {
                    id: selector
                    width: 20
                    height: 20
                    radius: 10
                    border.color: "black"
                    border.width: 2
                    color: "transparent"
                    x: colorCircle.width / 2 - width / 2
                    y: -height / 2
                    transform: Rotation {
                        origin.x: selector.width / 2
                        origin.y: colorCircle.height / 2 + selector.height / 2
                        angle: 0
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var centerX = colorCircle.width / 2
                        var centerY = colorCircle.height / 2
                        var dx = mouseX - centerX
                        var dy = mouseY - centerY
                        var angle = Math.atan2(dy, dx) * 180 / Math.PI
                        if (angle < 0) angle += 360

                        selector.transform[0].angle = angle
                        var hue = angle / 360
                        var color = Qt.hsla(hue, 1.0, 0.5, 1.0)

                        console.log("Выбран цвет: " + color +
                                   " (Hue: " + Math.round(angle) + "°)")

                        selector.color = color
                    }
                }
            }

            Rectangle {
                width: 100
                height: 50
                anchors {
                    bottom: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    margins: 20
                }
                color: selector.color
                border.color: "black"
                border.width: 1

                Text {
                    anchors.centerIn: parent
                    text: selector.color.toString()
                    font.pixelSize: 12
                }
            }
    }
}
