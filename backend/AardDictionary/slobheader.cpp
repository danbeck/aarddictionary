#include "slobheader.h"

SlobHeader::SlobHeader(QByteArray magic,
                       QString uuid,
                       QString encoding,
                       QString compression,
                       QMap<QString, QString> tags,
                       QList<QString> contentTypes,
                       long blobCount,
                       long storeOffset,
                       long refsOffset,
                       long size
                       ){
    this->uuid = uuid;
    this->encoding = encoding;
    this->compression = compression;
    this->tags = tags;
    this->contentTypes = contentTypes;
    this->blobCount = blobCount;
    this->storeOffset = storeOffset;
    this->refsOffset = refsOffset;
    this->size = size;
};
