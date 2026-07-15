#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc,char *argv[])
{
    QGuiApplication app(argc,argv);

    app.setApplicationName("Alarme");
    app.setOrganizationName("YvanRobR");

    QQmlApplicationEngine engine;

    engine.load(QUrl("qrc:/qml/Main.qml"));

    if(engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}