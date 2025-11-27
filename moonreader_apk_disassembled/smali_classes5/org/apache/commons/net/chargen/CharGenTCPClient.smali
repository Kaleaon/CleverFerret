.class public final Lorg/apache/commons/net/chargen/CharGenTCPClient;
.super Lorg/apache/commons/net/SocketClient;
.source "CharGenTCPClient.java"


# static fields
.field public static final CHARGEN_PORT:I = 0x13

.field public static final DEFAULT_PORT:I = 0x13

.field public static final NETSTAT_PORT:I = 0xf

.field public static final QUOTE_OF_DAY_PORT:I = 0x11

.field public static final SYSTAT_PORT:I = 0xb


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 63
    invoke-direct {p0}, Lorg/apache/commons/net/SocketClient;-><init>()V

    const/16 v0, 0x13

    .line 64
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/chargen/CharGenTCPClient;->setDefaultPort(I)V

    return-void
.end method


# virtual methods
.method public getInputStream()Ljava/io/InputStream;
    .locals 1

    .line 78
    iget-object v0, p0, Lorg/apache/commons/net/chargen/CharGenTCPClient;->_input_:Ljava/io/InputStream;

    return-object v0
.end method
