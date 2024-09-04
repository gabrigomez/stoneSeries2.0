#ifndef APICONTROLLER_H
#define APICONTROLLER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>

class ApiController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isCastLoad READ isCastLoad WRITE setIsCastLoad NOTIFY isCastLoadChanged FINAL)  // to control CastCard load state
public:
    explicit ApiController(QObject *parent = nullptr);
    bool isCastLoad() const;
    void setIsCastLoad(const bool &newIsCastLoad);

    Q_INVOKABLE void fetchShows(const QString &query);
    Q_INVOKABLE void fetchCelebrities(const QString &query);
    Q_INVOKABLE void fetchCast(int id);
    Q_INVOKABLE void fetchEpisodes(int id);
    Q_INVOKABLE void fetchShowDetails(int id);
    Q_INVOKABLE void fetchEpisodeDetails(int id);
    Q_INVOKABLE void fetchCelebrityDetails(int id);
    Q_INVOKABLE void fetchCelebrityShows(int id);

signals:
    void showDetailsFetched(const QJsonObject &details);
    void showsFetched(const QJsonArray &shows);
    void episodesFetched(const QJsonArray &episodes);
    void celebritiesFetched(const QJsonArray &celebrities);
    void castFetched(const QJsonArray &cast);
    void celebrityDetailsFetched(const QJsonObject &details);
    void episodeDetailsFetched(const QJsonObject &details);
    void celebrityShowsFetched(const QJsonArray &details);
    void errorOccurred(const QString &error);
    void isCastLoadChanged();

private slots:
    void onShowDetailsReply();
    void onShowsReply();
    void onEpisodesReply();
    void onEpisodeDetailsReply();
    void onCelebritiesReply();
    void onCastReply();
    void onCelebrityShowsReply();
    void onCelebrityDetailsReply();

private:
    QNetworkAccessManager *networkManager;
    bool m_isCastLoad;
};


#endif
