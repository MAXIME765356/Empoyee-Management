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

     id: upPage

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
        text: qsTr("Salesman")
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
           width:110
        }
        TableViewColumn {
            role: "phone"
            title: qsTr("Phone No")
             width: 130
        }


        TableViewColumn {
            role: "product"
            title: qsTr("Products Sold")
             width: 110
        }


        TableViewColumn {
            role: "workhrsday"
            title: qsTr("Working Hours")
             width: 110
        }
        TableViewColumn {
            role: "monthlysalary"
            title: qsTr("Monthly Salary")
           width: 110
        }

        model: maximeModel
 // Fare sol t??klamas??n?? engellemek i??in TableView'da ??izgileri ayarlama
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



        MenuItem{
            text: qsTr("Update Employee")


            onTriggered:{

                console.log("tableView.currentRow : " + tableView.currentRow);
                idField.text = maximeModel.getId(tableView.currentRow);
                nameField.text = maximeModel.getName(tableView.currentRow);
                phoneField.text= maximeModel.getPhone(tableView.currentRow);
                productField.text= maximeModel.getProduct(tableView.currentRow);
                wkrhrsField.text = maximeModel.getWorkHrsDay(tableView.currentRow);
                monthlysalaryField.text = maximeModel.getMonthlySalary(tableView.currentRow);

                popup.open()

            }
        }



        MenuItem {
                   text: qsTr("Delete Employee")
                   onTriggered: {
                       /* Sat??r?? veritaban??ndan kald??rma niyetini netle??tirecek ileti??im kutusunu ??a????r??n
                        * */
                       dialogDelete.open()
                   }

               }





           MenuItem {
            text: qsTr(" Cancel ")
            onTriggered: {
                /* Sat??r?? veritaban??ndan kald??rma niyetini netle??tirecek ileti??im kutusunu ??a????r??n
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


             contentItem:

              ColumnLayout{
            id: columnLayout
            width: 10
            Text{ text: qsTr("Employee_Id")
            }
            TextField {
                id: idField
                width: 10
            }


            Text {

                width: 10
                text: qsTr("Name")
            }
            TextField { id: nameField}



            Text {text: qsTr(" Phone No ")}

            TextField
            { id: phoneField}




            Text {text: qsTr(" Product ")}

            TextField
            { id: productField}




            Text {text: qsTr("WorkingHrs") }

            TextField {
                id: wkrhrsField
            }

            Text {text: qsTr("MonthlySalary") }
            TextField {
                id: monthlysalaryField

            }


   Button{
                text: qsTr("Save Changes")

                onClicked: {

                       dialogDuzenle.open()


                }
            }



   MessageDialog {
          id: dialogDelete
          title: qsTr("Delete record")
          text: qsTr("Confirm the deletion of entries!!")
          icon: StandardIcon.Warning
          standardButtons: StandardButton.Yes | StandardButton.No


          onYes: {
              /* ... veri modelinden al??nan kimli??e g??re sat??r?? kald??r??n
               *
               * */
              if(database.remove2(maximeModel.getId(tableView.currentRow))) //  if(true)
              {
                  console.log("Registration deleted successfully!!")
                  maximeModel.updateModel();
              }
              else
                  console.log("Could not delete");


          }
          onNo: {
              console.log("Canceled")
          }
      }




 MessageDialog{
                id: dialogDuzenle
                title: qsTr("Regulation")
                text: qsTr("Finish Editing?")
                icon: StandardIcon.Warning
                standardButtons: StandardButton.Yes | StandardButton.No
                onYes: {
                        if(database.update3((maximeModel.getId(tableView.currentRow)),nameField.text , phoneField.text, productField.text, wkrhrsField.text, monthlysalaryField.text))
                        {
                            console.log("Edited successfully")
                            idField.text = "";
                            nameField.text = "";
                            phoneField.text = "";
                            productField.text = "";
                            wkrhrsField.text = "";
                            monthlysalaryField.text="";
                            maxModel.updateModel()

                        }
                    else{
                        console.log("Not edited")
                    }
                   }

                onNo: {
                    console.log("Canceled")
                }

 }

        }

 }
           Item {
            height: 20
        }


        CButton{
            height: 50

            Layout.preferredWidth: 200
            Layout.alignment: Qt.AlignHCenter
            name: "Add"
            baseColor: red
            borderColor: red
            Image {
                 source: ("qrc:/Images/add.png")
                 x:60

                 Layout.preferredHeight:  300
                  Layout.preferredWidth: -350
              }
            onClicked: addSales()
        }



        CButton{

            y: 650
            height: 50
            Layout.preferredWidth: parent.width - 20
            Layout.alignment: Qt.AlignHCenter
            name: "Home"
            baseColor: mainAppColor
            borderColor: mainAppColor
            onClicked: logoutSession()
        }



 }























