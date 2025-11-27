.class Lcom/dropbox/core/v1/DbxEntry$File$Location$1;
.super Lcom/dropbox/core/json/JsonReader;
.source "DbxEntry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v1/DbxEntry$File$Location;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/json/JsonReader<",
        "Lcom/dropbox/core/v1/DbxEntry$File$Location;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 561
    invoke-direct {p0}, Lcom/dropbox/core/json/JsonReader;-><init>()V

    return-void
.end method


# virtual methods
.method public read(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v1/DbxEntry$File$Location;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/dropbox/core/json/JsonReadException;
        }
    .end annotation

    .line 567
    invoke-static {p1}, Lcom/dropbox/core/json/JsonArrayReader;->isArrayStart(Lcom/fasterxml/jackson/core/JsonParser;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 568
    invoke-static {p1}, Lcom/dropbox/core/json/JsonReader;->expectArrayStart(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/fasterxml/jackson/core/JsonLocation;

    .line 569
    invoke-static {p1}, Lcom/dropbox/core/json/JsonReader;->readDouble(Lcom/fasterxml/jackson/core/JsonParser;)D

    move-result-wide v0

    .line 570
    invoke-static {p1}, Lcom/dropbox/core/json/JsonReader;->readDouble(Lcom/fasterxml/jackson/core/JsonParser;)D

    move-result-wide v2

    .line 571
    new-instance v4, Lcom/dropbox/core/v1/DbxEntry$File$Location;

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/dropbox/core/v1/DbxEntry$File$Location;-><init>(DD)V

    .line 572
    invoke-static {p1}, Lcom/dropbox/core/json/JsonReader;->expectArrayEnd(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/fasterxml/jackson/core/JsonLocation;

    return-object v4

    .line 574
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/json/JsonReader;->skipValue(Lcom/fasterxml/jackson/core/JsonParser;)V

    const/4 p1, 0x0

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

    .line 561
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v1/DbxEntry$File$Location$1;->read(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/dropbox/core/v1/DbxEntry$File$Location;

    move-result-object p1

    return-object p1
.end method
