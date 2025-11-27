.class Lcom/dropbox/core/v2/DbxRawClientV2$1;
.super Ljava/lang/Object;
.source "DbxRawClientV2.java"

# interfaces
.implements Lcom/dropbox/core/v2/DbxRawClientV2$RetriableExecution;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/dropbox/core/v2/DbxRawClientV2$RetriableExecution<",
        "TResT;>;"
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

    .line 137
    iput-object p1, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->this$0:Lcom/dropbox/core/v2/DbxRawClientV2;

    iput-boolean p2, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->val$noAuth:Z

    iput-object p3, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->val$headers:Ljava/util/List;

    iput-object p4, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->val$host:Ljava/lang/String;

    iput-object p5, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->val$path:Ljava/lang/String;

    iput-object p6, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->val$body:[B

    iput-object p7, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->val$responseSerializer:Lcom/dropbox/core/stone/StoneSerializer;

    iput-object p8, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->val$errorSerializer:Lcom/dropbox/core/stone/StoneSerializer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/DbxRawClientV2$1;Ljava/lang/String;)Lcom/dropbox/core/v2/DbxRawClientV2$RetriableExecution;
    .locals 0

    .line 137
    invoke-direct {p0, p1}, Lcom/dropbox/core/v2/DbxRawClientV2$1;->init(Ljava/lang/String;)Lcom/dropbox/core/v2/DbxRawClientV2$RetriableExecution;

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
            "TResT;>;"
        }
    .end annotation

    .line 165
    iput-object p1, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->userIdAnon:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public execute()Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TResT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxWrappedException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 142
    iget-boolean v0, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->val$noAuth:Z

    if-nez v0, :cond_0

    .line 143
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->this$0:Lcom/dropbox/core/v2/DbxRawClientV2;

    iget-object v1, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->val$headers:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/dropbox/core/v2/DbxRawClientV2;->addAuthHeaders(Ljava/util/List;)V

    .line 146
    :cond_0
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->this$0:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-static {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->access$000(Lcom/dropbox/core/v2/DbxRawClientV2;)Lcom/dropbox/core/DbxRequestConfig;

    move-result-object v1

    iget-object v3, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->val$host:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->val$path:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->val$body:[B

    iget-object v6, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->val$headers:Ljava/util/List;

    const-string v2, "OfficialDropboxJavaSDKv2"

    invoke-static/range {v1 .. v6}, Lcom/dropbox/core/DbxRequestUtil;->startPostRaw(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/util/List;)Lcom/dropbox/core/http/HttpRequestor$Response;

    move-result-object v1

    .line 148
    :try_start_0
    invoke-virtual {v1}, Lcom/dropbox/core/http/HttpRequestor$Response;->getStatusCode()I

    move-result v0

    const/16 v2, 0xc8

    if-eq v0, v2, :cond_2

    const/16 v2, 0x199

    if-eq v0, v2, :cond_1

    .line 154
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->userIdAnon:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/dropbox/core/DbxRequestUtil;->unexpectedStatus(Lcom/dropbox/core/http/HttpRequestor$Response;Ljava/lang/String;)Lcom/dropbox/core/DbxException;

    move-result-object v0

    throw v0

    .line 152
    :cond_1
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->val$errorSerializer:Lcom/dropbox/core/stone/StoneSerializer;

    iget-object v2, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->userIdAnon:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/dropbox/core/DbxWrappedException;->fromResponse(Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/http/HttpRequestor$Response;Ljava/lang/String;)Lcom/dropbox/core/DbxWrappedException;

    move-result-object v0

    throw v0

    .line 150
    :cond_2
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxRawClientV2$1;->val$responseSerializer:Lcom/dropbox/core/stone/StoneSerializer;

    invoke-virtual {v1}, Lcom/dropbox/core/http/HttpRequestor$Response;->getBody()Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/dropbox/core/stone/StoneSerializer;->deserialize(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Lcom/fasterxml/jackson/core/JsonProcessingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 160
    new-instance v1, Lcom/dropbox/core/NetworkIOException;

    invoke-direct {v1, v0}, Lcom/dropbox/core/NetworkIOException;-><init>(Ljava/io/IOException;)V

    throw v1

    :catch_1
    move-exception v0

    .line 157
    invoke-static {v1}, Lcom/dropbox/core/DbxRequestUtil;->getRequestId(Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/String;

    move-result-object v1

    .line 158
    new-instance v2, Lcom/dropbox/core/BadResponseException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Bad JSON: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonProcessingException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v1, v3, v0}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
