#include "system.h"
#include <QTimer>
#include <QDateTime>

System::System(QObject *parent)
    : QObject{parent}, m_carlocked(true), m_outdoor_temp(63), m_userName("Tshala")
{
    m_currentTimeTimer = new QTimer(this);
    m_currentTimeTimer->setInterval(500);
    m_currentTimeTimer->setSingleShot(true);
    connect(m_currentTimeTimer, &QTimer::timeout, this, &System::currentTimeTimerTimeout);

    currentTimeTimerTimeout();
}

bool System::carlocked() const
{
    return m_carlocked;
}

void System::setCarlocked(bool newCarlocked)
{
    if (m_carlocked == newCarlocked)
        return;
    m_carlocked = newCarlocked;
    emit carlockedChanged();
}

int System::outdoor_temp() const
{
    return m_outdoor_temp;
}

void System::setOutdoor_temp(int newOutdoor_temp)
{
    if ( m_outdoor_temp == newOutdoor_temp)
        return;
    m_outdoor_temp = newOutdoor_temp;
    emit outdoor_tempChanged();
}

QString System::userName() const
{
    return m_userName;
}

void System::setUserName(const QString &newUserName)
{
    if (m_userName == newUserName)  // Correction : Utilise m_userName pour correspondre au membre
        return;
    m_userName = newUserName;  // Correction : Assigner à m_userName, pas à m_UserName
    emit userNameChanged();  // Utilisation du signal avec la bonne orthographe
}

void System::currentTimeTimerTimeout()
{
    QDateTime dateTime;
    QString currentTime = dateTime.currentDateTime().toString("h:mm ap");

    setCurrentTime(currentTime);  // Utilisation de la méthode setCurrentTime pour mettre à jour currentTime

    m_currentTimeTimer->start();  // Redémarre le timer
}

QString System::currentTime() const
{
    return m_currentTime;
}

void System::setCurrentTime(QString currentTime)
{
    if (m_currentTime == currentTime)
        return;
    m_currentTime = currentTime;
    emit currentTimeChanged();
}
