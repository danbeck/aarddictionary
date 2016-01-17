#ifndef SLOBHEADER_H
#define SLOBHEADER_H
#include<QMap>
#include<QList>
#include<QString>

class SlobHeader
{
public:
    SlobHeader();
    SlobHeader(QByteArray magic,
               QString uuid,
               QString encoding,
               QString compression,
               QMap<QString, QString> tags,
               QList<QString> contentTypes,
               long blobCount,
               long storeOffset,
               long refsOffset,
               long size
               );

private:
    QString uuid;
    QString encoding;
    QString compression;
    QMap<QString, QString> tags;
    QList<QString> contentTypes;
    long blobCount;
    long storeOffset;
    long refsOffset;
    long size;

};

#endif // SLOBHEADER_H
