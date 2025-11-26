.class public Lorg/apache/commons/vfs2/provider/http/HttpFileContentInfoFactory;
.super Ljava/lang/Object;
.source "HttpFileContentInfoFactory.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileContentInfoFactory;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lorg/apache/commons/vfs2/FileContent;)Lorg/apache/commons/vfs2/FileContentInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 37
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileContent;->getFile()Lorg/apache/commons/vfs2/FileObject;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/commons/vfs2/util/FileObjectUtils;->getAbstractFileObject(Lorg/apache/commons/vfs2/FileObject;)Lorg/apache/commons/vfs2/provider/AbstractFileObject;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;

    .line 44
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/http/HttpFileObject;->getHeadMethod()Lorg/apache/commons/httpclient/methods/HeadMethod;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    const-string v0, "content-type"

    invoke-virtual {p1, v0}, Lorg/apache/commons/httpclient/methods/HeadMethod;->getResponseHeader(Ljava/lang/String;)Lorg/apache/commons/httpclient/Header;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 50
    invoke-virtual {v0}, Lorg/apache/commons/httpclient/Header;->getElements()[Lorg/apache/commons/httpclient/HeaderElement;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 51
    array-length v1, v0

    if-lez v1, :cond_0

    const/4 v1, 0x0

    .line 52
    aget-object v0, v0, v1

    invoke-virtual {v0}, Lorg/apache/commons/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 56
    :goto_0
    invoke-virtual {p1}, Lorg/apache/commons/httpclient/methods/HeadMethod;->getResponseCharSet()Ljava/lang/String;

    move-result-object p1

    .line 58
    new-instance v1, Lorg/apache/commons/vfs2/impl/DefaultFileContentInfo;

    invoke-direct {v1, v0, p1}, Lorg/apache/commons/vfs2/impl/DefaultFileContentInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :catch_0
    move-exception p1

    .line 46
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method
