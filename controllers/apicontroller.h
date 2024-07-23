#ifndef APICONTROLLER_H
#define APICONTROLLER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>

class ApiController : public QObject
{
    Q_OBJECT
public:
    explicit ApiController(QObject *parent = nullptr);

    Q_INVOKABLE void fetchShowDetails(int id);
    Q_INVOKABLE void fetchShows(const QString &query);
    Q_INVOKABLE void fetchCast(int id);

signals:
    void showDetailsFetched(const QJsonObject &details);
    void showsFetched(const QJsonArray &shows);
    void castFetched(const QJsonArray &cast);
    void errorOccurred(const QString &error);

private slots:
    void onShowDetailsReply();
    void onShowsReply();
    void onCastReply();

private:
    QNetworkAccessManager *networkManager;
};


#endif // APICONTROLLER_H
