.class public final Lcom/dropbox/core/v1/DbxClientV1;
.super Ljava/lang/Object;
.source "DbxClientV1.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v1/DbxClientV1$Uploader;,
        Lcom/dropbox/core/v1/DbxClientV1$CopyRef;,
        Lcom/dropbox/core/v1/DbxClientV1$IODbxException;,
        Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;,
        Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;,
        Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;,
        Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;,
        Lcom/dropbox/core/v1/DbxClientV1$Downloader;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final ChunkedUploadChunkSize:I = 0x400000

.field private static final ChunkedUploadThreshold:J = 0x800000L

.field private static LatestCursorReader:Lcom/dropbox/core/json/JsonReader; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonReader<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final USER_AGENT_ID:Ljava/lang/String; = "Dropbox-Java-SDK"


# instance fields
.field private final accessToken:Ljava/lang/String;

.field private final host:Lcom/dropbox/core/DbxHost;

.field private final requestConfig:Lcom/dropbox/core/DbxRequestConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1673
    new-instance v0, Lcom/dropbox/core/v1/DbxClientV1$11;

    invoke-direct {v0}, Lcom/dropbox/core/v1/DbxClientV1$11;-><init>()V

    sput-object v0, Lcom/dropbox/core/v1/DbxClientV1;->LatestCursorReader:Lcom/dropbox/core/json/JsonReader;

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;)V
    .locals 1

    .line 54
    sget-object v0, Lcom/dropbox/core/DbxHost;->DEFAULT:Lcom/dropbox/core/DbxHost;

    invoke-direct {p0, p1, p2, v0}, Lcom/dropbox/core/v1/DbxClientV1;-><init>(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/DbxHost;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/DbxHost;)V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    .line 68
    iput-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    .line 69
    iput-object p2, p0, Lcom/dropbox/core/v1/DbxClientV1;->accessToken:Ljava/lang/String;

    .line 70
    iput-object p3, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    return-void

    .line 66
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'host\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 65
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'accessToken\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 64
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'requestConfig\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private _getDelta(Ljava/lang/String;Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxDelta;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/dropbox/core/v1/DbxDelta<",
            "Lcom/dropbox/core/v1/DbxEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1573
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v2

    if-eqz p3, :cond_0

    .line 1579
    const-string p3, "true"

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    move-object v8, p3

    const-string v3, "cursor"

    const-string v5, "path_prefix"

    const-string v7, "include_media_info"

    move-object v4, p1

    move-object v6, p2

    filled-new-array/range {v3 .. v8}, [Ljava/lang/String;

    move-result-object v4

    .line 1582
    new-instance v6, Lcom/dropbox/core/v1/DbxClientV1$8;

    invoke-direct {v6, p0}, Lcom/dropbox/core/v1/DbxClientV1$8;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const-string v3, "1/delta"

    const/4 v5, 0x0

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lcom/dropbox/core/v1/DbxClientV1;->doPost(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v1/DbxDelta;

    return-object p1
.end method

.method private _getDeltaC(Lcom/dropbox/core/util/Collector;Ljava/lang/String;Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxDeltaC;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/dropbox/core/util/Collector<",
            "Lcom/dropbox/core/v1/DbxDeltaC$Entry<",
            "Lcom/dropbox/core/v1/DbxEntry;",
            ">;TC;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/dropbox/core/v1/DbxDeltaC<",
            "TC;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1596
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v2

    if-eqz p4, :cond_0

    .line 1602
    const-string p4, "true"

    goto :goto_0

    :cond_0
    const/4 p4, 0x0

    :goto_0
    move-object v8, p4

    const-string v3, "cursor"

    const-string v5, "path_prefix"

    const-string v7, "include_media_info"

    move-object v4, p2

    move-object v6, p3

    filled-new-array/range {v3 .. v8}, [Ljava/lang/String;

    move-result-object v4

    .line 1605
    new-instance v6, Lcom/dropbox/core/v1/DbxClientV1$9;

    invoke-direct {v6, p0, p1}, Lcom/dropbox/core/v1/DbxClientV1$9;-><init>(Lcom/dropbox/core/v1/DbxClientV1;Lcom/dropbox/core/util/Collector;)V

    const-string v3, "1/delta"

    const/4 v5, 0x0

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lcom/dropbox/core/v1/DbxClientV1;->doPost(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v1/DbxDeltaC;

    return-object p1
.end method

.method private _getDeltaLatestCursor(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1656
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v2

    if-eqz p2, :cond_0

    .line 1661
    const-string p2, "true"

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    const-string v0, "path_prefix"

    const-string v1, "include_media_info"

    filled-new-array {v0, p1, v1, p2}, [Ljava/lang/String;

    move-result-object v4

    .line 1664
    new-instance v6, Lcom/dropbox/core/v1/DbxClientV1$10;

    invoke-direct {v6, p0}, Lcom/dropbox/core/v1/DbxClientV1$10;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const-string v3, "1/delta/latest_cursor"

    const/4 v5, 0x0

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lcom/dropbox/core/v1/DbxClientV1;->doPost(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$000(Lcom/dropbox/core/v1/DbxClientV1;)Lcom/dropbox/core/DbxRequestConfig;
    .locals 0

    .line 37
    iget-object p0, p0, Lcom/dropbox/core/v1/DbxClientV1;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v1/DbxClientV1;)Ljava/lang/String;
    .locals 0

    .line 37
    iget-object p0, p0, Lcom/dropbox/core/v1/DbxClientV1;->accessToken:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1100()Lcom/dropbox/core/json/JsonReader;
    .locals 1

    .line 37
    sget-object v0, Lcom/dropbox/core/v1/DbxClientV1;->LatestCursorReader:Lcom/dropbox/core/json/JsonReader;

    return-object v0
.end method

.method private chunkedUploadCheckForOffsetCorrection(Lcom/dropbox/core/http/HttpRequestor$Response;)Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 973
    invoke-virtual {p1}, Lcom/dropbox/core/http/HttpRequestor$Response;->getStatusCode()I

    move-result v0

    const/16 v1, 0x190

    if-eq v0, v1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 975
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/DbxRequestUtil;->loadErrorBody(Lcom/dropbox/core/http/HttpRequestor$Response;)[B

    move-result-object v0

    .line 978
    :try_start_0
    sget-object v2, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;->Reader:Lcom/dropbox/core/json/JsonReader;

    invoke-virtual {v2, v0}, Lcom/dropbox/core/json/JsonReader;->readFully([B)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;
    :try_end_0
    .catch Lcom/dropbox/core/json/JsonReadException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 982
    :catch_0
    invoke-static {p1}, Lcom/dropbox/core/DbxRequestUtil;->getRequestId(Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/String;

    move-result-object p1

    .line 983
    new-instance v2, Lcom/dropbox/core/BadRequestException;

    invoke-static {p1, v1, v0}, Lcom/dropbox/core/DbxRequestUtil;->parseErrorBody(Ljava/lang/String;I[B)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, p1, v0}, Lcom/dropbox/core/BadRequestException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v2
.end method

.method private chunkedUploadCommon([Ljava/lang/String;JLcom/dropbox/core/DbxStreamWriter;)Lcom/dropbox/core/http/HttpRequestor$Response;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Throwable;",
            ">([",
            "Ljava/lang/String;",
            "J",
            "Lcom/dropbox/core/DbxStreamWriter<",
            "TE;>;)",
            "Lcom/dropbox/core/http/HttpRequestor$Response;",
            "^",
            "Lcom/dropbox/core/DbxException;",
            "^TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Ljava/lang/Throwable;
        }
    .end annotation

    const-string v0, "\'chunkSize\' is "

    .line 935
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 936
    new-instance v1, Lcom/dropbox/core/http/HttpRequestor$Header;

    const-string v2, "Content-Type"

    const-string v3, "application/octet-stream"

    invoke-direct {v1, v2, v3}, Lcom/dropbox/core/http/HttpRequestor$Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 937
    new-instance v1, Lcom/dropbox/core/http/HttpRequestor$Header;

    const-string v2, "Content-Length"

    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/dropbox/core/http/HttpRequestor$Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 939
    iget-object v1, p0, Lcom/dropbox/core/v1/DbxClientV1;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    iget-object v2, p0, Lcom/dropbox/core/v1/DbxClientV1;->accessToken:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {v3}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v4

    const-string v3, "Dropbox-Java-SDK"

    const-string v5, "1/chunked_upload"

    move-object v6, p1

    invoke-static/range {v1 .. v7}, Lcom/dropbox/core/DbxRequestUtil;->startPut(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;)Lcom/dropbox/core/http/HttpRequestor$Uploader;

    move-result-object p1

    .line 941
    :try_start_0
    new-instance v1, Lcom/dropbox/core/NoThrowOutputStream;

    invoke-virtual {p1}, Lcom/dropbox/core/http/HttpRequestor$Uploader;->getBody()Ljava/io/OutputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/dropbox/core/NoThrowOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 946
    :try_start_1
    invoke-virtual {p4, v1}, Lcom/dropbox/core/DbxStreamWriter;->write(Lcom/dropbox/core/NoThrowOutputStream;)V
    :try_end_1
    .catch Lcom/dropbox/core/NoThrowOutputStream$HiddenException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 953
    :try_start_2
    invoke-virtual {v1}, Lcom/dropbox/core/NoThrowOutputStream;->getBytesWritten()J

    move-result-wide v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    cmp-long p4, v1, p2

    if-nez p4, :cond_0

    .line 959
    :try_start_3
    invoke-virtual {p1}, Lcom/dropbox/core/http/HttpRequestor$Uploader;->finish()Lcom/dropbox/core/http/HttpRequestor$Response;

    move-result-object p2
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 966
    invoke-virtual {p1}, Lcom/dropbox/core/http/HttpRequestor$Uploader;->close()V

    return-object p2

    :catch_0
    move-exception v0

    move-object p2, v0

    .line 962
    :try_start_4
    new-instance p3, Lcom/dropbox/core/NetworkIOException;

    invoke-direct {p3, p2}, Lcom/dropbox/core/NetworkIOException;-><init>(Ljava/io/IOException;)V

    throw p3

    .line 955
    :cond_0
    new-instance p4, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p2, ", but \'writer\' only wrote "

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p2, " bytes"

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p4, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p4

    :catch_1
    move-exception v0

    move-object p2, v0

    .line 949
    iget-object p3, p2, Lcom/dropbox/core/NoThrowOutputStream$HiddenException;->owner:Lcom/dropbox/core/NoThrowOutputStream;

    if-ne p3, v1, :cond_1

    new-instance p3, Lcom/dropbox/core/NetworkIOException;

    invoke-virtual {p2}, Lcom/dropbox/core/NoThrowOutputStream$HiddenException;->getCause()Ljava/io/IOException;

    move-result-object p2

    invoke-direct {p3, p2}, Lcom/dropbox/core/NetworkIOException;-><init>(Ljava/io/IOException;)V

    throw p3

    .line 950
    :cond_1
    throw p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception v0

    move-object p2, v0

    .line 966
    invoke-virtual {p1}, Lcom/dropbox/core/http/HttpRequestor$Uploader;->close()V

    .line 967
    throw p2
.end method

.method private chunkedUploadParse200(Lcom/dropbox/core/http/HttpRequestor$Response;)Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/BadResponseException;,
            Lcom/dropbox/core/NetworkIOException;
        }
    .end annotation

    .line 991
    sget-object v0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;->Reader:Lcom/dropbox/core/json/JsonReader;

    invoke-static {v0, p1}, Lcom/dropbox/core/DbxRequestUtil;->readJsonFromResponse(Lcom/dropbox/core/json/JsonReader;Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;

    return-object p1
.end method

.method private doGet(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;",
            "Lcom/dropbox/core/DbxRequestUtil$ResponseHandler<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2219
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    iget-object v1, p0, Lcom/dropbox/core/v1/DbxClientV1;->accessToken:Ljava/lang/String;

    const-string v2, "Dropbox-Java-SDK"

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-static/range {v0 .. v7}, Lcom/dropbox/core/DbxRequestUtil;->doGet(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method private getMetadataWithChildrenBase(Ljava/lang/String;ZLcom/dropbox/core/json/JsonReader;)Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Z",
            "Lcom/dropbox/core/json/JsonReader<",
            "+TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 223
    const-string v0, "path"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArg(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v2

    .line 226
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "1/metadata/auto"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    if-eqz p2, :cond_0

    .line 231
    const-string p1, "true"

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    move-object v9, p1

    const-string v4, "list"

    const-string v5, "true"

    const-string v6, "file_limit"

    const-string v7, "25000"

    const-string v8, "include_media_info"

    filled-new-array/range {v4 .. v9}, [Ljava/lang/String;

    move-result-object v4

    .line 234
    new-instance v6, Lcom/dropbox/core/v1/DbxClientV1$2;

    invoke-direct {v6, p0, p3}, Lcom/dropbox/core/v1/DbxClientV1$2;-><init>(Lcom/dropbox/core/v1/DbxClientV1;Lcom/dropbox/core/json/JsonReader;)V

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/dropbox/core/v1/DbxClientV1;->doGet(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method private getMetadataWithChildrenIfChangedBase(Ljava/lang/String;ZLjava/lang/String;Lcom/dropbox/core/json/JsonReader;)Lcom/dropbox/core/util/Maybe;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/json/JsonReader<",
            "TT;>;)",
            "Lcom/dropbox/core/util/Maybe<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    if-eqz p3, :cond_2

    .line 317
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    .line 318
    const-string v0, "path"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArg(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v2

    .line 321
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "1/metadata/auto"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    if-eqz p2, :cond_0

    .line 327
    const-string p1, "true"

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    move-object v11, p1

    const-string v4, "list"

    const-string v5, "true"

    const-string v6, "file_limit"

    const-string v7, "25000"

    const-string v8, "hash"

    const-string v10, "include_media_info"

    move-object v9, p3

    filled-new-array/range {v4 .. v11}, [Ljava/lang/String;

    move-result-object v4

    .line 330
    new-instance v6, Lcom/dropbox/core/v1/DbxClientV1$3;

    move-object/from16 p1, p4

    invoke-direct {v6, p0, p1}, Lcom/dropbox/core/v1/DbxClientV1$3;-><init>(Lcom/dropbox/core/v1/DbxClientV1;Lcom/dropbox/core/json/JsonReader;)V

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/dropbox/core/v1/DbxClientV1;->doGet(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/util/Maybe;

    return-object p1

    .line 317
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'previousFolderHash\' must not be empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 316
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'previousFolderHash\' must not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private startGetSomething(Ljava/lang/String;[Ljava/lang/String;)Lcom/dropbox/core/v1/DbxClientV1$Downloader;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 475
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v0

    .line 479
    iget-object v1, p0, Lcom/dropbox/core/v1/DbxClientV1;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    invoke-virtual {v1}, Lcom/dropbox/core/DbxRequestConfig;->getMaxRetries()I

    move-result v1

    new-instance v2, Lcom/dropbox/core/v1/DbxClientV1$6;

    invoke-direct {v2, p0, v0, p1, p2}, Lcom/dropbox/core/v1/DbxClientV1$6;-><init>(Lcom/dropbox/core/v1/DbxClientV1;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    invoke-static {v1, v2}, Lcom/dropbox/core/DbxRequestUtil;->runAndRetry(ILcom/dropbox/core/DbxRequestUtil$RequestMaker;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v1/DbxClientV1$Downloader;

    return-object p1
.end method


# virtual methods
.method public chunkedUploadAppend(Ljava/lang/String;JJLcom/dropbox/core/DbxStreamWriter;)J
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Throwable;",
            ">(",
            "Ljava/lang/String;",
            "JJ",
            "Lcom/dropbox/core/DbxStreamWriter<",
            "TE;>;)J^",
            "Lcom/dropbox/core/DbxException;",
            "^TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Ljava/lang/Throwable;
        }
    .end annotation

    const-string v0, "Corrected offset is same as given: "

    const-string v1, "Expected offset "

    const-string v2, "uploadId mismatch: us="

    if-eqz p1, :cond_9

    .line 1137
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_8

    const-wide/16 v3, 0x0

    cmp-long v5, p2, v3

    if-ltz v5, :cond_7

    .line 1140
    const-string v3, "offset"

    .line 1142
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    const-string v5, "upload_id"

    filled-new-array {v5, p1, v3, v4}, [Ljava/lang/String;

    move-result-object v3

    .line 1144
    invoke-direct {p0, v3, p4, p5, p6}, Lcom/dropbox/core/v1/DbxClientV1;->chunkedUploadCommon([Ljava/lang/String;JLcom/dropbox/core/DbxStreamWriter;)Lcom/dropbox/core/http/HttpRequestor$Response;

    move-result-object p6

    .line 1145
    invoke-static {p6}, Lcom/dropbox/core/DbxRequestUtil;->getRequestId(Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/String;

    move-result-object v3

    .line 1147
    :try_start_0
    invoke-direct {p0, p6}, Lcom/dropbox/core/v1/DbxClientV1;->chunkedUploadCheckForOffsetCorrection(Lcom/dropbox/core/http/HttpRequestor$Response;)Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;

    move-result-object v4

    add-long/2addr p4, p2

    if-eqz v4, :cond_4

    .line 1151
    iget-object v1, v4, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;->uploadId:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1156
    iget-wide v1, v4, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;->offset:J

    cmp-long p1, v1, p2

    if-eqz p1, :cond_2

    .line 1160
    iget-wide v0, v4, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;->offset:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string p1, ", server said "

    const-string v2, "we were at offset "

    cmp-long v5, v0, p2

    if-ltz v5, :cond_1

    .line 1165
    :try_start_1
    iget-wide v0, v4, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;->offset:J

    cmp-long v5, v0, p4

    if-gtz v5, :cond_0

    .line 1173
    iget-wide p1, v4, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;->offset:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1186
    invoke-virtual {p6}, Lcom/dropbox/core/http/HttpRequestor$Response;->getBody()Ljava/io/InputStream;

    move-result-object p3

    invoke-static {p3}, Lcom/dropbox/core/util/IOUtil;->closeInput(Ljava/io/InputStream;)V

    return-wide p1

    .line 1167
    :cond_0
    :try_start_2
    new-instance p4, Lcom/dropbox/core/BadResponseException;

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p5, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide p1, v4, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;->offset:J

    invoke-virtual {p5, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p4, v3, p1}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw p4

    .line 1162
    :cond_1
    new-instance p4, Lcom/dropbox/core/BadResponseException;

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p5, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide p1, v4, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;->offset:J

    invoke-virtual {p5, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p4, v3, p1}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw p4

    .line 1157
    :cond_2
    new-instance p1, Lcom/dropbox/core/BadResponseException;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, v3, p2}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw p1

    .line 1152
    :cond_3
    new-instance p2, Lcom/dropbox/core/BadResponseException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/dropbox/core/util/StringUtil;->jq(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", server="

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, v4, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;->uploadId:Ljava/lang/String;

    .line 1153
    invoke-static {p1}, Lcom/dropbox/core/util/StringUtil;->jq(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, v3, p1}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw p2

    .line 1176
    :cond_4
    invoke-virtual {p6}, Lcom/dropbox/core/http/HttpRequestor$Response;->getStatusCode()I

    move-result p1

    const/16 p2, 0xc8

    if-ne p1, p2, :cond_6

    .line 1177
    invoke-direct {p0, p6}, Lcom/dropbox/core/v1/DbxClientV1;->chunkedUploadParse200(Lcom/dropbox/core/http/HttpRequestor$Response;)Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;

    move-result-object p1

    .line 1179
    iget-wide p2, p1, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;->offset:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    cmp-long v0, p2, p4

    if-nez v0, :cond_5

    .line 1186
    invoke-virtual {p6}, Lcom/dropbox/core/http/HttpRequestor$Response;->getBody()Ljava/io/InputStream;

    move-result-object p1

    invoke-static {p1}, Lcom/dropbox/core/util/IOUtil;->closeInput(Ljava/io/InputStream;)V

    const-wide/16 p1, -0x1

    return-wide p1

    .line 1180
    :cond_5
    :try_start_3
    new-instance p2, Lcom/dropbox/core/BadResponseException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p4, " bytes, but returned offset is "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide p4, p1, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;->offset:J

    invoke-virtual {p3, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, v3, p1}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw p2

    .line 1176
    :cond_6
    invoke-static {p6}, Lcom/dropbox/core/DbxRequestUtil;->unexpectedStatus(Lcom/dropbox/core/http/HttpRequestor$Response;)Lcom/dropbox/core/DbxException;

    move-result-object p1

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception p1

    .line 1186
    invoke-virtual {p6}, Lcom/dropbox/core/http/HttpRequestor$Response;->getBody()Ljava/io/InputStream;

    move-result-object p2

    invoke-static {p2}, Lcom/dropbox/core/util/IOUtil;->closeInput(Ljava/io/InputStream;)V

    .line 1187
    throw p1

    .line 1138
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'offset\' can\'t be negative"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1137
    :cond_8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'uploadId\' can\'t be empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1136
    :cond_9
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'uploadId\' can\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public chunkedUploadAppend(Ljava/lang/String;J[B)J
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v5, 0x0

    .line 1074
    array-length v6, p4

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v6}, Lcom/dropbox/core/v1/DbxClientV1;->chunkedUploadAppend(Ljava/lang/String;J[BII)J

    move-result-wide p1

    return-wide p1
.end method

.method public chunkedUploadAppend(Ljava/lang/String;J[BII)J
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    int-to-long v4, p6

    .line 1106
    new-instance v6, Lcom/dropbox/core/DbxStreamWriter$ByteArrayCopier;

    invoke-direct {v6, p4, p5, p6}, Lcom/dropbox/core/DbxStreamWriter$ByteArrayCopier;-><init>([BII)V

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    invoke-virtual/range {v0 .. v6}, Lcom/dropbox/core/v1/DbxClientV1;->chunkedUploadAppend(Ljava/lang/String;JJLcom/dropbox/core/DbxStreamWriter;)J

    move-result-wide p1

    return-wide p1
.end method

.method public chunkedUploadFinish(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;Ljava/lang/String;)Lcom/dropbox/core/v1/DbxEntry$File;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1208
    const-string v0, "targetPath"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArgNonRoot(Ljava/lang/String;Ljava/lang/String;)V

    .line 1210
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "1/commit_chunked_upload/auto"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1212
    const-string p1, "upload_id"

    filled-new-array {p1, p3}, [Ljava/lang/String;

    move-result-object p1

    .line 1215
    iget-object p2, p2, Lcom/dropbox/core/v1/DbxWriteMode;->params:[Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/dropbox/core/util/LangUtil;->arrayConcat([Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    move-object v5, p1

    check-cast v5, [Ljava/lang/String;

    .line 1217
    iget-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v3

    new-instance v7, Lcom/dropbox/core/v1/DbxClientV1$7;

    invoke-direct {v7, p0}, Lcom/dropbox/core/v1/DbxClientV1$7;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const/4 v6, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/dropbox/core/v1/DbxClientV1;->doPost(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v1/DbxEntry$File;

    return-object p1
.end method

.method public chunkedUploadFirst(ILcom/dropbox/core/DbxStreamWriter;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Throwable;",
            ">(I",
            "Lcom/dropbox/core/DbxStreamWriter<",
            "TE;>;)",
            "Ljava/lang/String;",
            "^",
            "Lcom/dropbox/core/DbxException;",
            "^TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Ljava/lang/Throwable;
        }
    .end annotation

    const-string v0, "Sent "

    const/4 v1, 0x0

    .line 1039
    new-array v1, v1, [Ljava/lang/String;

    int-to-long v2, p1

    invoke-direct {p0, v1, v2, v3, p2}, Lcom/dropbox/core/v1/DbxClientV1;->chunkedUploadCommon([Ljava/lang/String;JLcom/dropbox/core/DbxStreamWriter;)Lcom/dropbox/core/http/HttpRequestor$Response;

    move-result-object p2

    .line 1041
    :try_start_0
    invoke-direct {p0, p2}, Lcom/dropbox/core/v1/DbxClientV1;->chunkedUploadCheckForOffsetCorrection(Lcom/dropbox/core/http/HttpRequestor$Response;)Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;

    move-result-object v1

    if-nez v1, :cond_3

    .line 1047
    invoke-virtual {p2}, Lcom/dropbox/core/http/HttpRequestor$Response;->getStatusCode()I

    move-result v1

    const/16 v4, 0x194

    if-eq v1, v4, :cond_2

    .line 1052
    invoke-virtual {p2}, Lcom/dropbox/core/http/HttpRequestor$Response;->getStatusCode()I

    move-result v1

    const/16 v4, 0xc8

    if-ne v1, v4, :cond_1

    .line 1053
    invoke-direct {p0, p2}, Lcom/dropbox/core/v1/DbxClientV1;->chunkedUploadParse200(Lcom/dropbox/core/http/HttpRequestor$Response;)Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;

    move-result-object v1

    .line 1055
    iget-wide v4, v1, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;->offset:J

    cmp-long v6, v4, v2

    if-nez v6, :cond_0

    .line 1060
    iget-object p1, v1, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;->uploadId:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1063
    invoke-virtual {p2}, Lcom/dropbox/core/http/HttpRequestor$Response;->getBody()Ljava/io/InputStream;

    move-result-object p2

    invoke-static {p2}, Lcom/dropbox/core/util/IOUtil;->closeInput(Ljava/io/InputStream;)V

    return-object p1

    .line 1056
    :cond_0
    :try_start_1
    invoke-static {p2}, Lcom/dropbox/core/DbxRequestUtil;->getRequestId(Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/String;

    move-result-object v2

    .line 1057
    new-instance v3, Lcom/dropbox/core/BadResponseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " bytes, but returned offset is "

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v0, v1, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadState;->offset:J

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v3, v2, p1}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v3

    .line 1052
    :cond_1
    invoke-static {p2}, Lcom/dropbox/core/DbxRequestUtil;->unexpectedStatus(Lcom/dropbox/core/http/HttpRequestor$Response;)Lcom/dropbox/core/DbxException;

    move-result-object p1

    throw p1

    .line 1048
    :cond_2
    invoke-static {p2}, Lcom/dropbox/core/DbxRequestUtil;->getRequestId(Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/String;

    move-result-object p1

    .line 1049
    new-instance v0, Lcom/dropbox/core/BadResponseException;

    const-string v1, "Got a 404, but we didn\'t send an upload_id"

    invoke-direct {v0, p1, v1}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 1043
    :cond_3
    invoke-static {p2}, Lcom/dropbox/core/DbxRequestUtil;->getRequestId(Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/String;

    move-result-object p1

    .line 1044
    new-instance v0, Lcom/dropbox/core/BadResponseException;

    const-string v1, "Got offset correction response on first chunk."

    invoke-direct {v0, p1, v1}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 1063
    invoke-virtual {p2}, Lcom/dropbox/core/http/HttpRequestor$Response;->getBody()Ljava/io/InputStream;

    move-result-object p2

    invoke-static {p2}, Lcom/dropbox/core/util/IOUtil;->closeInput(Ljava/io/InputStream;)V

    .line 1064
    throw p1
.end method

.method public chunkedUploadFirst([B)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1001
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/dropbox/core/v1/DbxClientV1;->chunkedUploadFirst([BII)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public chunkedUploadFirst([BII)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1020
    new-instance v0, Lcom/dropbox/core/DbxStreamWriter$ByteArrayCopier;

    invoke-direct {v0, p1, p2, p3}, Lcom/dropbox/core/DbxStreamWriter$ByteArrayCopier;-><init>([BII)V

    invoke-virtual {p0, p3, v0}, Lcom/dropbox/core/v1/DbxClientV1;->chunkedUploadFirst(ILcom/dropbox/core/DbxStreamWriter;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public copy(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v1/DbxEntry;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2070
    const-string v0, "fromPath"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArg(Ljava/lang/String;Ljava/lang/String;)V

    .line 2071
    const-string v0, "toPath"

    invoke-static {v0, p2}, Lcom/dropbox/core/v1/DbxPathV1;->checkArgNonRoot(Ljava/lang/String;Ljava/lang/String;)V

    .line 2073
    const-string v3, "from_path"

    const-string v5, "to_path"

    const-string v1, "root"

    const-string v2, "auto"

    move-object v4, p1

    move-object v6, p2

    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    move-result-object v9

    .line 2079
    iget-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v7

    new-instance v11, Lcom/dropbox/core/v1/DbxClientV1$19;

    invoke-direct {v11, p0}, Lcom/dropbox/core/v1/DbxClientV1$19;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const-string v8, "1/fileops/copy"

    const/4 v10, 0x0

    move-object v6, p0

    invoke-virtual/range {v6 .. v11}, Lcom/dropbox/core/v1/DbxClientV1;->doPost(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v1/DbxEntry;

    return-object p1
.end method

.method public copyFromCopyRef(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v1/DbxEntry;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 2101
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 2102
    const-string v0, "toPath"

    invoke-static {v0, p2}, Lcom/dropbox/core/v1/DbxPathV1;->checkArgNonRoot(Ljava/lang/String;Ljava/lang/String;)V

    .line 2104
    const-string v3, "from_copy_ref"

    const-string v5, "to_path"

    const-string v1, "root"

    const-string v2, "auto"

    move-object v4, p1

    move-object v6, p2

    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    move-result-object v9

    .line 2110
    iget-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v7

    new-instance v11, Lcom/dropbox/core/v1/DbxClientV1$20;

    invoke-direct {v11, p0}, Lcom/dropbox/core/v1/DbxClientV1$20;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const-string v8, "1/fileops/copy"

    const/4 v10, 0x0

    move-object v6, p0

    invoke-virtual/range {v6 .. v11}, Lcom/dropbox/core/v1/DbxClientV1;->doPost(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v1/DbxEntry;

    return-object p1

    .line 2101
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'copyRef\' can\'t be empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2100
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'copyRef\' can\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public createCopyRef(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1991
    const-string v0, "path"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArgNonRoot(Ljava/lang/String;Ljava/lang/String;)V

    .line 1993
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "1/copy_ref/auto"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1995
    iget-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v3

    new-instance v7, Lcom/dropbox/core/v1/DbxClientV1$18;

    invoke-direct {v7, p0}, Lcom/dropbox/core/v1/DbxClientV1$18;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/dropbox/core/v1/DbxClientV1;->doPost(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public createFolder(Ljava/lang/String;)Lcom/dropbox/core/v1/DbxEntry$Folder;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2134
    const-string v0, "path"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArgNonRoot(Ljava/lang/String;Ljava/lang/String;)V

    .line 2136
    const-string v1, "root"

    const-string v2, "auto"

    filled-new-array {v1, v2, v0, p1}, [Ljava/lang/String;

    move-result-object v6

    .line 2141
    iget-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v4

    new-instance v8, Lcom/dropbox/core/v1/DbxClientV1$21;

    invoke-direct {v8, p0}, Lcom/dropbox/core/v1/DbxClientV1$21;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const-string v5, "1/fileops/create_folder"

    const/4 v7, 0x0

    move-object v3, p0

    invoke-virtual/range {v3 .. v8}, Lcom/dropbox/core/v1/DbxClientV1;->doPost(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v1/DbxEntry$Folder;

    return-object p1
.end method

.method public createShareableUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1919
    const-string v0, "path"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArg(Ljava/lang/String;Ljava/lang/String;)V

    .line 1921
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "1/shares/auto"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1922
    const-string p1, "short_url"

    const-string v0, "false"

    filled-new-array {p1, v0}, [Ljava/lang/String;

    move-result-object v5

    .line 1924
    iget-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v3

    new-instance v7, Lcom/dropbox/core/v1/DbxClientV1$16;

    invoke-direct {v7, p0}, Lcom/dropbox/core/v1/DbxClientV1$16;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const/4 v6, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/dropbox/core/v1/DbxClientV1;->doPost(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public createTemporaryDirectUrl(Ljava/lang/String;)Lcom/dropbox/core/v1/DbxUrlWithExpiration;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1951
    const-string v0, "path"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArgNonRoot(Ljava/lang/String;Ljava/lang/String;)V

    .line 1953
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "1/media/auto"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1955
    iget-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v3

    new-instance v7, Lcom/dropbox/core/v1/DbxClientV1$17;

    invoke-direct {v7, p0}, Lcom/dropbox/core/v1/DbxClientV1$17;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/dropbox/core/v1/DbxClientV1;->doPost(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v1/DbxUrlWithExpiration;

    return-object p1
.end method

.method public delete(Ljava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2159
    const-string v0, "path"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArgNonRoot(Ljava/lang/String;Ljava/lang/String;)V

    .line 2161
    const-string v1, "root"

    const-string v2, "auto"

    filled-new-array {v1, v2, v0, p1}, [Ljava/lang/String;

    move-result-object v6

    .line 2166
    iget-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v4

    new-instance v8, Lcom/dropbox/core/v1/DbxClientV1$22;

    invoke-direct {v8, p0}, Lcom/dropbox/core/v1/DbxClientV1$22;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const-string v5, "1/fileops/delete"

    const/4 v7, 0x0

    move-object v3, p0

    invoke-virtual/range {v3 .. v8}, Lcom/dropbox/core/v1/DbxClientV1;->doPost(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    return-void
.end method

.method public disableAccessToken()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 377
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v2

    .line 380
    new-instance v6, Lcom/dropbox/core/v1/DbxClientV1$5;

    invoke-direct {v6, p0}, Lcom/dropbox/core/v1/DbxClientV1$5;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const-string v3, "1/disable_access_token"

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lcom/dropbox/core/v1/DbxClientV1;->doPost(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    return-void
.end method

.method public doPost(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;",
            "Lcom/dropbox/core/DbxRequestUtil$ResponseHandler<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2229
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    iget-object v1, p0, Lcom/dropbox/core/v1/DbxClientV1;->accessToken:Ljava/lang/String;

    const-string v2, "Dropbox-Java-SDK"

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-static/range {v0 .. v7}, Lcom/dropbox/core/DbxRequestUtil;->doPost(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public finishUploadFile(Lcom/dropbox/core/v1/DbxClientV1$Uploader;Lcom/dropbox/core/DbxStreamWriter;)Lcom/dropbox/core/v1/DbxEntry$File;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Throwable;",
            ">(",
            "Lcom/dropbox/core/v1/DbxClientV1$Uploader;",
            "Lcom/dropbox/core/DbxStreamWriter<",
            "TE;>;)",
            "Lcom/dropbox/core/v1/DbxEntry$File;",
            "^",
            "Lcom/dropbox/core/DbxException;",
            "^TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 715
    new-instance v0, Lcom/dropbox/core/NoThrowOutputStream;

    invoke-virtual {p1}, Lcom/dropbox/core/v1/DbxClientV1$Uploader;->getBody()Ljava/io/OutputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/dropbox/core/NoThrowOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 717
    :try_start_0
    invoke-virtual {p2, v0}, Lcom/dropbox/core/DbxStreamWriter;->write(Lcom/dropbox/core/NoThrowOutputStream;)V

    .line 718
    invoke-virtual {p1}, Lcom/dropbox/core/v1/DbxClientV1$Uploader;->finish()Lcom/dropbox/core/v1/DbxEntry$File;

    move-result-object p2
    :try_end_0
    .catch Lcom/dropbox/core/NoThrowOutputStream$HiddenException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 725
    invoke-virtual {p1}, Lcom/dropbox/core/v1/DbxClientV1$Uploader;->close()V

    return-object p2

    :catchall_0
    move-exception p2

    goto :goto_0

    :catch_0
    move-exception p2

    .line 721
    :try_start_1
    iget-object v1, p2, Lcom/dropbox/core/NoThrowOutputStream$HiddenException;->owner:Lcom/dropbox/core/NoThrowOutputStream;

    if-ne v1, v0, :cond_0

    new-instance v0, Lcom/dropbox/core/NetworkIOException;

    invoke-virtual {p2}, Lcom/dropbox/core/NoThrowOutputStream$HiddenException;->getCause()Ljava/io/IOException;

    move-result-object p2

    invoke-direct {v0, p2}, Lcom/dropbox/core/NetworkIOException;-><init>(Ljava/io/IOException;)V

    throw v0

    .line 722
    :cond_0
    throw p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 725
    :goto_0
    invoke-virtual {p1}, Lcom/dropbox/core/v1/DbxClientV1$Uploader;->close()V

    .line 726
    throw p2
.end method

.method public getAccessToken()Ljava/lang/String;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1;->accessToken:Ljava/lang/String;

    return-object v0
.end method

.method public getAccountInfo()Lcom/dropbox/core/v1/DbxAccountInfo;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 352
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v2

    .line 355
    new-instance v6, Lcom/dropbox/core/v1/DbxClientV1$4;

    invoke-direct {v6, p0}, Lcom/dropbox/core/v1/DbxClientV1$4;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const-string v3, "1/account/info"

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/dropbox/core/v1/DbxClientV1;->doGet(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v1/DbxAccountInfo;

    return-object v0
.end method

.method public getDelta(Ljava/lang/String;)Lcom/dropbox/core/v1/DbxDelta;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/v1/DbxDelta<",
            "Lcom/dropbox/core/v1/DbxEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1491
    invoke-virtual {p0, p1, v0}, Lcom/dropbox/core/v1/DbxClientV1;->getDelta(Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxDelta;

    move-result-object p1

    return-object p1
.end method

.method public getDelta(Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxDelta;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/dropbox/core/v1/DbxDelta<",
            "Lcom/dropbox/core/v1/DbxEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1482
    invoke-direct {p0, p1, v0, p2}, Lcom/dropbox/core/v1/DbxClientV1;->_getDelta(Ljava/lang/String;Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxDelta;

    move-result-object p1

    return-object p1
.end method

.method public getDeltaC(Lcom/dropbox/core/util/Collector;Ljava/lang/String;)Lcom/dropbox/core/v1/DbxDeltaC;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/dropbox/core/util/Collector<",
            "Lcom/dropbox/core/v1/DbxDeltaC$Entry<",
            "Lcom/dropbox/core/v1/DbxEntry;",
            ">;TC;>;",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/v1/DbxDeltaC<",
            "TC;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1511
    invoke-virtual {p0, p1, p2, v0}, Lcom/dropbox/core/v1/DbxClientV1;->getDeltaC(Lcom/dropbox/core/util/Collector;Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxDeltaC;

    move-result-object p1

    return-object p1
.end method

.method public getDeltaC(Lcom/dropbox/core/util/Collector;Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxDeltaC;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/dropbox/core/util/Collector<",
            "Lcom/dropbox/core/v1/DbxDeltaC$Entry<",
            "Lcom/dropbox/core/v1/DbxEntry;",
            ">;TC;>;",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/dropbox/core/v1/DbxDeltaC<",
            "TC;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1502
    invoke-direct {p0, p1, p2, v0, p3}, Lcom/dropbox/core/v1/DbxClientV1;->_getDeltaC(Lcom/dropbox/core/util/Collector;Ljava/lang/String;Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxDeltaC;

    move-result-object p1

    return-object p1
.end method

.method public getDeltaCWithPathPrefix(Lcom/dropbox/core/util/Collector;Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v1/DbxDeltaC;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/dropbox/core/util/Collector<",
            "Lcom/dropbox/core/v1/DbxDeltaC$Entry<",
            "Lcom/dropbox/core/v1/DbxEntry;",
            ">;TC;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/v1/DbxDeltaC<",
            "TC;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1567
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/dropbox/core/v1/DbxClientV1;->getDeltaCWithPathPrefix(Lcom/dropbox/core/util/Collector;Ljava/lang/String;Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxDeltaC;

    move-result-object p1

    return-object p1
.end method

.method public getDeltaCWithPathPrefix(Lcom/dropbox/core/util/Collector;Ljava/lang/String;Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxDeltaC;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/dropbox/core/util/Collector<",
            "Lcom/dropbox/core/v1/DbxDeltaC$Entry<",
            "Lcom/dropbox/core/v1/DbxEntry;",
            ">;TC;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/dropbox/core/v1/DbxDeltaC<",
            "TC;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1555
    const-string v0, "path"

    invoke-static {v0, p3}, Lcom/dropbox/core/v1/DbxPathV1;->checkArg(Ljava/lang/String;Ljava/lang/String;)V

    .line 1556
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/dropbox/core/v1/DbxClientV1;->_getDeltaC(Lcom/dropbox/core/util/Collector;Ljava/lang/String;Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxDeltaC;

    move-result-object p1

    return-object p1
.end method

.method public getDeltaLatestCursor()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1629
    invoke-direct {p0, v0, v1}, Lcom/dropbox/core/v1/DbxClientV1;->_getDeltaLatestCursor(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDeltaLatestCursor(Z)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1620
    invoke-direct {p0, v0, p1}, Lcom/dropbox/core/v1/DbxClientV1;->_getDeltaLatestCursor(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getDeltaLatestCursorWithPathPrefix(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1651
    invoke-virtual {p0, p1, v0}, Lcom/dropbox/core/v1/DbxClientV1;->getDeltaLatestCursorWithPathPrefix(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getDeltaLatestCursorWithPathPrefix(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1641
    const-string v0, "path"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArg(Ljava/lang/String;Ljava/lang/String;)V

    .line 1642
    invoke-direct {p0, p1, p2}, Lcom/dropbox/core/v1/DbxClientV1;->_getDeltaLatestCursor(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getDeltaWithPathPrefix(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v1/DbxDelta;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/v1/DbxDelta<",
            "Lcom/dropbox/core/v1/DbxEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1542
    const-string v0, "path"

    invoke-static {v0, p2}, Lcom/dropbox/core/v1/DbxPathV1;->checkArg(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1543
    invoke-direct {p0, p1, p2, v0}, Lcom/dropbox/core/v1/DbxClientV1;->_getDelta(Ljava/lang/String;Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxDelta;

    move-result-object p1

    return-object p1
.end method

.method public getDeltaWithPathPrefix(Ljava/lang/String;Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxDelta;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/dropbox/core/v1/DbxDelta<",
            "Lcom/dropbox/core/v1/DbxEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1531
    const-string v0, "path"

    invoke-static {v0, p2}, Lcom/dropbox/core/v1/DbxPathV1;->checkArg(Ljava/lang/String;Ljava/lang/String;)V

    .line 1532
    invoke-direct {p0, p1, p2, p3}, Lcom/dropbox/core/v1/DbxClientV1;->_getDelta(Ljava/lang/String;Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxDelta;

    move-result-object p1

    return-object p1
.end method

.method public getFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/OutputStream;)Lcom/dropbox/core/v1/DbxEntry$File;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 425
    invoke-virtual {p0, p1, p2}, Lcom/dropbox/core/v1/DbxClientV1;->startGetFile(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v1/DbxClientV1$Downloader;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 427
    :cond_0
    invoke-virtual {p1, p3}, Lcom/dropbox/core/v1/DbxClientV1$Downloader;->copyBodyAndClose(Ljava/io/OutputStream;)Lcom/dropbox/core/v1/DbxEntry$File;

    move-result-object p1

    return-object p1
.end method

.method public getHost()Lcom/dropbox/core/DbxHost;
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    return-object v0
.end method

.method public getLongpollDelta(Ljava/lang/String;I)Lcom/dropbox/core/v1/DbxLongpollDeltaResult;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    if-eqz p1, :cond_1

    const/16 v0, 0x1e

    if-lt p2, v0, :cond_0

    const/16 v0, 0x1e0

    if-gt p2, v0, :cond_0

    .line 1717
    const-string v0, "timeout"

    .line 1719
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    const-string v1, "cursor"

    filled-new-array {v1, p1, v0, p2}, [Ljava/lang/String;

    move-result-object v7

    .line 1723
    invoke-virtual {p0}, Lcom/dropbox/core/v1/DbxClientV1;->getRequestConfig()Lcom/dropbox/core/DbxRequestConfig;

    move-result-object v2

    .line 1724
    invoke-virtual {p0}, Lcom/dropbox/core/v1/DbxClientV1;->getAccessToken()Ljava/lang/String;

    move-result-object v3

    iget-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    .line 1726
    invoke-virtual {p1}, Lcom/dropbox/core/DbxHost;->getNotify()Ljava/lang/String;

    move-result-object v5

    new-instance v9, Lcom/dropbox/core/v1/DbxClientV1$12;

    invoke-direct {v9, p0}, Lcom/dropbox/core/v1/DbxClientV1$12;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    .line 1722
    const-string v4, "Dropbox-Java-SDK"

    const-string v6, "1/longpoll_delta"

    const/4 v8, 0x0

    invoke-static/range {v2 .. v9}, Lcom/dropbox/core/DbxRequestUtil;->doGet(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v1/DbxLongpollDeltaResult;

    return-object p1

    .line 1716
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'timeout\' must be >=30 and <= 480"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1715
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'cursor\' can\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getMetadata(Ljava/lang/String;)Lcom/dropbox/core/v1/DbxEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 146
    invoke-virtual {p0, p1, v0}, Lcom/dropbox/core/v1/DbxClientV1;->getMetadata(Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxEntry;

    move-result-object p1

    return-object p1
.end method

.method public getMetadata(Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxEntry;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 118
    const-string v0, "path"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArg(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v2

    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "1/metadata/auto"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    if-eqz p2, :cond_0

    .line 124
    const-string p1, "true"

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const-string p2, "list"

    const-string v0, "false"

    const-string v1, "include_media_info"

    filled-new-array {p2, v0, v1, p1}, [Ljava/lang/String;

    move-result-object v4

    .line 127
    new-instance v6, Lcom/dropbox/core/v1/DbxClientV1$1;

    invoke-direct {v6, p0}, Lcom/dropbox/core/v1/DbxClientV1$1;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/dropbox/core/v1/DbxClientV1;->doGet(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v1/DbxEntry;

    return-object p1
.end method

.method public getMetadataWithChildren(Ljava/lang/String;)Lcom/dropbox/core/v1/DbxEntry$WithChildren;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 187
    invoke-virtual {p0, p1, v0}, Lcom/dropbox/core/v1/DbxClientV1;->getMetadataWithChildren(Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxEntry$WithChildren;

    move-result-object p1

    return-object p1
.end method

.method public getMetadataWithChildren(Ljava/lang/String;Z)Lcom/dropbox/core/v1/DbxEntry$WithChildren;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 177
    sget-object v0, Lcom/dropbox/core/v1/DbxEntry$WithChildren;->ReaderMaybeDeleted:Lcom/dropbox/core/json/JsonReader;

    invoke-direct {p0, p1, p2, v0}, Lcom/dropbox/core/v1/DbxClientV1;->getMetadataWithChildrenBase(Ljava/lang/String;ZLcom/dropbox/core/json/JsonReader;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v1/DbxEntry$WithChildren;

    return-object p1
.end method

.method public getMetadataWithChildrenC(Ljava/lang/String;Lcom/dropbox/core/util/Collector;)Lcom/dropbox/core/v1/DbxEntry$WithChildrenC;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/util/Collector<",
            "Lcom/dropbox/core/v1/DbxEntry;",
            "+TC;>;)",
            "Lcom/dropbox/core/v1/DbxEntry$WithChildrenC<",
            "TC;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 217
    invoke-virtual {p0, p1, v0, p2}, Lcom/dropbox/core/v1/DbxClientV1;->getMetadataWithChildrenC(Ljava/lang/String;ZLcom/dropbox/core/util/Collector;)Lcom/dropbox/core/v1/DbxEntry$WithChildrenC;

    move-result-object p1

    return-object p1
.end method

.method public getMetadataWithChildrenC(Ljava/lang/String;ZLcom/dropbox/core/util/Collector;)Lcom/dropbox/core/v1/DbxEntry$WithChildrenC;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Z",
            "Lcom/dropbox/core/util/Collector<",
            "Lcom/dropbox/core/v1/DbxEntry;",
            "+TC;>;)",
            "Lcom/dropbox/core/v1/DbxEntry$WithChildrenC<",
            "TC;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 207
    new-instance v0, Lcom/dropbox/core/v1/DbxEntry$WithChildrenC$ReaderMaybeDeleted;

    invoke-direct {v0, p3}, Lcom/dropbox/core/v1/DbxEntry$WithChildrenC$ReaderMaybeDeleted;-><init>(Lcom/dropbox/core/util/Collector;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/dropbox/core/v1/DbxClientV1;->getMetadataWithChildrenBase(Ljava/lang/String;ZLcom/dropbox/core/json/JsonReader;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v1/DbxEntry$WithChildrenC;

    return-object p1
.end method

.method public getMetadataWithChildrenIfChanged(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/util/Maybe;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/util/Maybe<",
            "Lcom/dropbox/core/v1/DbxEntry$WithChildren;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 277
    invoke-virtual {p0, p1, v0, p2}, Lcom/dropbox/core/v1/DbxClientV1;->getMetadataWithChildrenIfChanged(Ljava/lang/String;ZLjava/lang/String;)Lcom/dropbox/core/util/Maybe;

    move-result-object p1

    return-object p1
.end method

.method public getMetadataWithChildrenIfChanged(Ljava/lang/String;ZLjava/lang/String;)Lcom/dropbox/core/util/Maybe;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/util/Maybe<",
            "Lcom/dropbox/core/v1/DbxEntry$WithChildren;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 267
    sget-object v0, Lcom/dropbox/core/v1/DbxEntry$WithChildren;->ReaderMaybeDeleted:Lcom/dropbox/core/json/JsonReader;

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/dropbox/core/v1/DbxClientV1;->getMetadataWithChildrenIfChangedBase(Ljava/lang/String;ZLjava/lang/String;Lcom/dropbox/core/json/JsonReader;)Lcom/dropbox/core/util/Maybe;

    move-result-object p1

    return-object p1
.end method

.method public getMetadataWithChildrenIfChangedC(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/util/Collector;)Lcom/dropbox/core/util/Maybe;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/util/Collector<",
            "Lcom/dropbox/core/v1/DbxEntry;",
            "+TC;>;)",
            "Lcom/dropbox/core/util/Maybe<",
            "Lcom/dropbox/core/v1/DbxEntry$WithChildrenC<",
            "TC;>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 309
    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/dropbox/core/v1/DbxClientV1;->getMetadataWithChildrenIfChangedC(Ljava/lang/String;ZLjava/lang/String;Lcom/dropbox/core/util/Collector;)Lcom/dropbox/core/util/Maybe;

    move-result-object p1

    return-object p1
.end method

.method public getMetadataWithChildrenIfChangedC(Ljava/lang/String;ZLjava/lang/String;Lcom/dropbox/core/util/Collector;)Lcom/dropbox/core/util/Maybe;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/util/Collector<",
            "Lcom/dropbox/core/v1/DbxEntry;",
            "+TC;>;)",
            "Lcom/dropbox/core/util/Maybe<",
            "Lcom/dropbox/core/v1/DbxEntry$WithChildrenC<",
            "TC;>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 298
    new-instance v0, Lcom/dropbox/core/v1/DbxEntry$WithChildrenC$ReaderMaybeDeleted;

    invoke-direct {v0, p4}, Lcom/dropbox/core/v1/DbxEntry$WithChildrenC$ReaderMaybeDeleted;-><init>(Lcom/dropbox/core/util/Collector;)V

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/dropbox/core/v1/DbxClientV1;->getMetadataWithChildrenIfChangedBase(Ljava/lang/String;ZLjava/lang/String;Lcom/dropbox/core/json/JsonReader;)Lcom/dropbox/core/util/Maybe;

    move-result-object p1

    return-object p1
.end method

.method public getRequestConfig()Lcom/dropbox/core/DbxRequestConfig;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    return-object v0
.end method

.method public getRevisions(Ljava/lang/String;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v1/DbxEntry$File;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1817
    const-string v0, "path"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArgNonRoot(Ljava/lang/String;Ljava/lang/String;)V

    .line 1819
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "1/revisions/auto"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1821
    iget-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v3

    new-instance v7, Lcom/dropbox/core/v1/DbxClientV1$13;

    invoke-direct {v7, p0}, Lcom/dropbox/core/v1/DbxClientV1$13;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/dropbox/core/v1/DbxClientV1;->doGet(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    return-object p1
.end method

.method public getThumbnail(Lcom/dropbox/core/v1/DbxThumbnailSize;Lcom/dropbox/core/v1/DbxThumbnailFormat;Ljava/lang/String;Ljava/lang/String;Ljava/io/OutputStream;)Lcom/dropbox/core/v1/DbxEntry$File;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p5, :cond_1

    .line 1775
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/dropbox/core/v1/DbxClientV1;->startGetThumbnail(Lcom/dropbox/core/v1/DbxThumbnailSize;Lcom/dropbox/core/v1/DbxThumbnailFormat;Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v1/DbxClientV1$Downloader;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 1777
    :cond_0
    invoke-virtual {p1, p5}, Lcom/dropbox/core/v1/DbxClientV1$Downloader;->copyBodyAndClose(Ljava/io/OutputStream;)Lcom/dropbox/core/v1/DbxEntry$File;

    move-result-object p1

    return-object p1

    .line 1773
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'target\' can\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public move(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v1/DbxEntry;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 2187
    const-string v0, "fromPath"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArgNonRoot(Ljava/lang/String;Ljava/lang/String;)V

    .line 2188
    const-string v0, "toPath"

    invoke-static {v0, p2}, Lcom/dropbox/core/v1/DbxPathV1;->checkArgNonRoot(Ljava/lang/String;Ljava/lang/String;)V

    .line 2190
    const-string v3, "from_path"

    const-string v5, "to_path"

    const-string v1, "root"

    const-string v2, "auto"

    move-object v4, p1

    move-object v6, p2

    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    move-result-object v9

    .line 2196
    iget-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v7

    new-instance v11, Lcom/dropbox/core/v1/DbxClientV1$23;

    invoke-direct {v11, p0}, Lcom/dropbox/core/v1/DbxClientV1$23;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const-string v8, "1/fileops/move"

    const/4 v10, 0x0

    move-object v6, p0

    invoke-virtual/range {v6 .. v11}, Lcom/dropbox/core/v1/DbxClientV1;->doPost(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v1/DbxEntry;

    return-object p1
.end method

.method public restoreFile(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v1/DbxEntry$File;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1851
    const-string v0, "path"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArgNonRoot(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_1

    .line 1853
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 1855
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "1/restore/auto"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1856
    const-string p1, "rev"

    filled-new-array {p1, p2}, [Ljava/lang/String;

    move-result-object v5

    .line 1860
    iget-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v3

    new-instance v7, Lcom/dropbox/core/v1/DbxClientV1$14;

    invoke-direct {v7, p0}, Lcom/dropbox/core/v1/DbxClientV1$14;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const/4 v6, 0x0

    move-object v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/dropbox/core/v1/DbxClientV1;->doGet(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v1/DbxEntry$File;

    return-object p1

    .line 1853
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'rev\' can\'t be empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1852
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'rev\' can\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public searchFileAndFolderNames(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v1/DbxEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1885
    const-string v0, "basePath"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArg(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_1

    .line 1887
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 1889
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "1/search/auto"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1890
    const-string p1, "query"

    filled-new-array {p1, p2}, [Ljava/lang/String;

    move-result-object v5

    .line 1892
    iget-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v3

    new-instance v7, Lcom/dropbox/core/v1/DbxClientV1$15;

    invoke-direct {v7, p0}, Lcom/dropbox/core/v1/DbxClientV1$15;-><init>(Lcom/dropbox/core/v1/DbxClientV1;)V

    const/4 v6, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/dropbox/core/v1/DbxClientV1;->doPost(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/ArrayList;Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    return-object p1

    .line 1887
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'query\' can\'t be empty"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1886
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'query\' can\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public startGetFile(Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v1/DbxClientV1$Downloader;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 460
    const-string v0, "path"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArgNonRoot(Ljava/lang/String;Ljava/lang/String;)V

    .line 461
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "1/files/auto"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 462
    const-string v0, "rev"

    filled-new-array {v0, p2}, [Ljava/lang/String;

    move-result-object p2

    .line 465
    invoke-direct {p0, p1, p2}, Lcom/dropbox/core/v1/DbxClientV1;->startGetSomething(Ljava/lang/String;[Ljava/lang/String;)Lcom/dropbox/core/v1/DbxClientV1$Downloader;

    move-result-object p1

    return-object p1
.end method

.method public startGetThumbnail(Lcom/dropbox/core/v1/DbxThumbnailSize;Lcom/dropbox/core/v1/DbxThumbnailFormat;Ljava/lang/String;Ljava/lang/String;)Lcom/dropbox/core/v1/DbxClientV1$Downloader;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1788
    const-string v0, "path"

    invoke-static {v0, p3}, Lcom/dropbox/core/v1/DbxPathV1;->checkArgNonRoot(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    .line 1792
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "1/thumbnails/auto"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 1793
    iget-object v1, p1, Lcom/dropbox/core/v1/DbxThumbnailSize;->ident:Ljava/lang/String;

    iget-object v3, p2, Lcom/dropbox/core/v1/DbxThumbnailFormat;->ident:Ljava/lang/String;

    const-string v4, "rev"

    const-string v0, "size"

    const-string v2, "format"

    move-object v5, p4

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object p1

    .line 1799
    invoke-direct {p0, p3, p1}, Lcom/dropbox/core/v1/DbxClientV1;->startGetSomething(Ljava/lang/String;[Ljava/lang/String;)Lcom/dropbox/core/v1/DbxClientV1$Downloader;

    move-result-object p1

    return-object p1

    .line 1790
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'format\' can\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1789
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'size\' can\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public startUploadFile(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;J)Lcom/dropbox/core/v1/DbxClientV1$Uploader;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v2, p3, v0

    if-gez v2, :cond_1

    const-wide/16 v0, -0x1

    cmp-long v2, p3, v0

    if-nez v2, :cond_0

    .line 700
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/dropbox/core/v1/DbxClientV1;->startUploadFileChunked(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;J)Lcom/dropbox/core/v1/DbxClientV1$Uploader;

    move-result-object p1

    return-object p1

    .line 697
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "numBytes must be -1 or greater; given "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    const-wide/32 v0, 0x800000

    cmp-long v2, p3, v0

    if-lez v2, :cond_2

    .line 704
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/dropbox/core/v1/DbxClientV1;->startUploadFileChunked(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;J)Lcom/dropbox/core/v1/DbxClientV1$Uploader;

    move-result-object p1

    return-object p1

    .line 708
    :cond_2
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/dropbox/core/v1/DbxClientV1;->startUploadFileSingle(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;J)Lcom/dropbox/core/v1/DbxClientV1$Uploader;

    move-result-object p1

    return-object p1
.end method

.method public startUploadFileChunked(ILjava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;J)Lcom/dropbox/core/v1/DbxClientV1$Uploader;
    .locals 9

    .line 1240
    const-string v0, "targetPath"

    invoke-static {v0, p2}, Lcom/dropbox/core/v1/DbxPathV1;->checkArg(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p3, :cond_0

    .line 1243
    new-instance v1, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;

    new-instance v7, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;

    const/4 v0, 0x0

    invoke-direct {v7, p0, p1, v0}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;-><init>(Lcom/dropbox/core/v1/DbxClientV1;ILcom/dropbox/core/v1/DbxClientV1$1;)V

    const/4 v8, 0x0

    move-object v2, p0

    move-object v3, p2

    move-object v4, p3

    move-wide v5, p4

    invoke-direct/range {v1 .. v8}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploader;-><init>(Lcom/dropbox/core/v1/DbxClientV1;Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;JLcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;Lcom/dropbox/core/v1/DbxClientV1$1;)V

    return-object v1

    .line 1241
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'writeMode\' can\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public startUploadFileChunked(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;J)Lcom/dropbox/core/v1/DbxClientV1$Uploader;
    .locals 6

    const/high16 v1, 0x400000

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    .line 1232
    invoke-virtual/range {v0 .. v5}, Lcom/dropbox/core/v1/DbxClientV1;->startUploadFileChunked(ILjava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;J)Lcom/dropbox/core/v1/DbxClientV1$Uploader;

    move-result-object p1

    return-object p1
.end method

.method public startUploadFileSingle(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;J)Lcom/dropbox/core/v1/DbxClientV1$Uploader;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 739
    const-string v0, "targetPath"

    invoke-static {v0, p1}, Lcom/dropbox/core/v1/DbxPathV1;->checkArg(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    cmp-long v2, p3, v0

    if-ltz v2, :cond_0

    .line 742
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual {v0}, Lcom/dropbox/core/DbxHost;->getContent()Ljava/lang/String;

    move-result-object v4

    .line 743
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "1/files_put/auto"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 745
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 746
    new-instance p1, Lcom/dropbox/core/http/HttpRequestor$Header;

    const-string v0, "Content-Type"

    const-string v1, "application/octet-stream"

    invoke-direct {p1, v0, v1}, Lcom/dropbox/core/http/HttpRequestor$Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 747
    new-instance p1, Lcom/dropbox/core/http/HttpRequestor$Header;

    const-string v0, "Content-Length"

    invoke-static {p3, p4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Lcom/dropbox/core/http/HttpRequestor$Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 749
    iget-object v1, p0, Lcom/dropbox/core/v1/DbxClientV1;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    iget-object v2, p0, Lcom/dropbox/core/v1/DbxClientV1;->accessToken:Ljava/lang/String;

    const-string v3, "Dropbox-Java-SDK"

    iget-object v6, p2, Lcom/dropbox/core/v1/DbxWriteMode;->params:[Ljava/lang/String;

    invoke-static/range {v1 .. v7}, Lcom/dropbox/core/DbxRequestUtil;->startPut(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;)Lcom/dropbox/core/http/HttpRequestor$Uploader;

    move-result-object p1

    .line 751
    new-instance p2, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;

    invoke-direct {p2, p1, p3, p4}, Lcom/dropbox/core/v1/DbxClientV1$SingleUploader;-><init>(Lcom/dropbox/core/http/HttpRequestor$Uploader;J)V

    return-object p2

    .line 740
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "numBytes must be zero or greater"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public uploadFile(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;JLcom/dropbox/core/DbxStreamWriter;)Lcom/dropbox/core/v1/DbxEntry$File;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Throwable;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/v1/DbxWriteMode;",
            "J",
            "Lcom/dropbox/core/DbxStreamWriter<",
            "TE;>;)",
            "Lcom/dropbox/core/v1/DbxEntry$File;",
            "^",
            "Lcom/dropbox/core/DbxException;",
            "^TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 650
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/dropbox/core/v1/DbxClientV1;->startUploadFile(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;J)Lcom/dropbox/core/v1/DbxClientV1$Uploader;

    move-result-object p1

    .line 651
    invoke-virtual {p0, p1, p5}, Lcom/dropbox/core/v1/DbxClientV1;->finishUploadFile(Lcom/dropbox/core/v1/DbxClientV1$Uploader;Lcom/dropbox/core/DbxStreamWriter;)Lcom/dropbox/core/v1/DbxEntry$File;

    move-result-object p1

    return-object p1
.end method

.method public uploadFile(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;JLjava/io/InputStream;)Lcom/dropbox/core/v1/DbxEntry$File;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 603
    new-instance v5, Lcom/dropbox/core/DbxStreamWriter$InputStreamCopier;

    invoke-direct {v5, p5}, Lcom/dropbox/core/DbxStreamWriter$InputStreamCopier;-><init>(Ljava/io/InputStream;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/dropbox/core/v1/DbxClientV1;->uploadFile(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;JLcom/dropbox/core/DbxStreamWriter;)Lcom/dropbox/core/v1/DbxEntry$File;

    move-result-object p1

    return-object p1
.end method

.method public uploadFileChunked(ILjava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;JLcom/dropbox/core/DbxStreamWriter;)Lcom/dropbox/core/v1/DbxEntry$File;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Throwable;",
            ">(I",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/v1/DbxWriteMode;",
            "J",
            "Lcom/dropbox/core/DbxStreamWriter<",
            "TE;>;)",
            "Lcom/dropbox/core/v1/DbxEntry$File;",
            "^",
            "Lcom/dropbox/core/DbxException;",
            "^TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1262
    invoke-virtual/range {p0 .. p5}, Lcom/dropbox/core/v1/DbxClientV1;->startUploadFileChunked(ILjava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;J)Lcom/dropbox/core/v1/DbxClientV1$Uploader;

    move-result-object p1

    move-object p2, p0

    .line 1263
    invoke-virtual {p0, p1, p6}, Lcom/dropbox/core/v1/DbxClientV1;->finishUploadFile(Lcom/dropbox/core/v1/DbxClientV1$Uploader;Lcom/dropbox/core/DbxStreamWriter;)Lcom/dropbox/core/v1/DbxEntry$File;

    move-result-object p1

    return-object p1
.end method

.method public uploadFileChunked(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;JLcom/dropbox/core/DbxStreamWriter;)Lcom/dropbox/core/v1/DbxEntry$File;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Throwable;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/v1/DbxWriteMode;",
            "J",
            "Lcom/dropbox/core/DbxStreamWriter<",
            "TE;>;)",
            "Lcom/dropbox/core/v1/DbxEntry$File;",
            "^",
            "Lcom/dropbox/core/DbxException;",
            "^TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1252
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/dropbox/core/v1/DbxClientV1;->startUploadFileChunked(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;J)Lcom/dropbox/core/v1/DbxClientV1$Uploader;

    move-result-object p1

    .line 1253
    invoke-virtual {p0, p1, p5}, Lcom/dropbox/core/v1/DbxClientV1;->finishUploadFile(Lcom/dropbox/core/v1/DbxClientV1$Uploader;Lcom/dropbox/core/DbxStreamWriter;)Lcom/dropbox/core/v1/DbxEntry$File;

    move-result-object p1

    return-object p1
.end method

.method public uploadFileSingle(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;JLcom/dropbox/core/DbxStreamWriter;)Lcom/dropbox/core/v1/DbxEntry$File;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Throwable;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/v1/DbxWriteMode;",
            "J",
            "Lcom/dropbox/core/DbxStreamWriter<",
            "TE;>;)",
            "Lcom/dropbox/core/v1/DbxEntry$File;",
            "^",
            "Lcom/dropbox/core/DbxException;",
            "^TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 757
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/dropbox/core/v1/DbxClientV1;->startUploadFileSingle(Ljava/lang/String;Lcom/dropbox/core/v1/DbxWriteMode;J)Lcom/dropbox/core/v1/DbxClientV1$Uploader;

    move-result-object p1

    .line 758
    invoke-virtual {p0, p1, p5}, Lcom/dropbox/core/v1/DbxClientV1;->finishUploadFile(Lcom/dropbox/core/v1/DbxClientV1$Uploader;Lcom/dropbox/core/DbxStreamWriter;)Lcom/dropbox/core/v1/DbxEntry$File;

    move-result-object p1

    return-object p1
.end method
