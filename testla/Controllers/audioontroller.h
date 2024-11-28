#ifndef AUDIOONTROLLER_H
#define AUDIOONTROLLER_H

#include <QObject>

class audioontroller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int volumeLevel READ volumeLevel WRITE setVolumeLevel NOTIFY volumeLevelChanged)
public:
    explicit audioontroller(QObject *parent = nullptr);

    int volumeLevel() const;

    Q_INVOKABLE void incrementeVolume (const int &val);

    void setVolumeLevel(int newVolumeLevel);

signals:
    void volumeLevelChanged();
private:
    int m_volumeLevel;
};

#endif // AUDIOONTROLLER_H
