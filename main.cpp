#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "Media_bluetooth.h"
#include "Ofono_bluetooth.h"

int main(int argc, char *argv[])
{

    QApplication app(argc, argv);
    qmlRegisterType<Media>("media.bluetooth", 1, 0, "Media");
    qmlRegisterType<Ofono>("ofono.bluetooth", 1, 0, "Ofono");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/home/Focus_IVI.qml")));

    return app.exec();
}
