.class public final Lorg/apache/commons/net/daytime/DaytimeTCPClient;
.super Lorg/apache/commons/net/SocketClient;
.source "DaytimeTCPClient.java"


# static fields
.field public static final DEFAULT_PORT:I = 0xd


# instance fields
.field private final buffer:[C


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 51
    invoke-direct {p0}, Lorg/apache/commons/net/SocketClient;-><init>()V

    const/16 v0, 0x40

    .line 44
    new-array v0, v0, [C

    iput-object v0, p0, Lorg/apache/commons/net/daytime/DaytimeTCPClient;->buffer:[C

    const/16 v0, 0xd

    .line 52
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/daytime/DaytimeTCPClient;->setDefaultPort(I)V

    return-void
.end method


# virtual methods
.method public getTime()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/commons/net/daytime/DaytimeTCPClient;->buffer:[C

    array-length v1, v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 74
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    iget-object v3, p0, Lorg/apache/commons/net/daytime/DaytimeTCPClient;->_input_:Ljava/io/InputStream;

    invoke-virtual {p0}, Lorg/apache/commons/net/daytime/DaytimeTCPClient;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 78
    :goto_0
    iget-object v2, p0, Lorg/apache/commons/net/daytime/DaytimeTCPClient;->buffer:[C

    array-length v3, v2

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v3}, Ljava/io/BufferedReader;->read([CII)I

    move-result v2

    if-gtz v2, :cond_0

    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 82
    :cond_0
    iget-object v3, p0, Lorg/apache/commons/net/daytime/DaytimeTCPClient;->buffer:[C

    invoke-virtual {v0, v3, v4, v2}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_0
.end method
