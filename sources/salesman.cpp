#include "headers/salesman.h"
#include <QLabel>
#include <QSqlRecord>
#include <headers/database.h>

SalesModel::SalesModel(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();

}


// Method of obtaining data from the model
QVariant SalesModel::data(const QModelIndex & index, int role) const {

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



QHash<int, QByteArray> SalesModel::roleNames() const  {

    QHash<int, QByteArray> roles;
      roles[IdRole] = "id";
      roles[NameRole] = "name";
      roles[PhoneRole] = "phone";
      roles[ProductRole] = "product";
      roles[WorkHrsDayRole] = "workhrsday";
      roles[MonthlySalaryRole] = "monthlysalary";
      return roles;
}


//The method updates the tables in the data model representation
void SalesModel::updateModel()
{


     this->setQuery("select * from Salesman");


}






int SalesModel::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}


//Printing data based on selected Id value


QString SalesModel::getName(int row)
{
    return this->data(this->index(row, 0), NameRole).toString();
}

QString SalesModel::getPhone(int row)
{
   return this->data(this->index(row, 0), PhoneRole).toString();
}


QString SalesModel::getProduct(int row)
{
   return this->data(this->index(row, 0), ProductRole).toString();
}


QString SalesModel::getWorkHrsDay(int row)
{
    return this->data(this->index(row, 0), WorkHrsDayRole).toString();
}

QString SalesModel::getMonthlySalary(int row)
{
    return this->data(this->index(row, 0), MonthlySalaryRole).toString();
}






















