.class public final Lorg/apache/commons/vfs2/provider/webdav/WebdavMethodRetryHandler;
.super Ljava/lang/Object;
.source "WebdavMethodRetryHandler.java"

# interfaces
.implements Lorg/apache/commons/httpclient/HttpMethodRetryHandler;


# static fields
.field private static final INSTANCE:Lorg/apache/commons/vfs2/provider/webdav/WebdavMethodRetryHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 32
    new-instance v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavMethodRetryHandler;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavMethodRetryHandler;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavMethodRetryHandler;->INSTANCE:Lorg/apache/commons/vfs2/provider/webdav/WebdavMethodRetryHandler;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/webdav/WebdavMethodRetryHandler;
    .locals 1

    .line 38
    sget-object v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavMethodRetryHandler;->INSTANCE:Lorg/apache/commons/vfs2/provider/webdav/WebdavMethodRetryHandler;

    return-object v0
.end method


# virtual methods
.method public retryMethod(Lorg/apache/commons/httpclient/HttpMethod;Ljava/io/IOException;I)Z
    .locals 0

    const/4 p1, 0x2

    if-ge p3, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
