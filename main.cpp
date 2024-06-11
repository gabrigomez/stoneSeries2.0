#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("Gomez Company");
    app.setOrganizationDomain("gabrigomez.netlify.app");
    app.setApplicationName("Stone Series 2.0");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/StoneSeries2/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
