#include "headers/database.h"
#include <QIODevice>
#include <QSqlField>
#include <QSqlDriver>
#include <QDateTime>
#include <QFile>
#include <headers/listmodel.h>
#include <QDebug>
#include <QCoreApplication>




DataBase::DataBase(QObject *parent) : QObject(parent), Connectionerror(false)
{

//Copy the database with the apk and to give it read and write permissions in the phone

    db = QSqlDatabase::addDatabase("QSQLITE");

    QFile sfile(QString("assets:/db") + QString("/" + DATABASE_NAME ));
    QFile dfile(QString("./" + DATABASE_NAME ));
    QFile::setPermissions("./" + DATABASE_NAME,QFile::WriteOwner | QFile::ReadOwner | QFile::ExeOwner);
    //replace(sfile, dfile);
    copy(sfile, dfile);

  //sfile = source file and dfile = destination file

    if(ifDBPresent(QString("./") + DATABASE_NAME ))
    {
        db.setDatabaseName(QString("./") + DATABASE_NAME );
        db.open();
        Connectionerror = false;
        QSqlQuery r;
        if(!r.exec("pragma foreign_keys = on;"))
        {
            qDebug() << Q_FUNC_INFO << QString::fromUtf8("Erreur : %1").arg(r.lastError().text());
        }
    }
    else
    {
        Connectionerror  = true;
        qDebug() << Q_FUNC_INFO << QString::fromUtf8("Erreur : impossible d'ouvrir la base de données %1 !").arg(QCoreApplication::applicationDirPath() + DATABASE_NAME );
    }

    emit errorChange();


}

DataBase::~DataBase()
{



}

//The specified Database will be created if a database does not exist. Redirect restoreDataBase for this action







void DataBase::closeDataBase()
{
    db.close();
}


