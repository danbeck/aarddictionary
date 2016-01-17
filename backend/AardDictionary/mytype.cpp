#include "mytype.h"
#include <QFile>
#include <QDebug>
#include <QFileInfo>

MyType::MyType(QObject *parent) :
    QObject(parent),
    m_message("")
{

}

MyType::~MyType() {

}



void MyType::setHelloWorld(QString msg) {
    QString fileName("../aardDictionary/dictionaries/wordnet-3.1.slob");
    qDebug()<< "From C++ Class";
    QFile file(fileName);
    if (!file.open(QIODevice::ReadOnly )){
        qDebug() << "could not open readonly";
        return ;
    }
    int size = file.size();
    qDebug()<<"file size is: " << size;
    while (!file.atEnd()) {
          QByteArray line = file.readLine();
//          qDebug()<<line;
    }
    m_message = msg;
    Q_EMIT helloWorldChanged();
}
