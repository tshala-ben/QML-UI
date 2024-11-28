#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>
#include <QTimer>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carlocked READ carlocked WRITE setCarlocked NOTIFY carlockedChanged)
    Q_PROPERTY(int outdoor_temp READ outdoor_temp WRITE setOutdoor_temp NOTIFY outdoor_tempChanged)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged)

public:
    explicit System(QObject *parent = nullptr);

    bool carlocked() const;
    int outdoor_temp() const;
    QString userName() const;
    QString currentTime() const;


public slots:
    void setCarlocked(bool newCarlocked);
    void setOutdoor_temp(int newOutdoor_temp);
    void setUserName(const QString &newUserName);  // Déclaration dans le slot (doit être cohérent avec le header)
    void setCurrentTime(QString currentTime);
    void currentTimeTimerTimeout();

signals:
    void carlockedChanged();
    void outdoor_tempChanged();
    void userNameChanged();  // Correction du nom du signal
    void currentTimeChanged();

private:
    bool m_carlocked;
    int m_outdoor_temp;
    QString m_userName;
    QString m_currentTime;
    QTimer *m_currentTimeTimer;
};

#endif // SYSTEM_H
