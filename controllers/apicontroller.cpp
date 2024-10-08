#include "apicontroller.h"

#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QDebug>
#include <QDate>

ApiController::ApiController(QObject *parent) : QObject(parent) {
    networkManager = new QNetworkAccessManager(this);
}

bool ApiController::isCastLoad() const
{
    return m_isCastLoad;
}

void ApiController::setIsCastLoad(const bool &newIsCastLoad)
{

    m_isCastLoad = newIsCastLoad;
    emit isCastLoadChanged();
}

void ApiController::fetchShowDetails(int id) {
    QNetworkRequest request(QUrl("https://api.tvmaze.com/shows/" + QString::number(id)));
    QNetworkReply *reply = networkManager->get(request);
    connect(reply, &QNetworkReply::finished, this, &ApiController::onShowDetailsReply);
}

void ApiController::fetchShows(const QString &query) {
    QNetworkRequest request(QUrl("https://api.tvmaze.com/search/shows?q=" + (query)));
    QNetworkReply *reply = networkManager->get(request);
    connect(reply, &QNetworkReply::finished, this, &ApiController::onShowsReply);
}

void ApiController::fetchCelebrities(const QString &query) {
    QNetworkRequest request(QUrl("https://api.tvmaze.com/search/people?q=" + (query)));
    QNetworkReply *reply = networkManager->get(request);
    connect(reply, &QNetworkReply::finished, this, &ApiController::onCelebritiesReply);
}

void ApiController::fetchCast(int id) {
    QNetworkRequest request(QUrl(QString("https://api.tvmaze.com/shows/%1/cast").arg(id)));
    QNetworkReply *reply = networkManager->get(request);
    connect(reply, &QNetworkReply::finished, this, &ApiController::onCastReply);
}

void ApiController::fetchCelebrityDetails(int id) {
    QNetworkRequest request(QUrl("https://api.tvmaze.com/people/" + QString::number(id)));
    QNetworkReply *reply = networkManager->get(request);
    connect(reply, &QNetworkReply::finished, this, &ApiController::onCelebrityDetailsReply);
}

void ApiController::fetchCelebrityShows(int id) {
    QNetworkRequest request(QUrl(QString("https://api.tvmaze.com/people/%1/castcredits?embed=show").arg(id)));
    QNetworkReply *reply = networkManager->get(request);
    connect(reply, &QNetworkReply::finished, this, &ApiController::onCelebrityShowsReply);
}

void ApiController::fetchEpisodes(int id) {
    QNetworkRequest request(QUrl(QString("https://api.tvmaze.com/shows/%1/episodes").arg(id)));
    QNetworkReply *reply = networkManager->get(request);
    connect(reply, &QNetworkReply::finished, this, &ApiController::onEpisodesReply);
}

void ApiController::fetchEpisodeDetails(int id) {
    QNetworkRequest request(QUrl("https://api.tvmaze.com/episodes/" + QString::number(id)));
    QNetworkReply *reply = networkManager->get(request);
    connect(reply, &QNetworkReply::finished, this, &ApiController::onEpisodeDetailsReply);
}

void ApiController::onCelebrityShowsReply() {
    QNetworkReply *reply = qobject_cast<QNetworkReply*>(sender());

    if(reply->error()== QNetworkReply::NoError) {
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        QJsonArray jsonArray = doc.array();

        QJsonArray celebrityShows;

        for (int i = 0; i < jsonArray.size(); ++i) {
            QJsonObject jsonObj = jsonArray[i].toObject();
            QJsonObject embeddedShowObj = jsonObj["_embedded"].toObject()["show"].toObject();

            QJsonObject celebrityObject;
            celebrityObject["id"] = embeddedShowObj["id"];
            celebrityObject["name"] = embeddedShowObj["name"];

            // define standart image to shows with no image
            if (embeddedShowObj["image"].isObject() && embeddedShowObj["image"].toObject()["medium"].isString()) {
                celebrityObject["image"] = embeddedShowObj["image"].toObject()["medium"];
            } else {
                celebrityObject["image"] = "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg";
            }

            celebrityShows.append(celebrityObject);
        }

        //qDebug() << celebrityShows;

        emit celebrityShowsFetched(celebrityShows);
    } else {
        emit errorOccurred(reply->errorString());
    }
    reply->deleteLater();
}

