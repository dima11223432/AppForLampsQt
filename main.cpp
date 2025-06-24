#include "widget.h"
#include "bulb.h"
#include <QApplication>
#include <QThread>
using namespace YeelightAPI;
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Widget w;
    w.show();

    return a.exec();
}
