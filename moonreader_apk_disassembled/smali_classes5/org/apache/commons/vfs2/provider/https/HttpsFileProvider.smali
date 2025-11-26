.class public Lorg/apache/commons/vfs2/provider/https/HttpsFileProvider;
.super Lorg/apache/commons/vfs2/provider/http/HttpFileProvider;
.source "HttpsFileProvider.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/http/HttpFileProvider;-><init>()V

    .line 27
    invoke-static {}, Lorg/apache/commons/vfs2/provider/https/HttpsFileNameParser;->getInstance()Lorg/apache/commons/vfs2/provider/FileNameParser;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/provider/https/HttpsFileProvider;->setFileNameParser(Lorg/apache/commons/vfs2/provider/FileNameParser;)V

    return-void
.end method