void ApiController::onCastReply() {
    QNetworkReply *reply = qobject_cast<QNetworkReply*>(sender());

    if(reply->error()== QNetworkReply::NoError) {
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        QJsonArray jsonArray = doc.array();

        emit castFetched(jsonArray);
    } else {
        emit errorOccurred(reply->errorString());
    }
    reply->deleteLater();
}

void ApiController::onCelebrityDetailsReply() {
    QNetworkReply *reply = qobject_cast<QNetworkReply*>(sender());

    if(reply->error() == QNetworkReply::NoError) {
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        QJsonObject jsonObj = doc.object();

        // define standart image to celebrity with no image
        if (jsonObj["image"].isNull()) {
            QJsonObject newJsonObj = jsonObj;
            newJsonObj["image"] = QJsonObject{
                {"medium", "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg"},
                {"original", "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg"}
            };
            jsonObj = newJsonObj;
        }

        // define standart info to celebrity with no birthday date and calculate the age
        if (jsonObj["birthday"].isNull()) {
            QJsonObject newJsonObj = jsonObj;
            newJsonObj["birthday"] = "No info";
            jsonObj = newJsonObj;
        } else {
            QString birthdayStr = jsonObj["birthday"].toString();
            QDate birthday = QDate::fromString(birthdayStr, "yyyy-MM-dd");

            if (birthday.isValid()) {
                int age = birthday.daysTo(QDate::currentDate()) / 365;
                jsonObj["age"] = age;
            } else {
                jsonObj["age"] = "No info";
            }
        }

        // define standart info to celebrity with no country info
        if (jsonObj["country"].isNull()) {
            QJsonObject newJsonObj = jsonObj;
            newJsonObj["country"] = QJsonObject{
                {"name", "No info"},
            };
            jsonObj = newJsonObj;
        }

        emit celebrityDetailsFetched(jsonObj);
    } else {
        emit errorOccurred(reply->errorString());
    }
    reply->deleteLater();
}

void ApiController::onShowDetailsReply() {
    QNetworkReply *reply = qobject_cast<QNetworkReply*>(sender());

    if(reply->error() == QNetworkReply::NoError) {
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        //qDebug() << "Shows fetched:" << doc;
        QJsonObject jsonObj = doc.object();

        // define standart image to shows with no image
        if (jsonObj["image"].isNull()) {
            QJsonObject newJsonObj = jsonObj;
            newJsonObj["image"] = QJsonObject{
                {"medium", "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg"},
                {"original", "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg"}
            };
            jsonObj = newJsonObj;
        }

        // define standart ended date to shows with no data on it
        if(jsonObj["ended"].isNull()) {
            QJsonObject newJsonObj = jsonObj;
            newJsonObj["ended"] = "Now";
            jsonObj = newJsonObj;
        }

        // define standart premiered date to shows with no data on it
        if(jsonObj["ended"].isNull()) {
            QJsonObject newJsonObj = jsonObj;
            newJsonObj["premiered"] = "-";
            jsonObj = newJsonObj;
        }

        // define standart description to shows with no data on it
        if(jsonObj["summary"].isNull()) {
            QJsonObject newJsonObj = jsonObj;
            newJsonObj["summary"] = "No description";
            jsonObj = newJsonObj;
        }

        // define standart rating to shows with no data on it
        if(jsonObj["rating"].toObject()["average"].isNull()) {
            QJsonObject newJsonObj = jsonObj;
            newJsonObj["rating"] = QJsonObject{
                {"average", "SEM NOTA"},
            };;
            jsonObj = newJsonObj;
        }

        // define imdb link
        if(jsonObj["externals"].toObject()["imdb"].isString()) {
            QJsonObject newJsonObj = jsonObj;
            QString imdb = newJsonObj["externals"].toObject()["imdb"].toString();
            QString url = "https://www.imdb.com/title/" + imdb;
            newJsonObj["imdbLink"] = url;

            jsonObj = newJsonObj;
        } else {                                   // just redirect to imdb homepage
            QJsonObject newJsonObj = jsonObj;
            QString url = "https://www.imdb.com/";
            newJsonObj["imdbLink"] = url;

            jsonObj = newJsonObj;
        }

        emit showDetailsFetched(jsonObj);
    } else {
        emit errorOccurred(reply->errorString());
    }
    reply->deleteLater();
}

