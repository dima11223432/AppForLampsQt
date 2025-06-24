#ifndef BULBCONTROLLER_H
#define BULBCONTROLLER_H

#include "bulb.h"
#include "widget.h"
#include <QWidget>
#include <QQuickWidget>
#include <QQmlContext>
#include <QVBoxLayout>
#include <QObject>
#include <QStringList>
#include <QDir>
#include <QThread>
#include <QtConcurrent>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkProxyFactory>

class BulbController: public QObject{
    Q_OBJECT
    QString Port;
    QString Lan_Port;
public:
    explicit BulbController(QObject* parent = nullptr, QString Port ="192.168.1.49",QString Lan_Port = "55443");
    Q_INVOKABLE void Turn_on();
    Q_INVOKABLE void Turn_off();
    Q_INVOKABLE void Set_RGB(const uint64_t&r,const uint64_t&g,const uint64_t&b);
    Q_INVOKABLE void Set_Temperature(const uint64_t& Temperature);
    Q_INVOKABLE void Set_Brightness(const uint64_t& Brightness);
    Q_INVOKABLE void Horizon_mode();
    Q_INVOKABLE void Set_Power(bool flag);
private:
    YeelightAPI::Bulb bulb;
    QNetworkAccessManager* manager;
    QNetworkRequest requestOn;
    QNetworkRequest requestOff;
};

#endif // BULBCONTROLLER_H