//Creates a database
bool DataBase::createTable()
{
    QSqlQuery query;
    if(!query.exec( "CREATE TABLE " TABLE " ("
                            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                            TABLE_NAME     " VARCHAR(255)    NOT NULL,"
                            TABLE_PHONE   "  VARCHAR(255) NOT NULL   ,"
                            TABLE_WORKHRSDAY       " VARCHAR(255)    NOT NULL,"
                            TABLE_MONTHLYSAlARY     " VARCHAR(255)  NOT NULL "
                        " )"
                    )){
        qDebug() << "DataBase: error of create " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}



//Database insert operations
bool DataBase::inserIntoTable( const QString &name, const QString &phone, const QString &workhrsday,const QString &monthlysalary)
{


    QSqlQuery query;

    query.prepare(
                "INSERT INTO " TABLE
                " ("
                TABLE_NAME ", "
                TABLE_PHONE  ","
                TABLE_WORKHRSDAY ","
                TABLE_MONTHLYSAlARY  ") "
                "VALUES (:Name, :Phone, :WorkHrsDay, :MonthlySalary)");




    query.bindValue(":Name",      name);
    query.bindValue(":Phone",        phone);
    query.bindValue(":WorkHrsDay",       workhrsday);
    query.bindValue(":MonthlySalary",   monthlysalary );


    if(!query.exec()){
        qDebug() << "error insert into " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }

    return false;


}


 //Database insert operations
bool DataBase::insert(const QString &name, const QString &phone, const QString &workhrsday,const QString &monthlysalary)

{

 QSqlQuery query;

    query.prepare("INSERT INTO  Contract ( name , phone , workhrsday , monthlysalary ) VALUES (:Name, :Phone, :WorkHrsDay, :MonthlySalary)");



    query.bindValue(":Name",      name);
    query.bindValue(":Phone",   phone);
    query.bindValue(":WorkHrsDay",     workhrsday );
    query.bindValue(":MonthlySalary",  monthlysalary);


    if(!query.exec()){
        qDebug() << "error insert into"  <<TABLE1;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }

    return false;



}

//Update kısmında olan işlemler Insert ile aynıdır.
//Operations in the Update section are the same as Insert

bool DataBase::update(const int id,const QString &name, const QString &phone, const QString &workhrsday,const QString &monthlysalary ) // there are not exists params
{
    //fonksiyona gelen tum datalara debug at

    qDebug() << "update() running..";
    QSqlQuery query;
    qDebug() << "id : " << id;
    qDebug()<< "name : "<< name;
    qDebug()<< "phone : "<< phone;
    qDebug()<< "workhrsday : "<< workhrsday;

    qDebug() << "monthlysalary  : " <<monthlysalary ;

    query.prepare("UPDATE Employee SET NAME=:Name, PHONE=:Phone,WORKHRSDAY=:Workhrsday, MONTHLYSALARY=:Monthlysalary  WHERE id = :ID");


    query.bindValue(":ID",          id);
    query.bindValue(":Name",      name);
    query.bindValue(":Phone",        phone);
    query.bindValue(":Workhrsday",       workhrsday);
    query.bindValue(":Monthlysalary",       monthlysalary );




    qDebug() << "query prepared ! "<< query.exec();

    if(!query.exec()){
        qDebug() << "error update " << TABLE;
        qDebug() << "lastError : " << query.lastError().text();
        return false;
    } else {
        return true;

    }
    return false;
}


//Delete the selected data
bool DataBase::removeRecord(const int id)
{

    // id degerine debug at

    QSqlQuery query;

    query.prepare("DELETE FROM " TABLE " WHERE id= :ID ;");
    query.bindValue(":ID", id);

    if(!query.exec()){
        qDebug() << "error delete row " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;

}

bool DataBase::remove(const int id)
{

    // id degerine debug at

    QSqlQuery query;

    query.prepare("DELETE FROM Contract  WHERE id= :ID ;");
    query.bindValue(":ID", id);

    if(!query.exec()){
        qDebug() << "error delete row " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;

}


bool DataBase::insert2(const QString &name, const QString &phone, const QString &product, const QString & workhrsday,const QString &monthlysalary )

{

 QSqlQuery query;

    query.prepare("INSERT INTO  Salesman (name , phone , product,  workhrsday , monthlysalary ) VALUES (:Name, :Phone,:Product, :WorkHrsDay, :MonthlySalary)");



    query.bindValue(":Name",      name);
    query.bindValue(":Phone",   phone);
    query.bindValue(":Product",   product);
    query.bindValue(":WorkHrsDay",     workhrsday );
    query.bindValue(":MonthlySalary",  monthlysalary);


    if(!query.exec()){
        qDebug() << "error insert into"  <<TABLE2;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }

    return false;



}

bool DataBase::remove2(const int id)
{

    // id degerine debug at

    QSqlQuery query;

    query.prepare("DELETE FROM Salesman  WHERE id= :ID ;");
    query.bindValue(":ID", id);

    if(!query.exec()){
        qDebug() << "error delete row " << TABLE2;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;

}

bool DataBase::update2(const int id,const QString &name, const QString &phone, const QString &workhrsday,const QString &monthlysalary ) // there are not exists params
{
    //fonksiyona gelen tum datalara debug at

    qDebug() << "update() running..";
    QSqlQuery query;
    qDebug() << "id : " << id;
    qDebug()<< "name : "<< name;
    qDebug()<< "phone : "<< phone;
    qDebug()<< "workhrsday : "<< workhrsday;

    qDebug() << "monthlysalary : " << monthlysalary;

    query.prepare("UPDATE Contract SET NAME=:Name, PHONE=:Phone, WORKHRSDAY=:Workhrsday ,MONTHLYSALARY=:Monthlysalary WHERE id = :ID");


    query.bindValue(":ID",          id);
    query.bindValue(":Name",      name);
    query.bindValue(":Phone",       phone);
    query.bindValue(":Workhrsday",       workhrsday);
    query.bindValue(":Monthlysalary",    monthlysalary);




    qDebug() << "query prepared ! "<< query.exec();

    if(!query.exec()){
        qDebug() << "error update " << TABLE1;
        qDebug() << "lastError : " << query.lastError().text();
        return false;
    } else {
        return true;

    }
    return false;
}


bool DataBase::update3(const int id,const QString &name, const QString &phone, const QString &product,const QString &workhrsday,const QString &monthlysalary ) // there are not exists params
{
    //fonksiyona gelen tum datalara debug at

    qDebug() << "update() running..";
    QSqlQuery query;
    qDebug() << "id : " << id;
    qDebug()<< "name : "<< name;
    qDebug()<< "phone : "<< phone;
    qDebug()<< "product : "<< product;

    qDebug() << "workhrsday : " << workhrsday;
    qDebug() << "monthlysalary : " << monthlysalary;

    query.prepare("UPDATE Salesman SET NAME=:Name, PHONE=:Phone, PRODUCT=:Product, WORKHRSDAY=:Workhrsday, MONTHLYSALARY=:Monthlysalary   WHERE id = :ID");


    query.bindValue(":ID",          id);
    query.bindValue(":Name",      name);
    query.bindValue(":Phone",      phone);
    query.bindValue(":Product",     product);
    query.bindValue(":Workhrsday",       workhrsday);
    query.bindValue(":Monthlysalary",    monthlysalary);


    qDebug() << "query prepared ! "<< query.exec();

    if(!query.exec()){
        qDebug() << "error update " << TABLE2;
        qDebug() << "lastError : " << query.lastError().text();
        return false;
    } else {
        return true;

    }
    return false;
}



 bool DataBase::copy(QFile &sfile, QFile &dfile)
{
                         if (sfile.exists())
    {
        return sfile.copy(dfile.fileName());
    }
    return false;
}



bool DataBase::replace(QFile &sfile, QFile &dfile)
{
    bool retour;

    // supprime le fichier destination
    if (sfile.exists())
    {
        if (dfile.exists())
        {
            retour = dfile.remove();
            if(!retour)
            {
                return false;
            }
        }
    }

    return copy(sfile, dfile);
}

bool DataBase::ifDBPresent(QString DB)
{
    QFile fichier(DB);

    if (fichier.exists())
    {
        return true;
    }
    return false;
}


