#ifndef WIDGET_H
#define WIDGET_H

#include "bulb.h"
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


class Widget : public QWidget
{
    Q_OBJECT

public:
    Widget(QWidget *parent = nullptr);
    ~Widget();
private:
    QQuickWidget* quickWidget;
};
#endif // WIDGET_H
