#include <QGuiApplication>
#include <QQmlApplicationEngine>
//#include <QQmlContext>  // Adicionado para contexto QML, para setContext

#include "controllers/searchcontroller.h"
#include "controllers/apicontroller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("Gomez Company");
    app.setOrganizationDomain("gabrigomez.netlify.app");
    app.setApplicationName("Stone Series 2.0");

    qmlRegisterType<SearchController>("Stone", 2, 0, "SearchController");
    qmlRegisterType<ApiController>("Stone", 2, 0, "ApiController");   //forma mais rápida, em relacao ao setContext

    QQmlApplicationEngine engine;
    //ApiController apiController;  // Instanciação do ApiController

    const QUrl url(QStringLiteral("qrc:/StoneSeries2/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    // Adicionando apiController ao contexto QML, com setContext

    //QQmlContext * rootContext = engine.rootContext();
    //rootContext->setContextProperty("apiController", &apiController);

    return app.exec();
}
