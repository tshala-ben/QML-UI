#include "hvachandler.h"

HVAChandler::HVAChandler(QObject *parent)
    : QObject{parent}
    ,m_targetTemperature(70)
{}

int HVAChandler::targetTemperature() const
{
    return m_targetTemperature;
}

void HVAChandler::incrementeTargetTemperature(const int &val)
{
    int newTargetTemp = m_targetTemperature + val;
    setTargetTemperature( newTargetTemp);
}

void HVAChandler::setTargetTemperature(int newTargetTemperature)
{
    if (m_targetTemperature == newTargetTemperature)
        return;
    m_targetTemperature = newTargetTemperature;
    emit targetTemperatureChanged();
}
