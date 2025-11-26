.class public Lorg/apache/http/client/entity/GzipDecompressingEntity;
.super Lorg/apache/http/client/entity/DecompressingEntity;
.source "GzipDecompressingEntity.java"


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpEntity;)V
    .locals 1

    .line 47
    invoke-static {}, Lorg/apache/http/client/entity/GZIPInputStreamFactory;->getInstance()Lorg/apache/http/client/entity/GZIPInputStreamFactory;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/http/client/entity/DecompressingEntity;-><init>(Lorg/apache/http/HttpEntity;Lorg/apache/http/client/entity/InputStreamFactory;)V

    return-void
.end method
