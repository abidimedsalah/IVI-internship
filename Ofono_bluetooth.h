#ifndef OFONO_BLUETOOTH
#define OFONO_BLUETOOTH

#include <QObject>
#include <QProcess>
#include <QDebug>

class Ofono : public QObject{
   Q_OBJECT
public:
    explicit Ofono (QObject* parent = 0) : QObject(parent) {}

    Q_INVOKABLE int call(QString number){
            QString prog = "sudo ./amene.py " + number;
            QProcess *Process = new QProcess();
            qDebug() << Process->execute(prog);
            qDebug() << prog;
            return 1;
    }

    Q_INVOKABLE void answer(){
        QString prog = "sudo ./ofono-master/ofono/test/Answer";
        QProcess *Process = new QProcess();
        Process->execute(prog);
    }

    Q_INVOKABLE void cancel(){
        QString prog = "sudo ./ofono-master/ofono/test/hangup-all";
        QProcess *Process = new QProcess();
        Process->execute(prog);
    }
};

#endif // OFONOBLUETOOTH
