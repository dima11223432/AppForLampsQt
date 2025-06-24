#include "widget.h"
#include "bulbcontroller.h"

Widget::Widget(QWidget *parent)
    : QWidget(parent)
{
    quickWidget = new QQuickWidget;
    BulbController* bulbcontroller = new BulbController;

    // Подключаем контекст именно к QQuickWidget
    QQmlContext* context = quickWidget->rootContext();
    context->setContextProperty("bulbcontroller",bulbcontroller);

    quickWidget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    quickWidget->setSource(QUrl(QStringLiteral("qrc:/QML/ControllerWindow.qml")));

    auto layout = new QVBoxLayout();
    layout->addWidget(quickWidget);
    setLayout(layout);
}

Widget::~Widget() {}

