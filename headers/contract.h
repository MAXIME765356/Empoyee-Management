#ifndef CONTRACT_H
#define CONTRACT_H


#include <QObject>
#include <QSqlQueryModel>
#include <QBuffer>

class ConModel : public QSqlQueryModel
{
    Q_OBJECT
public:
    /* TableView'da kullanılacak tüm rolleri listeliyoruz.
     * Qt::UserRole parametresinin üzerindeki bellekte olmalılar.
     * Bu adresin altındaki bilgiler özelleştirmeler için olmadığı için
     *
     * We list all the roles to be used in TableView.
     * They must be in memory above the Qt::UserRole parameter.
     * Since the information under this address is not for customizations
     * */
    enum Roles {      // id
        IdRole = Qt::UserRole + 1,      // id
        NameRole,                      // original_title
        PhoneRole,                                           // release_date
        WorkHrsDayRole,                         // tagline
        MonthlySalaryRole                              // vote_average
                               //image
    };



    explicit ConModel(QObject *parent = 0);



    // Make it impossible to return data
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;


protected:
    /*
     * QAbstractItemModel temel sınıfının wild'larında kullanılan yöntem,
     * QSqlQueryModel sınıfını miras alan
     *
     * The method used in the wilds of the QAbstractItemModel base class,
     * Inheriting the QSqlQueryModel class
     * */
    QHash<int, QByteArray> roleNames() const;

signals:


public slots:
    void updateModel();
    void updateData();
    int getId(int row);
    QString getName(int row);
    QString getPhone(int row);
    QString getWorkHrsDay(int row);
    QString getMonthlySalary(int row);




};


#endif // CONTRACT_H
