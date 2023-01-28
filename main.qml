import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.LocalStorage 2.0

import "qrc:/js/backend.js" as Backend

ApplicationWindow {
    id: rootWindow
    visible: true
    width: 530
    height: 700
    title: qsTr("Employees")


    property color backGroundColor : "#394454"
    property color mainAppColor: "#6fda9c"
    property color mainTextCOlor: "#f0f0f0"
    property color popupBackGroundColor: "#b44"
    property color popupTextCOlor: "#ffffff"
    property var dataBase

    FontLoader {
        id: fontAwesome
        name: "fontawesome"
        source: "qrc:/icon/fontawesome-webfont.ttf"
    }

    // Main stackview
    StackView{
        id: stackView
        focus: true
        anchors.fill: parent
    }

    // After loading show initial Login Page
    Component.onCompleted: {
        stackView.push("qrc:/qml/menu.qml")   //initial page

    }

    //Popup to show messages or warnings on the bottom postion of the screen
    Popup {
        id: popup
        property alias popMessage: message.text

        background: Rectangle {
            implicitWidth: rootWindow.width
            implicitHeight: 60
            color: popupBackGroundColor
        }
        y: (rootWindow.height - 60)
        modal: true
        focus: true
        closePolicy: Popup.CloseOnPressOutside
        Text {
            id: message
            anchors.centerIn: parent
            font.pointSize: 12
            color: popupTextCOlor
        }
        onOpened: popupClose.start()
    }

    // Popup will be closed automatically in 2 seconds after its opened
    Timer {
        id: popupClose
        interval: 2000
        onTriggered: popup.close()
    }

    function logoutSession()
    {
        stackView.replace("qrc:/qml/menu.qml")
    }

    function logSession()
        {
            stackView.replace("qrc:/qml/LogInPage.qml")
        }

    function logSes()
    {
        stackView.replace("qrc:/qml/addcontract.qml")
    }


    function con()
    {
        stackView.replace("qrc:/qml/contract.qml")
    }


    function aboutApp()
    {
        stackView.replace("qrc:/qml/about.qml")
    }


    function addSales()
    {
        stackView.replace("qrc:/qml/addsales.qml")
    }


    function logS()
    {
        stackView.replace("qrc:/qml/addattendance.qml")
    }


    function attend()
    {
        stackView.replace("qrc:/qml/attendance.qml")
    }

    function sales()
    {
        stackView.replace("qrc:/qml/salesman.qml")
    }

 }