void ApiController::onShowsReply() {
    QNetworkReply *reply = qobject_cast<QNetworkReply*>(sender());

    if (reply->error() == QNetworkReply::NoError) {
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        QJsonArray jsonArray = doc.array();

        for (int i = 0; i < jsonArray.size(); ++i) {
            QJsonObject jsonObj = jsonArray[i].toObject();
            QJsonObject showObj = jsonObj["show"].toObject();

            // define standart image to shows with no image
            if (!showObj.contains("image") || showObj["image"].isNull()) {
                showObj["image"] = QJsonObject{
                    {"medium", "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg"},
                    {"original", "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg"}
                };
                jsonObj["show"] = showObj;
                jsonArray[i] = jsonObj;
            }

            // define standart rating to shows with no rating
            if (showObj["rating"].toObject()["average"].isNull()) {
                showObj["rating"] = QJsonObject{
                    {"average", "SEM NOTA"},
                };
                jsonObj["show"] = showObj;
                jsonArray[i] = jsonObj;
            }
        }

        emit showsFetched(jsonArray);
    } else {
        emit errorOccurred(reply->errorString());
    }
    reply->deleteLater();
}

void ApiController::onCelebritiesReply() {
    QNetworkReply *reply = qobject_cast<QNetworkReply*>(sender());

    if (reply->error() == QNetworkReply::NoError) {
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        QJsonArray jsonArray = doc.array();

        for (int i = 0; i < jsonArray.size(); ++i) {
            QJsonObject jsonObj = jsonArray[i].toObject();
            QJsonObject celebrityObject = jsonObj["person"].toObject();

            // define standart image to celebrities with no image
            if (!celebrityObject.contains("image") || celebrityObject["image"].isNull()) {
                celebrityObject["image"] = QJsonObject{
                    {"medium", "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg"},
                    {"original", "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg"}
                };
                jsonObj["person"] = celebrityObject;
                jsonArray[i] = jsonObj;
            }
        }

        emit celebritiesFetched(jsonArray);
    } else {
        emit errorOccurred(reply->errorString());
    }
    reply->deleteLater();
}

void ApiController::onEpisodesReply() {
    QNetworkReply *reply = qobject_cast<QNetworkReply*>(sender());

    if (reply->error() == QNetworkReply::NoError) {
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        QJsonArray jsonArray = doc.array();

        for (int i = 0; i < jsonArray.size(); ++i) {
            QJsonObject jsonObj = jsonArray[i].toObject();
            QJsonObject imageObj = jsonObj["image"].toObject();

            // define standart image to episodes with no image
            if (!jsonObj.contains("image") || imageObj.isEmpty() || imageObj["original"].isNull()) {
                imageObj = QJsonObject{
                    {"original", "https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png"}
                };
                jsonObj["image"] = imageObj;
                jsonArray[i] = jsonObj;
            }
        }

        //qDebug() << jsonArray;

        emit episodesFetched(jsonArray);
    } else {
        emit errorOccurred(reply->errorString());
    }
    reply->deleteLater();
}

void ApiController::onEpisodeDetailsReply() {
    QNetworkReply *reply = qobject_cast<QNetworkReply*>(sender());

    if(reply->error() == QNetworkReply::NoError) {
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        QJsonObject jsonObj = doc.object();

        // define standart image to episodes with no image
        if (jsonObj["image"].isNull()) {
            QJsonObject newJsonObj = jsonObj;
            newJsonObj["image"] = QJsonObject{
                {"original", "https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png"}
            };
            jsonObj = newJsonObj;
        }

        // define standart rating to episodes with no data on it
        if(jsonObj["rating"].toObject()["average"].isNull()) {
            QJsonObject newJsonObj = jsonObj;
            newJsonObj["rating"] = QJsonObject{
                                               {"average", "SEM NOTA"},
                                               };;
            jsonObj = newJsonObj;
        }


        emit episodeDetailsFetched(jsonObj);
    } else {
        emit errorOccurred(reply->errorString());
    }
    reply->deleteLater();
}

