.class public Lcom/dropbox/core/DbxWebAuthNoRedirect;
.super Ljava/lang/Object;
.source "DbxWebAuthNoRedirect.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final auth:Lcom/dropbox/core/DbxWebAuth;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxAppInfo;)V
    .locals 1

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Lcom/dropbox/core/DbxWebAuth;

    invoke-direct {v0, p1, p2}, Lcom/dropbox/core/DbxWebAuth;-><init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxAppInfo;)V

    iput-object v0, p0, Lcom/dropbox/core/DbxWebAuthNoRedirect;->auth:Lcom/dropbox/core/DbxWebAuth;

    return-void
.end method


# virtual methods
.method public finish(Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 86
    iget-object v0, p0, Lcom/dropbox/core/DbxWebAuthNoRedirect;->auth:Lcom/dropbox/core/DbxWebAuth;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/DbxWebAuth;->finishFromCode(Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;

    move-result-object p1

    return-object p1
.end method

.method public start()Ljava/lang/String;
    .locals 2

    .line 71
    invoke-static {}, Lcom/dropbox/core/DbxWebAuth;->newRequestBuilder()Lcom/dropbox/core/DbxWebAuth$Request$Builder;

    move-result-object v0

    .line 72
    invoke-virtual {v0}, Lcom/dropbox/core/DbxWebAuth$Request$Builder;->withNoRedirect()Lcom/dropbox/core/DbxWebAuth$Request$Builder;

    move-result-object v0

    .line 73
    invoke-virtual {v0}, Lcom/dropbox/core/DbxWebAuth$Request$Builder;->build()Lcom/dropbox/core/DbxWebAuth$Request;

    move-result-object v0

    .line 74
    iget-object v1, p0, Lcom/dropbox/core/DbxWebAuthNoRedirect;->auth:Lcom/dropbox/core/DbxWebAuth;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/DbxWebAuth;->authorize(Lcom/dropbox/core/DbxWebAuth$Request;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
