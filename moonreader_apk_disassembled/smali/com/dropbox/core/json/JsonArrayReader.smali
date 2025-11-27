.class public Lcom/dropbox/core/json/JsonArrayReader;
.super Lcom/dropbox/core/json/JsonReader;
.source "JsonArrayReader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "L:Ljava/lang/Object;",
        ">",
        "Lcom/dropbox/core/json/JsonReader<",
        "T",
        "L;",
        ">;"
    }
.end annotation


# instance fields
.field public final collector:Lcom/dropbox/core/util/Collector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/util/Collector<",
            "TT;+T",
            "L;",
            ">;"
        }
    .end annotation
.end field

.field public final elementReader:Lcom/dropbox/core/json/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonReader<",
            "+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/json/JsonReader;Lcom/dropbox/core/util/Collector;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/json/JsonReader<",
            "+TT;>;",
            "Lcom/dropbox/core/util/Collector<",
            "TT;+T",
            "L;",
            ">;)V"
        }
    .end annotation

    .line 15
    invoke-direct {p0}, Lcom/dropbox/core/json/JsonReader;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/dropbox/core/json/JsonArrayReader;->elementReader:Lcom/dropbox/core/json/JsonReader;

    .line 17
    iput-object p2, p0, Lcom/dropbox/core/json/JsonArrayReader;->collector:Lcom/dropbox/core/util/Collector;

    return-void
.end method

.method public static mk(Lcom/dropbox/core/json/JsonReader;)Lcom/dropbox/core/json/JsonArrayReader;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/dropbox/core/json/JsonReader<",
            "+TT;>;)",
            "Lcom/dropbox/core/json/JsonArrayReader<",
            "TT;",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 22
    new-instance v0, Lcom/dropbox/core/json/JsonArrayReader;

    new-instance v1, Lcom/dropbox/core/util/Collector$ArrayListCollector;

    invoke-direct {v1}, Lcom/dropbox/core/util/Collector$ArrayListCollector;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/dropbox/core/json/JsonArrayReader;-><init>(Lcom/dropbox/core/json/JsonReader;Lcom/dropbox/core/util/Collector;)V

    return-object v0
.end method

.method public static mk(Lcom/dropbox/core/json/JsonReader;Lcom/dropbox/core/util/Collector;)Lcom/dropbox/core/json/JsonArrayReader;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "L:Ljava/lang/Object;",
            ">(",
            "Lcom/dropbox/core/json/JsonReader<",
            "+TT;>;",
            "Lcom/dropbox/core/util/Collector<",
            "TT;+T",
            "L;",
            ">;)",
            "Lcom/dropbox/core/json/JsonArrayReader<",
            "TT;T",
            "L;",
            ">;"
        }
    .end annotation

    .line 27
    new-instance v0, Lcom/dropbox/core/json/JsonArrayReader;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/json/JsonArrayReader;-><init>(Lcom/dropbox/core/json/JsonReader;Lcom/dropbox/core/util/Collector;)V

    return-object v0
.end method

.method public static read(Lcom/dropbox/core/json/JsonReader;Lcom/dropbox/core/util/Collector;Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "L:Ljava/lang/Object;",
            ">(",
            "Lcom/dropbox/core/json/JsonReader<",
            "+TT;>;",
            "Lcom/dropbox/core/util/Collector<",
            "TT;+T",
            "L;",
            ">;",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            ")T",
            "L;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/json/JsonReadException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 39
    invoke-static {p2}, Lcom/dropbox/core/json/JsonArrayReader;->expectArrayStart(Lcom/fasterxml/jackson/core/JsonParser;)Lcom/fasterxml/jackson/core/JsonLocation;

    const/4 v0, 0x0

    .line 42
    :goto_0
    invoke-static {p2}, Lcom/dropbox/core/json/JsonArrayReader;->isArrayEnd(Lcom/fasterxml/jackson/core/JsonParser;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 44
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/dropbox/core/json/JsonReader;->read(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v1

    .line 45
    invoke-virtual {p1, v1}, Lcom/dropbox/core/util/Collector;->add(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/dropbox/core/json/JsonReadException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    .line 49
    invoke-virtual {p0, v0}, Lcom/dropbox/core/json/JsonReadException;->addArrayContext(I)Lcom/dropbox/core/json/JsonReadException;

    move-result-object p0

    throw p0

    .line 53
    :cond_0
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 54
    invoke-virtual {p1}, Lcom/dropbox/core/util/Collector;->finish()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public read(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            ")T",
            "L;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/json/JsonReadException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 33
    iget-object v0, p0, Lcom/dropbox/core/json/JsonArrayReader;->elementReader:Lcom/dropbox/core/json/JsonReader;

    iget-object v1, p0, Lcom/dropbox/core/json/JsonArrayReader;->collector:Lcom/dropbox/core/util/Collector;

    invoke-static {v0, v1, p1}, Lcom/dropbox/core/json/JsonArrayReader;->read(Lcom/dropbox/core/json/JsonReader;Lcom/dropbox/core/util/Collector;Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
