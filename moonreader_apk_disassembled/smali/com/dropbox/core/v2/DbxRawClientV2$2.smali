.class Lcom/dropbox/core/v2/DbxRawClientV2$2;
.super Ljava/lang/Object;
.source "DbxRawClientV2.java"

# interfaces
.implements Lcom/dropbox/core/v2/DbxRawClientV2$RetriableExecution;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dropbox/core/v2/DbxRawClientV2;->downloadStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLjava/util/List;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Lcom/dropbox/core/DbxDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/dropbox/core/v2/DbxRawClientV2$RetriableExecution<",
        "Lcom/dropbox/core/DbxDownloader<",
        "TResT;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dropbox/core/v2/DbxRawClientV2;

.field private userIdAnon:Ljava/lang/String;

.field final synthetic val$body:[B

.field final synthetic val$errorSerializer:Lcom/dropbox/core/stone/StoneSerializer;

.field final synthetic val$headers:Ljava/util/List;

.field final synthetic val$host:Ljava/lang/String;

.field final synthetic val$noAuth:Z

.field final synthetic val$path:Ljava/lang/String;

.field final synthetic val$responseSerializer:Lcom/dropbox/core/stone/StoneSerializer;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/DbxRawClientV2;ZLjava/util/List;Ljava/lang/String;Ljava/lang/String;[BLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)V
    .locals 0

    .line 192
    iput-object p1, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->this$0:Lcom/dropbox/core/v2/DbxRawClientV2;

    iput-boolean p2, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->val$noAuth:Z

    iput-object p3, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->val$headers:Ljava/util/List;

    iput-object p4, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->val$host:Ljava/lang/String;

    iput-object p5, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->val$path:Ljava/lang/String;

    iput-object p6, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->val$body:[B

    iput-object p7, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->val$responseSerializer:Lcom/dropbox/core/stone/StoneSerializer;

    iput-object p8, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->val$errorSerializer:Lcom/dropbox/core/stone/StoneSerializer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/DbxRawClientV2$2;Ljava/lang/String;)Lcom/dropbox/core/v2/DbxRawClientV2$RetriableExecution;
    .locals 0

    .line 192
    invoke-direct {p0, p1}, Lcom/dropbox/core/v2/DbxRawClientV2$2;->init(Ljava/lang/String;)Lcom/dropbox/core/v2/DbxRawClientV2$RetriableExecution;

    move-result-object p0

    return-object p0
.end method

.method private init(Ljava/lang/String;)Lcom/dropbox/core/v2/DbxRawClientV2$RetriableExecution;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/v2/DbxRawClientV2$RetriableExecution<",
            "Lcom/dropbox/core/DbxDownloader<",
            "TResT;>;>;"
        }
    .end annotation

    .line 236
    iput-object p1, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->userIdAnon:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public execute()Lcom/dropbox/core/DbxDownloader;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/dropbox/core/DbxDownloader<",
            "TResT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxWrappedException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const-string v0, "Null Dropbox-API-Result header; "

    const-string v1, "No Dropbox-API-Result header; "

    const-string v2, "Missing Dropbox-API-Result header; "

    .line 197
    iget-boolean v3, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->val$noAuth:Z

    if-nez v3, :cond_0

    .line 198
    iget-object v3, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->this$0:Lcom/dropbox/core/v2/DbxRawClientV2;

    iget-object v4, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->val$headers:Ljava/util/List;

    invoke-virtual {v3, v4}, Lcom/dropbox/core/v2/DbxRawClientV2;->addAuthHeaders(Ljava/util/List;)V

    .line 200
    :cond_0
    iget-object v3, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->this$0:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-static {v3}, Lcom/dropbox/core/v2/DbxRawClientV2;->access$000(Lcom/dropbox/core/v2/DbxRawClientV2;)Lcom/dropbox/core/DbxRequestConfig;

    move-result-object v4

    iget-object v6, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->val$host:Ljava/lang/String;

    iget-object v7, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->val$path:Ljava/lang/String;

    iget-object v8, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->val$body:[B

    iget-object v9, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->val$headers:Ljava/util/List;

    const-string v5, "OfficialDropboxJavaSDKv2"

    invoke-static/range {v4 .. v9}, Lcom/dropbox/core/DbxRequestUtil;->startPostRaw(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/util/List;)Lcom/dropbox/core/http/HttpRequestor$Response;

    move-result-object v3

    .line 201
    invoke-static {v3}, Lcom/dropbox/core/DbxRequestUtil;->getRequestId(Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/String;

    move-result-object v4

    .line 202
    invoke-static {v3}, Lcom/dropbox/core/DbxRequestUtil;->getContentType(Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/String;

    move-result-object v5

    .line 205
    :try_start_0
    invoke-virtual {v3}, Lcom/dropbox/core/http/HttpRequestor$Response;->getStatusCode()I

    move-result v6

    const/16 v7, 0xc8

    if-eq v6, v7, :cond_2

    const/16 v7, 0xce

    if-eq v6, v7, :cond_2

    const/16 v0, 0x199

    if-eq v6, v0, :cond_1

    .line 226
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->userIdAnon:Ljava/lang/String;

    invoke-static {v3, v0}, Lcom/dropbox/core/DbxRequestUtil;->unexpectedStatus(Lcom/dropbox/core/http/HttpRequestor$Response;Ljava/lang/String;)Lcom/dropbox/core/DbxException;

    move-result-object v0

    throw v0

    .line 224
    :cond_1
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->val$errorSerializer:Lcom/dropbox/core/stone/StoneSerializer;

    iget-object v1, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->userIdAnon:Ljava/lang/String;

    invoke-static {v0, v3, v1}, Lcom/dropbox/core/DbxWrappedException;->fromResponse(Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/http/HttpRequestor$Response;Ljava/lang/String;)Lcom/dropbox/core/DbxWrappedException;

    move-result-object v0

    throw v0

    .line 209
    :cond_2
    invoke-virtual {v3}, Lcom/dropbox/core/http/HttpRequestor$Response;->getHeaders()Ljava/util/Map;

    move-result-object v6

    const-string v7, "dropbox-api-result"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    if-eqz v6, :cond_5

    .line 213
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_4

    const/4 v1, 0x0

    .line 216
    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 221
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxRawClientV2$2;->val$responseSerializer:Lcom/dropbox/core/stone/StoneSerializer;

    invoke-virtual {v0, v1}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 222
    new-instance v1, Lcom/dropbox/core/DbxDownloader;

    invoke-virtual {v3}, Lcom/dropbox/core/http/HttpRequestor$Response;->getBody()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, v0, v2, v5}, Lcom/dropbox/core/DbxDownloader;-><init>(Ljava/lang/Object;Ljava/io/InputStream;Ljava/lang/String;)V

    return-object v1

    .line 218
    :cond_3
    new-instance v1, Lcom/dropbox/core/BadResponseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/dropbox/core/http/HttpRequestor$Response;->getHeaders()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v4, v0}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v1

    .line 214
    :cond_4
    new-instance v0, Lcom/dropbox/core/BadResponseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/dropbox/core/http/HttpRequestor$Response;->getHeaders()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v4, v1}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 211
    :cond_5
    new-instance v0, Lcom/dropbox/core/BadResponseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/dropbox/core/http/HttpRequestor$Response;->getHeaders()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v4, v1}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Lcom/fasterxml/jackson/core/JsonProcessingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    .line 231
    new-instance v1, Lcom/dropbox/core/NetworkIOException;

    invoke-direct {v1, v0}, Lcom/dropbox/core/NetworkIOException;-><init>(Ljava/io/IOException;)V

    throw v1

    :catch_1
    move-exception v0

    .line 229
    new-instance v1, Lcom/dropbox/core/BadResponseException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Bad JSON: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonProcessingException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v4, v2, v0}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public bridge synthetic execute()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxWrappedException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 192
    invoke-virtual {p0}, Lcom/dropbox/core/v2/DbxRawClientV2$2;->execute()Lcom/dropbox/core/DbxDownloader;

    move-result-object v0

    return-object v0
.end method
