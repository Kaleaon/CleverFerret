.class public Lorg/apache/commons/vfs2/provider/URLFileName;
.super Lorg/apache/commons/vfs2/provider/GenericFileName;
.source "URLFileName.java"


# static fields
.field private static final BUFFER_SIZE:I = 0xfa


# instance fields
.field private final queryString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;Ljava/lang/String;)V
    .locals 0

    .line 36
    invoke-direct/range {p0 .. p8}, Lorg/apache/commons/vfs2/provider/GenericFileName;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)V

    move-object p1, p0

    .line 37
    iput-object p9, p1, Lorg/apache/commons/vfs2/provider/URLFileName;->queryString:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public createName(Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;)Lorg/apache/commons/vfs2/FileName;
    .locals 10

    .line 99
    new-instance v0, Lorg/apache/commons/vfs2/provider/URLFileName;

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getHostName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPort()I

    move-result v3

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getDefaultPort()I

    move-result v4

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getUserName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPassword()Ljava/lang/String;

    move-result-object v6

    .line 100
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getQueryString()Ljava/lang/String;

    move-result-object v9

    move-object v7, p1

    move-object v8, p2

    invoke-direct/range {v0 .. v9}, Lorg/apache/commons/vfs2/provider/URLFileName;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/commons/vfs2/FileType;Ljava/lang/String;)V

    return-object v0
.end method

.method protected createURI()Ljava/lang/String;
    .locals 2

    .line 110
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getQueryString()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0xfa

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 112
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/GenericFileName;->createURI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getQueryString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 119
    :cond_0
    invoke-super {p0}, Lorg/apache/commons/vfs2/provider/GenericFileName;->createURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPathQuery()Ljava/lang/String;
    .locals 2

    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0xfa

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 56
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getQueryString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPathQueryEncoded(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/httpclient/URIException;,
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 72
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getQueryString()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    .line 74
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPathDecoded()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/apache/commons/httpclient/util/URIUtil;->encodePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 76
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPathDecoded()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/httpclient/util/URIUtil;->encodePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 79
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0xfa

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    if-eqz p1, :cond_2

    .line 81
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPathDecoded()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p1}, Lorg/apache/commons/httpclient/util/URIUtil;->encodePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 83
    :cond_2
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPathDecoded()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/httpclient/util/URIUtil;->encodePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    :goto_0
    const-string p1, "?"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/URLFileName;->getQueryString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getQueryString()Ljava/lang/String;
    .locals 1

    .line 46
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/URLFileName;->queryString:Ljava/lang/String;

    return-object v0
.end method

.method public getURIEncoded(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;,
            Lorg/apache/commons/httpclient/URIException;
        }
    .end annotation

    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0xfa

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x1

    .line 132
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/vfs2/provider/URLFileName;->appendRootUri(Ljava/lang/StringBuilder;Z)V

    .line 133
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/URLFileName;->getPathQueryEncoded(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
