.class public Lcom/dropbox/core/v2/check/DbxAppCheckRequests;
.super Ljava/lang/Object;
.source "DbxAppCheckRequests.java"


# instance fields
.field private final client:Lcom/dropbox/core/v2/DbxRawClientV2;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/dropbox/core/v2/check/DbxAppCheckRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    return-void
.end method


# virtual methods
.method public app()Lcom/dropbox/core/v2/check/EchoResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 72
    new-instance v0, Lcom/dropbox/core/v2/check/EchoArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/check/EchoArg;-><init>()V

    .line 73
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/check/DbxAppCheckRequests;->app(Lcom/dropbox/core/v2/check/EchoArg;)Lcom/dropbox/core/v2/check/EchoResult;

    move-result-object v0

    return-object v0
.end method

.method app(Lcom/dropbox/core/v2/check/EchoArg;)Lcom/dropbox/core/v2/check/EchoResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 45
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/check/DbxAppCheckRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/check/app"

    sget-object v5, Lcom/dropbox/core/v2/check/EchoArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/check/EchoArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/check/EchoResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/check/EchoResult$Serializer;

    .line 51
    invoke-static {}, Lcom/dropbox/core/stone/StoneSerializers;->void_()Lcom/dropbox/core/stone/StoneSerializer;

    move-result-object v7

    const/4 v4, 0x0

    move-object v3, p1

    .line 45
    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/check/EchoResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 54
    new-instance v0, Lcom/dropbox/core/DbxApiException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Unexpected error response for \"app\":"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/dropbox/core/DbxApiException;-><init>(Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Ljava/lang/String;)V

    throw v0
.end method

.method public app(Ljava/lang/String;)Lcom/dropbox/core/v2/check/EchoResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 96
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1f4

    if-gt v0, v1, :cond_0

    .line 99
    new-instance v0, Lcom/dropbox/core/v2/check/EchoArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/check/EchoArg;-><init>(Ljava/lang/String;)V

    .line 100
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/check/DbxAppCheckRequests;->app(Lcom/dropbox/core/v2/check/EchoArg;)Lcom/dropbox/core/v2/check/EchoResult;

    move-result-object p1

    return-object p1

    .line 97
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'query\' is longer than 500"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 94
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'query\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
