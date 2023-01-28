import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1 //RowLayout
import QtQuick.Dialogs 1.2 //TableView
import QtQuick.Controls.Styles 1.3
import QtQuick.Controls.Private 1.0
import QtQuick.Controls 1.3
import QtQuick.Controls 2.12


Item {

     id: delPage

    property string uname: ""
    property string eid: ""
    property string dep: ""
    property string job: ""
    property string gen: ""


     Rectangle{
           width: parent.width
           height: parent.height
           color:backGroundColor


        }

      

      Text {
        id: signupText
        text: qsTr("Delete Employee")
        font.pointSize: 24
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        color: mainTextCOlor
    }    

    TableView {
        id: tableView
        anchors.centerIn: parent
        width: 700
        height: 600

        itemDelegate: Item {

                   Text {
                     anchors.verticalCenter: parent.verticalCenter
                     color: "black"
                     elide: styleData.elideMode
                     text: styleData.value
                     font.pixelSize: 20
                   }
        }



//Verileri siralama islemi
//Data sorting process

        TableViewColumn {

            role: "id"

            title: "ID"

            width: 110

        }
        TableViewColumn {
            role: "name"
            title: qsTr("Name")
           width:140
        }
        TableViewColumn {
            role: "phone"
            title: qsTr("Phone No")
             width: 130
        }

        TableViewColumn {
            role: "workhrsday"
            title: qsTr("Working Hours")
             width: 120
        }
        TableViewColumn {
            role: "monthlysalary"
            title: qsTr("Monthly Salary")
           width: 120
        }
      
        model: myModel
 // Fare sol tıklamasını engellemek için TableView'da çizgileri ayarlama
        rowDelegate: Rectangle {
            //anchors.fill: parent
            color: styleData.selected ? 'skyblue' : (styleData.alternate ? 'whitesmoke' : 'white');
            height:50
            width: parent.width


            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton | Qt.LeftButton
                onClicked: {
                    tableView.selection.clear()
                    tableView.selection.select(styleData.row)
                    tableView.currentRow = styleData.row
                    tableView.focus = true



                    switch(mouse.button) {
                    case Qt.LeftButton:
                        contextMenu.popup() // Call the context menu
                        break
                    default:
                        break
                    }
                }
            }
        }
    }


  Menu {
        id: contextMenu

              
         MenuItem {
            text: qsTr("Delete Employee") 
            onTriggered: {
                /* Satırı veritabanından kaldırma niyetini netleştirecek iletişim kutusunu çağırın
                 * */
                dialogDelete.open()
            }

        }

           MenuItem {
            text: qsTr(" Cancel ") 
            onTriggered: {
                /* Satırı veritabanından kaldırma niyetini netleştirecek iletişim kutusunu çağırın
                 * */
                 popup.close()
            }

        }

  }

 Popup{
        id:popup
        background: Rectangle{
            implicitHeight: 100
            implicitWidth: parent.width
            border.color: "green"
        }

 
MessageDialog {
        id: dialogDelete
        title: qsTr("Delete record") 
        text: qsTr("Confirm the deletion of entries!!") 
        icon: StandardIcon.Warning
        standardButtons: StandardButton.Yes | StandardButton.No


        onYes: {
            /* ... veri modelinden alınan kimliğe göre satırı kaldırın
             *
             * */
            if(database.removeRecord(myModel.getId(tableView.currentRow))) //  if(true)
            {
                console.log("Registration deleted successfully!!")
                myModel.updateModel();
            }
            else
                console.log("Could not delete");


        }
        onNo: {
            console.log("Canceled")
        }
    

 

        }

 }
           Item {
            height: 20
        }


        CButton{
            height: 50
            Layout.preferredWidth: parent.width - 20
            Layout.alignment: Qt.AlignHCenter
            name: "Quit"
            baseColor: mainAppColor
            borderColor: mainAppColor
            Image {
                 source: ("qrc:/Images/cancel.png")
                 x:60

                 Layout.preferredHeight:  300
                  Layout.preferredWidth: -350
              }
            onClicked: logSession()
        }

            
        
 }
    



       


       
  

                  
    











