.class Lcom/dropbox/core/oauth/DbxCredential$1;
.super Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;
.source "DbxCredential.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dropbox/core/oauth/DbxCredential;->refresh(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;)Lcom/dropbox/core/oauth/DbxRefreshResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/DbxRequestUtil$ResponseHandler<",
        "Lcom/dropbox/core/oauth/DbxRefreshResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dropbox/core/oauth/DbxCredential;


# direct methods
.method constructor <init>(Lcom/dropbox/core/oauth/DbxCredential;)V
    .locals 0

    .line 203
    iput-object p1, p0, Lcom/dropbox/core/oauth/DbxCredential$1;->this$0:Lcom/dropbox/core/oauth/DbxCredential;

    invoke-direct {p0}, Lcom/dropbox/core/DbxRequestUtil$ResponseHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Lcom/dropbox/core/http/HttpRequestor$Response;)Lcom/dropbox/core/oauth/DbxRefreshResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 206
    invoke-virtual {p1}, Lcom/dropbox/core/http/HttpRequestor$Response;->getStatusCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    .line 213
    sget-object v0, Lcom/dropbox/core/oauth/DbxRefreshResult;->Reader:Lcom/dropbox/core/json/JsonReader;

    invoke-static {v0, p1}, Lcom/dropbox/core/DbxRequestUtil;->readJsonFromResponse(Lcom/dropbox/core/json/JsonReader;Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/oauth/DbxRefreshResult;

    return-object p1

    .line 207
    :cond_0
    invoke-static {p1}, Lcom/dropbox/core/DbxRequestUtil;->getRequestId(Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/String;

    move-result-object v0

    .line 208
    sget-object v1, Lcom/dropbox/core/oauth/DbxOAuthError;->Reader:Lcom/dropbox/core/json/JsonReader;

    invoke-static {v1, p1}, Lcom/dropbox/core/DbxRequestUtil;->readJsonFromResponse(Lcom/dropbox/core/json/JsonReader;Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/oauth/DbxOAuthError;

    .line 211
    new-instance v1, Lcom/dropbox/core/oauth/DbxOAuthException;

    invoke-direct {v1, v0, p1}, Lcom/dropbox/core/oauth/DbxOAuthException;-><init>(Ljava/lang/String;Lcom/dropbox/core/oauth/DbxOAuthError;)V

    throw v1
.end method

.method public bridge synthetic handle(Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 203
    invoke-virtual {p0, p1}, Lcom/dropbox/core/oauth/DbxCredential$1;->handle(Lcom/dropbox/core/http/HttpRequestor$Response;)Lcom/dropbox/core/oauth/DbxRefreshResult;

    move-result-object p1

    return-object p1
.end method
