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
    Q_INVOKABLE void fetchCelebrityDetails(int id);
    Q_INVOKABLE void fetchCelebrityShows(int id);

signals:
    void showDetailsFetched(const QJsonObject &details);
    void showsFetched(const QJsonArray &shows);
    void castFetched(const QJsonArray &cast);
    void celebrityDetailsFetched(const QJsonObject &details);
    void celebrityShowsFetched(const QJsonArray &details);
    void errorOccurred(const QString &error);

private slots:
    void onShowDetailsReply();
    void onShowsReply();
    void onCastReply();
    void onCelebrityShowsReply();
    void onCelebrityDetailsReply();

private:
    QNetworkAccessManager *networkManager;
};


#endif // APICONTROLLER_H
