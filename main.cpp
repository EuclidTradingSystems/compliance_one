#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <crudpp/bindigs/qt/interface/net_manager.hpp>
#include <crudpp/bindigs/qt/interface/bridge.hpp>

//#include <bindigs/qt/list.hpp>

#include <crudpp/bindigs/qt/wrappers/controller.hpp>
#include <crudpp/macros.hpp>
//#include "macros.cpp"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    using namespace crudpp;

    qDebug() << "Device supports OpenSSL: " << QSslSocket::supportsSsl();

    QString host{"http://127.0.0.0:8080"};

    for (int i = 0; i < argc; i++)
        if (QString::compare(argv[i], "--host") == 0)
        {
            host = argv[i + 1];
            break;
        }

    qDebug() << "Host :" << host;
    net_manager::instance().init(host);

//    qDebug() << "aggregates = " << QString{AGGREGATES};

    bridge::instance().init();
    bridge::instance().registerQml<AGGREGATES>();
//    client::instance().init();

//    controller<sovereignty> c{};
    make_ctls<AGGREGATES>();

    // qml engine
    const QUrl url(QStringLiteral("qrc:/ui/main.qml"));
    QObject::connect(bridge::instance().engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url]
        (QObject* obj, const QUrl &objUrl)
        {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
            else
                bridge::instance().setQmlObject(obj);
        }, Qt::QueuedConnection);

    bridge::instance().engine->load(url);

//    c.get();

    return app.exec();
}
