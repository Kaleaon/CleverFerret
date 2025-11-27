.class public Lorg/apache/commons/net/telnet/SimpleOptionHandler;
.super Lorg/apache/commons/net/telnet/TelnetOptionHandler;
.source "SimpleOptionHandler.java"


# direct methods
.method public constructor <init>(I)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move v1, p1

    .line 56
    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;-><init>(IZZZZ)V

    return-void
.end method

.method public constructor <init>(IZZZZ)V
    .locals 0

    .line 44
    invoke-direct/range {p0 .. p5}, Lorg/apache/commons/net/telnet/TelnetOptionHandler;-><init>(IZZZZ)V

    return-void
.end method
