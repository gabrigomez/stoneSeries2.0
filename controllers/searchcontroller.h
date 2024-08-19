#ifndef SEARCHCONTROLLER_H
#define SEARCHCONTROLLER_H

#include <QObject>

class SearchController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString search READ search WRITE setSearch NOTIFY searchChanged FINAL)
public:
    SearchController();
    QString search() const;
    void setSearch(const QString &newSearch);

    // Declaração do método clear
    Q_INVOKABLE void clear();

signals:
    void searchChanged();

private:
    QString m_search;
};


#endif
