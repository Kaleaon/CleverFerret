.class public final Lcom/dropbox/core/v1/DbxDeltaC$Entry$Reader;
.super Lcom/dropbox/core/json/JsonReader;
.source "DbxDeltaC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v1/DbxDeltaC$Entry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Reader"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<MD:",
        "Lcom/dropbox/core/util/Dumpable;",
        ">",
        "Lcom/dropbox/core/json/JsonReader<",
        "Lcom/dropbox/core/v1/DbxDeltaC$Entry<",
        "TMD;>;>;"
    }
.end annotation


# instance fields
.field public final metadataReader:Lcom/dropbox/core/json/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonReader<",
            "TMD;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/json/JsonReader;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/json/JsonReader<",
            "TMD;>;)V"
        }
    .end annotation

    .line 243
    invoke-direct {p0}, Lcom/dropbox/core/json/JsonReader;-><init>()V

    .line 244
    iput-object p1, p0, Lcom/dropbox/core/v1/DbxDeltaC$Entry$Reader;->metadataReader:Lcom/dropbox/core/json/JsonReader;

    return-void
.end method

.method public static read(Lcom/fasterxml/jackson/core/JsonParser;Lcom/dropbox/core/json/JsonReader;)Lcom/dropbox/core/v1/DbxDeltaC$Entry;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<MD:",
            "Lcom/dropbox/core/util/Dumpable;",
            ">(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Lcom/dropbox/core/json/JsonReader<",
            "TMD;>;)",
            "Lcom/dropbox/core/v1/DbxDeltaC$Entry<",
            "TMD;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/dropbox/core/json/JsonReadException;
        }
    .end annotation

    .line 255
    invoke-static {p0}, Lcom/dropbox/core/json/JsonReader;->expectArrayStart(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/fasterxml/jackson/core/JsonLocation;

    move-result-object v0

    .line 257
    invoke-static {p0}, Lcom/dropbox/core/json/JsonReader;->isArrayEnd(Lcom/fasterxml/jackson/core/JsonParser;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 263
    :try_start_0
    sget-object v1, Lcom/dropbox/core/json/JsonReader;->StringReader:Lcom/dropbox/core/json/JsonReader;

    invoke-virtual {v1, p0}, Lcom/dropbox/core/json/JsonReader;->read(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Lcom/dropbox/core/json/JsonReadException; {:try_start_0 .. :try_end_0} :catch_1

    .line 269
    invoke-static {p0}, Lcom/dropbox/core/json/JsonReader;->isArrayEnd(Lcom/fasterxml/jackson/core/JsonParser;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 275
    :try_start_1
    invoke-virtual {p1, p0}, Lcom/dropbox/core/json/JsonReader;->readOptional(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/util/Dumpable;
    :try_end_1
    .catch Lcom/dropbox/core/json/JsonReadException; {:try_start_1 .. :try_end_1} :catch_0

    .line 281
    invoke-static {p0}, Lcom/dropbox/core/json/JsonReader;->isArrayEnd(Lcom/fasterxml/jackson/core/JsonParser;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 285
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 287
    new-instance p0, Lcom/dropbox/core/v1/DbxDeltaC$Entry;

    invoke-direct {p0, v1, p1}, Lcom/dropbox/core/v1/DbxDeltaC$Entry;-><init>(Ljava/lang/String;Lcom/dropbox/core/util/Dumpable;)V

    return-object p0

    .line 282
    :cond_0
    new-instance p0, Lcom/dropbox/core/json/JsonReadException;

    const-string p1, "expecting a two-element array of [path, metadata], found more than two elements"

    invoke-direct {p0, p1, v0}, Lcom/dropbox/core/json/JsonReadException;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonLocation;)V

    throw p0

    :catch_0
    move-exception p0

    const/4 p1, 0x1

    .line 278
    invoke-virtual {p0, p1}, Lcom/dropbox/core/json/JsonReadException;->addArrayContext(I)Lcom/dropbox/core/json/JsonReadException;

    move-result-object p0

    throw p0

    .line 270
    :cond_1
    new-instance p0, Lcom/dropbox/core/json/JsonReadException;

    const-string p1, "expecting a two-element array of [path, metadata], found a one-element array"

    invoke-direct {p0, p1, v0}, Lcom/dropbox/core/json/JsonReadException;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonLocation;)V

    throw p0

    :catch_1
    move-exception p0

    const/4 p1, 0x0

    .line 266
    invoke-virtual {p0, p1}, Lcom/dropbox/core/json/JsonReadException;->addArrayContext(I)Lcom/dropbox/core/json/JsonReadException;

    move-result-object p0

    throw p0

    .line 258
    :cond_2
    new-instance p0, Lcom/dropbox/core/json/JsonReadException;

    const-string p1, "expecting a two-element array of [path, metadata], found a zero-element array"

    invoke-direct {p0, p1, v0}, Lcom/dropbox/core/json/JsonReadException;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonLocation;)V

    throw p0
.end method


# virtual methods
.method public read(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v1/DbxDeltaC$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            ")",
            "Lcom/dropbox/core/v1/DbxDeltaC$Entry<",
            "TMD;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/dropbox/core/json/JsonReadException;
        }
    .end annotation

    .line 249
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxDeltaC$Entry$Reader;->metadataReader:Lcom/dropbox/core/json/JsonReader;

    invoke-static {p1, v0}, Lcom/dropbox/core/v1/DbxDeltaC$Entry$Reader;->read(Lcom/fasterxml/jackson/core/JsonParser;Lcom/dropbox/core/json/JsonReader;)Lcom/dropbox/core/v1/DbxDeltaC$Entry;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic read(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/dropbox/core/json/JsonReadException;
        }
    .end annotation

    .line 238
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v1/DbxDeltaC$Entry$Reader;->read(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v1/DbxDeltaC$Entry;

    move-result-object p1

    return-object p1
.end method
