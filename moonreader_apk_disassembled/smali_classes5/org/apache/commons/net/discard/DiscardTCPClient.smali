.class public Lorg/apache/commons/net/discard/DiscardTCPClient;
.super Lorg/apache/commons/net/SocketClient;
.source "DiscardTCPClient.java"


# static fields
.field public static final DEFAULT_PORT:I = 0x9


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 48
    invoke-direct {p0}, Lorg/apache/commons/net/SocketClient;-><init>()V

    const/16 v0, 0x9

    .line 49
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/discard/DiscardTCPClient;->setDefaultPort(I)V

    return-void
.end method


# virtual methods
.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1

    .line 63
    iget-object v0, p0, Lorg/apache/commons/net/discard/DiscardTCPClient;->_output_:Ljava/io/OutputStream;

    return-object v0
.end method
