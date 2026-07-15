#include "AlarmManager.h"

AlarmManager::AlarmManager(QObject *parent)
    : QObject(parent)
{
    connect(&m_timer,&QTimer::timeout,
            this,&AlarmManager::update);

    m_timer.start(1000);

    update();
}

QString AlarmManager::currentTime() const
{
    return m_currentTime;
}

QString AlarmManager::alarmTime() const
{
    return m_alarm.toString("HH:mm");
}

QString AlarmManager::remainingTime() const
{
    return m_remaining;
}

double AlarmManager::progress() const
{
    return m_progress;
}

void AlarmManager::setAlarmTime(const QString &time)
{
    QTime t = QTime::fromString(time,"HH:mm");

    if(!t.isValid())
        return;

    m_alarm = t;

    emit alarmTimeChanged();

    update();
}

void AlarmManager::update()
{
    QTime now = QTime::currentTime();

    m_currentTime = now.toString("HH:mm:ss");

    int remaining = now.secsTo(m_alarm);

    if(remaining < 0)
        remaining += 24 * 3600;

    int h = remaining / 3600;
    int m = (remaining % 3600) / 60;
    int s = remaining % 60;

    m_remaining = QString("%1:%2:%3")
            .arg(h,2,10,QChar('0'))
            .arg(m,2,10,QChar('0'))
            .arg(s,2,10,QChar('0'));

    m_progress = remaining / 86400.0;

    emit currentTimeChanged();
    emit remainingTimeChanged();
    emit progressChanged();
}