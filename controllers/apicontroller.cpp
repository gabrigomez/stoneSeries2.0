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

        emit showDetailsFetched(doc.object());
    } else {
        emit errorOccurred(reply->errorString());
    }
    reply->deleteLater();
}

void ApiController::onShowsReply() {
    QNetworkReply *reply = qobject_cast<QNetworkReply*>(sender());

    if(reply->error()== QNetworkReply::NoError) {
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        emit showsFetched(doc.array());
    } else {
        emit errorOccurred(reply->errorString());
    }
    reply->deleteLater();
}
