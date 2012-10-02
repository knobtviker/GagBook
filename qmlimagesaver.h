#ifndef QMLIMAGESAVER_H
#define QMLIMAGESAVER_H

#include <QDeclarativeItem>

class QMLImageSaver : public QObject
{
    Q_OBJECT
public:
    explicit QMLImageSaver(QObject *parent = 0);

    Q_INVOKABLE QString save(QDeclarativeItem *imageObject, const int id = 0);
};

#endif // QMLIMAGESAVER_H
