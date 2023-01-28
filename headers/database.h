#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>
#include <QImage>
#include <QFileDialog>

/*



  All database operations are done here. Connection with database, creation of database if there is no database.
  Closing, editing, insert, update and delete operations are done here.


*/
#define DATABASE_HOSTNAME   "StaffDb"
#define DATABASE_NAME QString("Staff.db")

#define TABLE                   "Employee"
#define TABLE1                   "Contract"
#define TABLE2                   "Salesman"



#define TABLE_ID                "id"
#define TABLE_NAME           "name"
#define TABLE_PHONE             "phone"
#define TABLE_WORKHRSDAY              "workhrsday"
#define TABLE_MONTHLYSAlARY             "monthlysalary"


#include "QFile"

class DataBase : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool Connectionerror MEMBER Connectionerror  NOTIFY errorChange)


public:
    explicit DataBase(QObject *parent = 0);
    ~DataBase();





private:
     QSqlDatabase    db;
     bool Connectionerror ;


    bool copy(QFile &sfile, QFile &dfile);
    bool replace(QFile &sfile, QFile &dfile);
    bool ifDBPresent(QString DB);

private:
    bool createTable();
    void closeDataBase();


signals:
    void errorChange();

public slots:

    bool inserIntoTable(const QString &name, const QString &phone, const QString &workhrsday,const QString &monthlysalary);
    bool update(const int id,const QString &name, const QString &phone, const QString &workhrsday,const QString &monthlysalary );
    bool removeRecord(const int id); // tablodan kayıtları kaldırma
    bool insert(const QString &name, const QString &phone, const QString &workhrsday,const QString &monthlysalary );
    bool update2(const int id,const QString &name, const QString &phone, const QString &workhrsday,const QString &monthlysalary  );
    bool remove(const int id); // tablodan kayıtları kaldırma
    bool remove2(const int id); //
    bool insert2( const QString &name, const QString &phone, const QString &product, const QString & workhrsday,const QString &monthlysalary );
    bool update3(const int id,const QString &name, const QString &phone,const QString &product, const QString &workhrsday,const QString &monthlysalary  );


};


#endif // DATABASE_H
