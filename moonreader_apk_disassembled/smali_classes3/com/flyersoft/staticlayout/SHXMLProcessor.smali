.class abstract Lcom/flyersoft/staticlayout/SHXMLProcessor;
.super Ljava/lang/Object;
.source "HyphenationXML.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getEntityMap(Ljava/util/List;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[C>;"
        }
    .end annotation

    .line 1125
    :try_start_0
    invoke-static {p0}, Lcom/flyersoft/staticlayout/SHXMLParser;->getDTDMap(Ljava/util/List;)Ljava/util/HashMap;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 1127
    :catch_0
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    return-object p0
.end method

.method public static read(Lcom/flyersoft/staticlayout/SHXMLReader;Lcom/flyersoft/staticlayout/SHFile;)Z
    .locals 1

    const/high16 v0, 0x10000

    .line 1150
    invoke-static {p0, p1, v0}, Lcom/flyersoft/staticlayout/SHXMLProcessor;->read(Lcom/flyersoft/staticlayout/SHXMLReader;Lcom/flyersoft/staticlayout/SHFile;I)Z

    move-result p0

    return p0
.end method

.method public static read(Lcom/flyersoft/staticlayout/SHXMLReader;Lcom/flyersoft/staticlayout/SHFile;I)Z
    .locals 0

    .line 1156
    :try_start_0
    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/SHFile;->getInputStream()Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_0

    const/4 p0, 0x0

    return p0

    .line 1162
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/flyersoft/staticlayout/SHXMLProcessor;->read(Lcom/flyersoft/staticlayout/SHXMLReader;Ljava/io/InputStream;I)Z

    move-result p0

    .line 1164
    :try_start_1
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return p0
.end method

.method public static read(Lcom/flyersoft/staticlayout/SHXMLReader;Ljava/io/InputStream;I)Z
    .locals 2

    const/4 v0, 0x0

    .line 1134
    :try_start_0
    new-instance v1, Lcom/flyersoft/staticlayout/SHXMLParser;

    invoke-direct {v1, p0, p1, p2}, Lcom/flyersoft/staticlayout/SHXMLParser;-><init>(Lcom/flyersoft/staticlayout/SHXMLReader;Ljava/io/InputStream;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1135
    :try_start_1
    invoke-interface {p0}, Lcom/flyersoft/staticlayout/SHXMLReader;->startDocumentHandler()V

    .line 1136
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/SHXMLParser;->doIt()V

    .line 1137
    invoke-interface {p0}, Lcom/flyersoft/staticlayout/SHXMLReader;->endDocumentHandler()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1143
    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/SHXMLParser;->finish()V

    const/4 p0, 0x1

    return p0

    :catchall_0
    move-exception p0

    move-object v0, v1

    goto :goto_0

    :catch_0
    nop

    move-object v0, v1

    goto :goto_1

    :catchall_1
    move-exception p0

    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/SHXMLParser;->finish()V

    .line 1145
    :cond_0
    throw p0

    :catch_1
    nop

    :goto_1
    if-eqz v0, :cond_1

    .line 1143
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/SHXMLParser;->finish()V

    :cond_1
    const/4 p0, 0x0

    return p0
.end method
