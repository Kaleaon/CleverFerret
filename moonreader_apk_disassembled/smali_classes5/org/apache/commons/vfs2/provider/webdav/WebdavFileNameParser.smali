.class public Lorg/apache/commons/vfs2/provider/webdav/WebdavFileNameParser;
.super Lorg/apache/commons/vfs2/provider/http/HttpFileNameParser;
.source "WebdavFileNameParser.java"


# static fields
.field private static final INSTANCE:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileNameParser;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 28
    new-instance v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileNameParser;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileNameParser;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileNameParser;->INSTANCE:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileNameParser;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileNameParser;-><init>()V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/provider/FileNameParser;
    .locals 1

    .line 35
    sget-object v0, Lorg/apache/commons/vfs2/provider/webdav/WebdavFileNameParser;->INSTANCE:Lorg/apache/commons/vfs2/provider/webdav/WebdavFileNameParser;

    return-object v0
.end method
