.class public final Lcom/dropbox/core/DbxWrappedException;
.super Ljava/lang/Exception;
.source "DbxWrappedException.java"


# static fields
.field private static final serialVersionUID:J


# instance fields
.field private final errValue:Ljava/lang/Object;

.field private final requestId:Ljava/lang/String;

.field private final userMessage:Lcom/dropbox/core/LocalizedText;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/dropbox/core/DbxWrappedException;->errValue:Ljava/lang/Object;

    .line 26
    iput-object p2, p0, Lcom/dropbox/core/DbxWrappedException;->requestId:Ljava/lang/String;

    .line 27
    iput-object p3, p0, Lcom/dropbox/core/DbxWrappedException;->userMessage:Lcom/dropbox/core/LocalizedText;

    return-void
.end method

.method public static executeBlockForObject(Lcom/dropbox/core/v2/callbacks/DbxGlobalCallbackFactory;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/dropbox/core/v2/callbacks/DbxGlobalCallbackFactory;",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    if-eqz p0, :cond_0

    .line 80
    invoke-interface {p0, p1, p2}, Lcom/dropbox/core/v2/callbacks/DbxGlobalCallbackFactory;->createRouteErrorCallback(Ljava/lang/String;Ljava/lang/Object;)Lcom/dropbox/core/v2/callbacks/DbxRouteErrorCallback;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 82
    invoke-virtual {p0, p2}, Lcom/dropbox/core/v2/callbacks/DbxRouteErrorCallback;->setRouteError(Ljava/lang/Object;)V

    .line 83
    invoke-virtual {p0}, Lcom/dropbox/core/v2/callbacks/DbxRouteErrorCallback;->run()V

    :cond_0
    return-void
.end method

.method public static executeOtherBlocks(Lcom/dropbox/core/v2/callbacks/DbxGlobalCallbackFactory;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6

    .line 62
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "tag"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 63
    invoke-virtual {v0, p2, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 64
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "value"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 65
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 66
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v0, 0x1

    .line 67
    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 68
    invoke-virtual {v4, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 69
    invoke-static {p0, p1, p2}, Lcom/dropbox/core/DbxWrappedException;->executeBlockForObject(Lcom/dropbox/core/v2/callbacks/DbxGlobalCallbackFactory;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    :cond_1
    return-void
.end method

.method public static fromResponse(Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/http/HttpRequestor$Response;Ljava/lang/String;)Lcom/dropbox/core/DbxWrappedException;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/dropbox/core/stone/StoneSerializer<",
            "TT;>;",
            "Lcom/dropbox/core/http/HttpRequestor$Response;",
            "Ljava/lang/String;",
            ")",
            "Lcom/dropbox/core/DbxWrappedException;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .line 44
    invoke-static {p1}, Lcom/dropbox/core/DbxRequestUtil;->getRequestId(Lcom/dropbox/core/http/HttpRequestor$Response;)Ljava/lang/String;

    move-result-object v0

    .line 46
    new-instance v1, Lcom/dropbox/core/ApiErrorResponse$Serializer;

    invoke-direct {v1, p0}, Lcom/dropbox/core/ApiErrorResponse$Serializer;-><init>(Lcom/dropbox/core/stone/StoneSerializer;)V

    .line 47
    invoke-virtual {p1}, Lcom/dropbox/core/http/HttpRequestor$Response;->getBody()Ljava/io/InputStream;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/dropbox/core/ApiErrorResponse$Serializer;->deserialize(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/ApiErrorResponse;

    .line 49
    invoke-virtual {p0}, Lcom/dropbox/core/ApiErrorResponse;->getError()Ljava/lang/Object;

    move-result-object p1

    .line 51
    sget-object v1, Lcom/dropbox/core/DbxRequestUtil;->sharedCallbackFactory:Lcom/dropbox/core/v2/callbacks/DbxGlobalCallbackFactory;

    .line 52
    invoke-static {v1, p2, p1}, Lcom/dropbox/core/DbxWrappedException;->executeBlockForObject(Lcom/dropbox/core/v2/callbacks/DbxGlobalCallbackFactory;Ljava/lang/String;Ljava/lang/Object;)V

    .line 53
    invoke-static {v1, p2, p1}, Lcom/dropbox/core/DbxWrappedException;->executeOtherBlocks(Lcom/dropbox/core/v2/callbacks/DbxGlobalCallbackFactory;Ljava/lang/String;Ljava/lang/Object;)V

    .line 55
    new-instance p2, Lcom/dropbox/core/DbxWrappedException;

    invoke-virtual {p0}, Lcom/dropbox/core/ApiErrorResponse;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object p0

    invoke-direct {p2, p1, v0, p0}, Lcom/dropbox/core/DbxWrappedException;-><init>(Ljava/lang/Object;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;)V

    return-object p2
.end method


# virtual methods
.method public getErrorValue()Ljava/lang/Object;
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/dropbox/core/DbxWrappedException;->errValue:Ljava/lang/Object;

    return-object v0
.end method

.method public getRequestId()Ljava/lang/String;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/dropbox/core/DbxWrappedException;->requestId:Ljava/lang/String;

    return-object v0
.end method

.method public getUserMessage()Lcom/dropbox/core/LocalizedText;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/dropbox/core/DbxWrappedException;->userMessage:Lcom/dropbox/core/LocalizedText;

    return-object v0
.end method
