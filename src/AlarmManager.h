#ifndef ALARMMANAGER_H
#define ALARMMANAGER_H

#include <QObject>
#include <QTimer>
#include <QTime>

class AlarmManager : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString currentTime READ currentTime NOTIFY currentTimeChanged)
    Q_PROPERTY(QString alarmTime READ alarmTime WRITE setAlarmTime NOTIFY alarmTimeChanged)
    Q_PROPERTY(QString remainingTime READ remainingTime NOTIFY remainingTimeChanged)
    Q_PROPERTY(double progress READ progress NOTIFY progressChanged)

public:
    explicit AlarmManager(QObject *parent = nullptr);

    QString currentTime() const;
    QString alarmTime() const;
    QString remainingTime() const;
    double progress() const;

public slots:
    void setAlarmTime(const QString &time);

signals:
    void currentTimeChanged();
    void alarmTimeChanged();
    void remainingTimeChanged();
    void progressChanged();

private slots:
    void update();

private:
    QTimer m_timer;

    QTime m_alarm = QTime(7,30);

    QString m_currentTime;
    QString m_remaining;

    double m_progress = 1.0;
};

#endif