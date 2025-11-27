.class Lorg/apache/commons/vfs2/provider/http/HttpFileObject$HttpInputStream;
.super Lorg/apache/commons/vfs2/util/MonitorInputStream;
.source "HttpFileObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/provider/http/HttpFileObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "HttpInputStream"
.end annotation


# instance fields
.field private final method:Lorg/apache/commons/httpclient/methods/GetMethod;


# direct methods
.method public constructor <init>(Lorg/apache/commons/httpclient/methods/GetMethod;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 58
    invoke-virtual {p1}, Lorg/apache/commons/httpclient/methods/GetMethod;->getResponseBodyAsStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/util/MonitorInputStream;-><init>(Ljava/io/InputStream;)V

    .line 59
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject$HttpInputStream;->method:Lorg/apache/commons/httpclient/methods/GetMethod;

    return-void
.end method


# virtual methods
.method protected onClose()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/http/HttpFileObject$HttpInputStream;->method:Lorg/apache/commons/httpclient/methods/GetMethod;

    invoke-virtual {v0}, Lorg/apache/commons/httpclient/methods/GetMethod;->releaseConnection()V

    return-void
.end method
