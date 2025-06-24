#ifndef COLORPICKER_H
#define COLORPICKER_H

#include <QObject>
#include <QWidget>

class ColorPicker: public QObject
{
    Q_OBJECT;
public:
    explicit ColorPicker(QObject* parent = nullptr);
};

#endif // COLORPICKER_H
