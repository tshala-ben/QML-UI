#ifndef HVACHANDLER_H
#define HVACHANDLER_H

#include <QObject>

class HVAChandler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int targetTemperature READ targetTemperature WRITE setTargetTemperature NOTIFY targetTemperatureChanged)

public:
    explicit HVAChandler(QObject *parent = nullptr);

    int targetTemperature() const;
    Q_INVOKABLE void incrementeTargetTemperature(const int & val);

    void setTargetTemperature(int newTargetTemperature);

signals:
    void targetTemperatureChanged();
private:
    int m_targetTemperature;
};

#endif // HVACHANDLER_H
