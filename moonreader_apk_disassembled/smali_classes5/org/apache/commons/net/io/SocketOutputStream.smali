.class public Lorg/apache/commons/net/io/SocketOutputStream;
.super Ljava/io/FilterOutputStream;
.source "SocketOutputStream.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# instance fields
.field private final socket:Ljava/net/Socket;


# direct methods
.method public constructor <init>(Ljava/net/Socket;Ljava/io/OutputStream;)V
    .locals 0

    .line 51
    invoke-direct {p0, p2}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 52
    iput-object p1, p0, Lorg/apache/commons/net/io/SocketOutputStream;->socket:Ljava/net/Socket;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    invoke-super {p0}, Ljava/io/FilterOutputStream;->close()V

    .line 86
    iget-object v0, p0, Lorg/apache/commons/net/io/SocketOutputStream;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    return-void
.end method

.method public write([BII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 71
    iget-object v0, p0, Lorg/apache/commons/net/io/SocketOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    return-void
.end method
