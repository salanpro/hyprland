import QtQuick 2.15
import QtQuick.Controls 2.15
import SddmComponents 2.0
import "."

Rectangle {
    id : container
    LayoutMirroring.enabled : Qt.locale().textDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit : true
    property int sessionIndex : session.index
    property date dateTime: new Date()

    TextConstants {
        id : textConstants
    }

    FontLoader {
        id : normalFont
        source : "assets/Arimo-Regular.ttf"
    }    FontLoader {
        id : italicFont
        source : "assets/Arimo-Italic.ttf"
    }    FontLoader {
        id : boldFont
        source : "assets/Arimo-Bold.ttf"
    }   FontLoader {
        id : bolditalicFont
        source : "assets/Arimo-BoldItalic.ttf"
    }
    Connections {
        target : sddm
        function onLoginSucceeded() {
            errorMessage.color = "green"
            errorMessage.text = textConstants.loginSucceeded
        }
        function onLoginFailed() {
            password.text = ""
            errorMessage.color = "red"
            errorMessage.text = textConstants.loginFailed
            errorMessage.bold = true
        }
    }

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: container.dateTime = new Date()
    }

    Image {
        id: behind
        anchors.fill: parent
        source: config.background
        fillMode: Image.Stretch
        onStatusChanged: {
            if (config.type === "color") {
                source = config.defaultBackground
            }
        }
    }

    Image {
        anchors.centerIn : parent
        id : promptbox
        source : "assets/promptbox.svg"
        width : 620
        height : 340

        Text {
            id : clock
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 14
            anchors.leftMargin: 14
            color : "black"
            text: Qt.formatDateTime(container.dateTime, "dddd, d MMMM HH:mm:ss t")
            font.pointSize: 12
            font.bold: true
            font.family: boldFont.name
        }

        Column {
            id : entryColumn
            anchors.horizontalCenter : parent.horizontalCenter
            anchors.verticalCenter : parent.verticalCenter
            spacing : 4
            Text {
                color : "#2727f7"
                text : textConstants.welcomeText.arg(sddm.hostName)
                font.family : bolditalicFont.name
                font.italic : true
                font.bold: true
                font.pointSize : 18
                bottomPadding : 8
            }
            Text {
                id : errorMessage
                text : textConstants.prompt
                font.pointSize : 9
                color : "#212121"
                font.family : italicFont.name
                font.italic : true
                bottomPadding : 8
            }
            Row {
                spacing : 26
                Text {
                    id : lblLoginName
                    height : 32
                    width : 72
                    text : textConstants.userName
                    font.pointSize : 9
                    font.italic : true
                    verticalAlignment : Text.AlignVCenter
                    color : "#212121"
                    font.family : italicFont.name
                }
                TextField {
                    id : name
                    font.family : boldFont.name
                    font.bold : true
                    width : 292
                    height : 30
                    leftPadding: 10
                    text : userModel.lastUser
                    selectionColor: "#e1e1e1"
                    font.pointSize : 10
                    color : "black"
                    background : Image {
                        source : "assets/input.svg"
                    }
                    KeyNavigation.tab : password
                    KeyNavigation.backtab : password
                    Keys.onPressed : (event)=> {
                        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            password.focus = true
                            event.accepted = true
                        }
                    }
                }
            }
            Row {
                spacing : 26
                Text {
                    id : lblLoginPassword
                    height : 32
                    width : 72
                    text : textConstants.password
                    verticalAlignment : Text.AlignVCenter
                    color : "black"
                    font.pointSize : 9
                    font.italic : true
                    font.family : italicFont.name
                }
                TextField {
                    id : password
                    font.pointSize : 10
                    echoMode : TextInput.Password
                    font.family : normalFont.name
                    color : "#2f2424"
                    selectionColor: "#e1e1e1"
                    leftPadding: 10
                    width : 292
                    height : 32
                    background : Image {
                        source : "assets/input.svg"
                    }
                    KeyNavigation.backtab : name
                    KeyNavigation.tab : name
                    focus : true
                    Keys.onPressed : (event)=> {
                        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            sddm.login(name.text, password.text, sessionIndex)
                            event.accepted = true
                        }
                    }
                }
            }
            Image {
                id : loginButton
                source : "assets/buttonup.svg"
                anchors.right : parent.right
                width: 92
                height:30

                MouseArea {
                    anchors.fill : parent
                    hoverEnabled : true
                    onEntered : {
                        parent.source = "assets/buttonhover.svg"
                    }
                    onExited : {
                        parent.source = "assets/buttonup.svg"
                    }
                    onPressed : {
                        parent.source = "assets/buttondown.svg"
                        sddm.login(name.text, password.text, sessionIndex)
                    }
                    onReleased : {
                        parent.source = "assets/buttonup.svg"
                    }
                }
                Text {
                    text : textConstants.login
                    anchors.centerIn : parent
                    font.family : bolditalicFont.name
                    font.italic : true
                    font.bold : true
                    font.pointSize : 9
                    color : "#313131"
                }
                KeyNavigation.backtab : password
                KeyNavigation.tab : shutdownButton
            }

        }
    }

    Rectangle {
        anchors.bottom : promptbox.bottom
        anchors.horizontalCenter : promptbox.horizontalCenter
        width : 600
        height : 48
        color: "transparent"

        Text {
            height : 30
            id : lblSession
            width : 48
            anchors.left : parent.left
            anchors.verticalCenter : parent.verticalCenter
            anchors.leftMargin : 8
            text : textConstants.session
            font.pointSize : 9
            font.italic : true
            font.family : italicFont.name
            verticalAlignment : Text.AlignVCenter
            color : "#212121"
        }

        ComboBox {
            id : session
            anchors.left : parent.left
            anchors.verticalCenter : parent.verticalCenter
            anchors.leftMargin : 64
            color : "#ff0000"
            borderColor : "#212121"
            hoverColor : "#84a3c2"
            backgroundNormal: "assets/cbox.svg"
            backgroundHover: "assets/cboxhover.svg"
            backgroundPressed: "assets/cboxhover.svg"
            textColor : "black"
            menuColor : "#c1c1c1"
            width : 164
            height : 30
            font.pointSize : 9
            font.italic : true
            font.family : italicFont.name
            arrowBox : "assets/comboarrow.svg"
            model : sessionModel
            index : sessionModel.lastIndex
            KeyNavigation.backtab : name
            KeyNavigation.tab : password
        }
        Image {
            id : shutdownButton
            source : "assets/buttonup.svg"
            anchors.right : parent.right
            anchors.verticalCenter : parent.verticalCenter
            anchors.rightMargin : 4
            height : 30
            width: 92

            MouseArea {
                anchors.fill : parent
                hoverEnabled : true
                onEntered : {
                    parent.source = "assets/buttonhover.svg"
                }
                onExited : {
                    parent.source = "assets/buttonup.svg"
                }
                onPressed : {
                    parent.source = "assets/buttondown.svg"
                    sddm.powerOff()
                }
                onReleased : {
                    parent.source = "assets/buttonup.svg"
                }
            }
            Text {
                text : textConstants.shutdown
                anchors.centerIn : parent
                font.family : bolditalicFont.name
                font.italic : true
                font.bold : true
                font.pointSize: 9
                color : "#313131"
            }
            KeyNavigation.backtab : rebootButton
            KeyNavigation.tab : shutdownButton
        }
        Image {
            id : rebootButton
            source : "assets/buttonup.svg"
            anchors.right : parent.right
            anchors.verticalCenter : parent.verticalCenter
            anchors.rightMargin : 105
            height : 30
            width: 92

            MouseArea {
                anchors.fill : parent
                hoverEnabled : true
                onEntered : {
                    parent.source = "assets/buttonhover.svg"
                }
                onExited : {
                    parent.source = "assets/buttonup.svg"
                }
                onPressed : {
                    parent.source = "assets/buttondown.svg"
                    sddm.reboot()
                }
                onReleased : {
                    parent.source = "assets/buttonup.svg"
                }
            }
            Text {
                text : textConstants.reboot
                anchors.centerIn : parent
                font.family : bolditalicFont.name
                font.italic : true
                font.bold : true
                font.pointSize: 9
                color : "#313131"
            }
            KeyNavigation.backtab : password
            KeyNavigation.tab : shutdownButton
        }
    }
}
