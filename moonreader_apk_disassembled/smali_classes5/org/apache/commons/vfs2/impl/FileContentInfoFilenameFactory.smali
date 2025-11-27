.class public Lorg/apache/commons/vfs2/impl/FileContentInfoFilenameFactory;
.super Ljava/lang/Object;
.source "FileContentInfoFilenameFactory.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileContentInfoFactory;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lorg/apache/commons/vfs2/FileContent;)Lorg/apache/commons/vfs2/FileContentInfo;
    .locals 2

    .line 36
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileContent;->getFile()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileName;->getBaseName()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 38
    invoke-static {}, Ljava/net/URLConnection;->getFileNameMap()Ljava/net/FileNameMap;

    move-result-object v1

    .line 39
    invoke-interface {v1, p1}, Ljava/net/FileNameMap;->getContentTypeFor(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    move-object p1, v0

    .line 42
    :goto_0
    new-instance v1, Lorg/apache/commons/vfs2/impl/DefaultFileContentInfo;

    invoke-direct {v1, p1, v0}, Lorg/apache/commons/vfs2/impl/DefaultFileContentInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method
