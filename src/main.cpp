#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "AlarmManager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setApplicationName("Alarme");
    app.setOrganizationName("YvanRobR");

    AlarmManager alarmManager;

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("alarm", &alarmManager);

    engine.load(QUrl("qrc:/Main.qml"));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}