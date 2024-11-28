#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <Controllers/system.h>
#include <Controllers/hvachandler.h>
#include <Controllers/audioontroller.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    System m_systemHandler;  // Création de l'instance de System
    HVAChandler m_driverHVAChandler; //Création de l'instance pour le conducteur
    HVAChandler m_passengeHVAChandlerr; // Création de l'instance pour le passager
    audioontroller m_audioController;



    QQmlApplicationEngine engine;

    // Connection pour gérer les erreurs lors de la création des objets QML
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    // Définir la propriété du contexte avant de charger le QML
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("systemHandler", &m_systemHandler);
    context->setContextProperty("driverHVAC", &m_driverHVAChandler);
    context->setContextProperty("passengerHVAC", &m_passengeHVAChandlerr);
    context->setContextProperty("audioController", &m_audioController);

    // Charger le fichier QML principal
    engine.load(QUrl(QStringLiteral("file:///C:/Users/ailin/OneDrive/Bureau/qt/testla/Main.qml")));  // Assurer que Main.qml est dans le fichier qrc

    // Vérifier si le chargement du QML a réussi
    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    // Lancer l'application
    return app.exec();
}
