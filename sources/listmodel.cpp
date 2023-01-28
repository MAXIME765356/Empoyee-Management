#include "headers/listmodel.h"
#include <QLabel>
#include <QSqlRecord>
#include <headers/database.h>

ListModel::ListModel(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();

}


// Method of obtaining data from the model
QVariant ListModel::data(const QModelIndex & index, int role) const {

    // Sayı rolüne göre sütun numarasını tanımlayın
    // Define column number by number role
    int columnId = role - Qt::UserRole - 1;
//    qDebug()<<"User Role"<< Qt::UserRole;
//    qDebug()<<"Column Id:"<< columnId;
//    qDebug()<<"Role:"<< role;



    // Creating array using column id
    QModelIndex modelIndex = this->index(index.row(), columnId);
//    qDebug()<<"Index:"<< index;

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}



QHash<int, QByteArray> ListModel::roleNames() const  {

    QHash<int, QByteArray> roles;
      roles[IdRole] = "id";
      roles[NameRole] = "name";
      roles[PhoneRole] = "phone";
      roles[WorkHrsDayRole] = "workhrsday";
      roles[MonthlySalaryRole] = "monthlysalary";
      return roles;
}


//The method updates the tables in the data model representation
void ListModel::updateModel()
{
    
   
     this->setQuery("select * from Employee");


}




void ListModel::updateData()
{
     
}

// Getting the id of the row in the data view model

 



int ListModel::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}


//Printing data based on selected Id value


QString ListModel::getName(int row)
{
    return this->data(this->index(row, 0), NameRole).toString();
}

QString ListModel::getPhone(int row)
{
   return this->data(this->index(row, 0), PhoneRole).toString();
}


QString ListModel::getWorkHrsDay(int row)
{
    return this->data(this->index(row, 0), WorkHrsDayRole).toString();
}

QString ListModel::getMonthlySalary(int row)
{
    return this->data(this->index(row, 0), MonthlySalaryRole).toString();
}





















