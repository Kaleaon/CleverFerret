.class Lcom/dropbox/core/v1/DbxClientV1$6;
.super Lcom/dropbox/core/DbxRequestUtil$RequestMaker;
.source "DbxClientV1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dropbox/core/v1/DbxClientV1;->startGetSomething(Ljava/lang/String;[Ljava/lang/String;)Lcom/dropbox/core/v1/DbxClientV1$Downloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/DbxRequestUtil$RequestMaker<",
        "Lcom/dropbox/core/v1/DbxClientV1$Downloader;",
        "Lcom/dropbox/core/DbxException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dropbox/core/v1/DbxClientV1;

.field final synthetic val$apiPath:Ljava/lang/String;

.field final synthetic val$host:Ljava/lang/String;

.field final synthetic val$params:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v1/DbxClientV1;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    .line 480
    iput-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1$6;->this$0:Lcom/dropbox/core/v1/DbxClientV1;

    iput-object p2, p0, Lcom/dropbox/core/v1/DbxClientV1$6;->val$host:Ljava/lang/String;

    iput-object p3, p0, Lcom/dropbox/core/v1/DbxClientV1$6;->val$apiPath:Ljava/lang/String;

    iput-object p4, p0, Lcom/dropbox/core/v1/DbxClientV1$6;->val$params:[Ljava/lang/String;

    invoke-direct {p0}, Lcom/dropbox/core/DbxRequestUtil$RequestMaker;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Lcom/dropbox/core/v1/DbxClientV1$Downloader;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    const-string v1, "Bad JSON in X-Dropbox-Metadata header: "

    .line 483
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$6;->this$0:Lcom/dropbox/core/v1/DbxClientV1;

    invoke-static {v0}, Lcom/dropbox/core/v1/DbxClientV1;->access$000(Lcom/dropbox/core/v1/DbxClientV1;)Lcom/dropbox/core/DbxRequestConfig;

    move-result-object v2

    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$6;->this$0:Lcom/dropbox/core/v1/DbxClientV1;

    invoke-static {v0}, Lcom/dropbox/core/v1/DbxClientV1;->access$100(Lcom/dropbox/core/v1/DbxClientV1;)Ljava/lang/String;

    move-result-object v3

    iget-object v5, p0, Lcom/dropbox/core/v1/DbxClientV1$6;->val$host:Ljava/lang/String;

    iget-object v6, p0, Lcom/dropbox/core/v1/DbxClientV1$6;->val$apiPath:Ljava/lang/String;

    iget-object v7, p0, Lcom/dropbox/core/v1/DbxClientV1$6;->val$params:[Ljava/lang/String;

    const/4 v8, 0x0

    const-string v4, "Dropbox-Java-SDK"

    invoke-static/range {v2 .. v8}, Lcom/dropbox/core/DbxRequestUtil;->startGet(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;)Lcom/dropbox/core/http/HttpRequestor$Response;

    move-result-object v2

    .line 487
    :try_start_0
    invoke-virtual {v2}, Lcom/dropbox/core/http/HttpRequestor$Response;->getStatusCode()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v3, 0x194

    if-ne v0, v3, :cond_0

    const/4 v0, 0x0

    .line 510
    :try_start_1
    invoke-virtual {v2}, Lcom/dropbox/core/http/HttpRequestor$Response;->getBody()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    return-object v0

    .line 488
    :cond_0
    :try_start_2
    invoke-virtual {v2}, Lcom/dropbox/core/http/HttpRequestor$Response;->getStatusCode()I

    move-result v0

    const/16 v3, 0xc8

    if-ne v0, v3, :cond_1

    .line 490
    const-string v0, "x-dropbox-metadata"

    invoke-static {v2, v0}, Lcom/dropbox/core/DbxRequestUtil;->getFirstHeader(Lcom/dropbox/core/http/HttpRequestor$Response;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 493
    :try_start_3
    sget-object v3, Lcom/dropbox/core/v1/DbxEntry$File;->Reader:Lcom/dropbox/core/json/JsonReader;

    invoke-virtual {v3, v0}, Lcom/dropbox/core/json/JsonReader;->readFully(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v1/DbxEntry$File;
    :try_end_3
    .catch Lcom/dropbox/core/json/JsonReadException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 501
    :try_start_4
    new-instance v1, Lcom/dropbox/core/v1/DbxClientV1$Downloader;

    invoke-virtual {v2}, Lcom/dropbox/core/http/HttpRequestor$Response;->getBody()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v1, v0, v3}, Lcom/dropbox/core/v1/DbxClientV1$Downloader;-><init>(Lcom/dropbox/core/v1/DbxEntry$File;Ljava/io/InputStream;)V

    return-object v1

    :catch_1
    move-exception v0

    .line 496
    invoke-static {v2}, Lcom/dropbox/core/DbxRequestUtil;->getRequestId(Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/String;

    move-result-object v3

    .line 497
    new-instance v4, Lcom/dropbox/core/BadResponseException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/dropbox/core/json/JsonReadException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v3, v1, v0}, Lcom/dropbox/core/BadResponseException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 488
    :cond_1
    invoke-static {v2}, Lcom/dropbox/core/DbxRequestUtil;->unexpectedStatus(Lcom/dropbox/core/http/HttpRequestor$Response;)Lcom/dropbox/core/DbxException;

    move-result-object v0

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception v0

    .line 510
    :try_start_5
    invoke-virtual {v2}, Lcom/dropbox/core/http/HttpRequestor$Response;->getBody()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 517
    :catch_2
    throw v0
.end method

.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 480
    invoke-virtual {p0}, Lcom/dropbox/core/v1/DbxClientV1$6;->run()Lcom/dropbox/core/v1/DbxClientV1$Downloader;

    move-result-object v0

    return-object v0
.end method
