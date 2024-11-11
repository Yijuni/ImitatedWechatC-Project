#ifndef LISTITEMBASS_H
#define LISTITEMBASS_H

#include <QWidget>
#include "global.h"
class ListItemBase : public QWidget
{
    Q_OBJECT
public:
    explicit ListItemBase(QWidget *parent = nullptr);
    void SetItemType(ListItemType itemType);
    ListItemType GetItemType();
protected:
    virtual void paintEvent(QPaintEvent* event);
private:
    ListItemType _itemType;
public slots:
signals:
};
#endif // LISTITEMBASS_H
