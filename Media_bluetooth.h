#ifndef MEDIABLUETOOTH
#define MEDIABLUETOOTH
#include <QDBusMessage>
#include <QDBusConnection>
#include <QObject>
#include <QDBusInterface>
#include <QDBusArgument>
#include <QProcess>
#include <QDebug>

class Media : public QObject{
   Q_OBJECT
public:
    explicit Media (QObject* parent = 0) : QObject(parent) {}

    Q_INVOKABLE void play(){
        QDBusConnection bus = QDBusConnection::systemBus();
        QDBusInterface *interface = new QDBusInterface("org.bluez","/org/bluez/hci0/dev_68_48_98_F0_4D_A0","org.bluez.MediaControl1",bus,this);
        interface->call("Play");
    }

    Q_INVOKABLE void pause(){
        QDBusConnection bus = QDBusConnection::systemBus();
        QDBusInterface *interface = new QDBusInterface("org.bluez","/org/bluez/hci0/dev_68_48_98_F0_4D_A0","org.bluez.MediaControl1",bus,this);
        interface->call("Pause");
    }

    Q_INVOKABLE void next(){
        QDBusConnection bus = QDBusConnection::systemBus();
        QDBusInterface *interface = new QDBusInterface("org.bluez","/org/bluez/hci0/dev_68_48_98_F0_4D_A0","org.bluez.MediaControl1",bus,this);
        interface->call("Next");
    }

    Q_INVOKABLE void fastForward(){

        QDBusConnection bus = QDBusConnection::systemBus();
        QDBusInterface *interface = new QDBusInterface("org.bluez","/org/bluez/hci0/dev_68_48_98_F0_4D_A0","org.bluez.MediaControl1",bus,this);
        interface->call("FastForward");
    }

    Q_INVOKABLE void prev(){
        QDBusConnection bus = QDBusConnection::systemBus();
        QDBusInterface *interface = new QDBusInterface("org.bluez","/org/bluez/hci0/dev_68_48_98_F0_4D_A0","org.bluez.MediaControl1",bus,this);
        interface->call("Previous");
    }

    Q_INVOKABLE void rewind(){

        QDBusConnection bus = QDBusConnection::systemBus();
        QDBusInterface *interface = new QDBusInterface("org.bluez","/org/bluez/hci0/dev_68_48_98_F0_4D_A0","org.bluez.MediaControl1",bus,this);
        interface->call("Rewind");
    }

    Q_INVOKABLE int prop(){

       QDBusInterface iface("org.bluez",
                           "/org/bluez/hci0/dev_68_48_98_F0_4D_A0/player0",
                           "org.freedesktop.DBus.Properties",
                           QDBusConnection::systemBus());

       QDBusMessage reply = iface.call("Get", "org.bluez.MediaPlayer1", "Track");

       QHash<QString,QVariant> value = reply.arguments()[0].value<QDBusVariant>().variant().value<QHash<QString,QVariant> >();
          return 0;
    }

    Q_INVOKABLE int etat()
    {

        QDBusConnection bus = QDBusConnection::systemBus();
        QDBusInterface *interface = new QDBusInterface("org.bluez","/org/bluez/hci0/dev_68_48_98_F0_4D_A0/player0","org.bluez.MediaPlayer1",bus,this);
        QVariant prop = interface->property("Status");
        if(prop.toString()== "playing")
            return 1;
        else
            return 0;
    }

    Q_INVOKABLE int call(QString number){
            QString prog = "sudo ./amene.py " + number;
            QProcess *Process = new QProcess();
            qDebug() << Process->execute(prog);
            return 1;
    }

};

#endif // MEDIABLUETOOTH
