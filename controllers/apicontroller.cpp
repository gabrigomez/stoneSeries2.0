#include "apicontroller.h"

#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QDebug>


ApiController::ApiController(QObject *parent) : QObject(parent) {
    networkManager = new QNetworkAccessManager(this);
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

        // define standart premiered date to shows with no data on it
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

