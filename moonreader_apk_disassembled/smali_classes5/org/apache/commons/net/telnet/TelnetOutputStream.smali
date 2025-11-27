.class final Lorg/apache/commons/net/telnet/TelnetOutputStream;
.super Ljava/io/OutputStream;
.source "TelnetOutputStream.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# instance fields
.field private final client:Lorg/apache/commons/net/telnet/TelnetClient;

.field private final convertCRtoCRLF:Z

.field private lastWasCR:Z


# direct methods
.method constructor <init>(Lorg/apache/commons/net/telnet/TelnetClient;)V
    .locals 1

    .line 43
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    const/4 v0, 0x1

    .line 39
    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->convertCRtoCRLF:Z

    .line 44
    iput-object p1, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

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

    .line 163
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/telnet/TelnetClient;->closeOutputStream()V

    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 156
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v0}, Lorg/apache/commons/net/telnet/TelnetClient;->flushOutputStream()V

    return-void
.end method

.method public write(I)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 59
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v0

    const/16 v1, 0xff

    and-int/2addr p1, v1

    .line 63
    :try_start_0
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/apache/commons/net/telnet/TelnetClient;->requestedWont(I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 65
    iget-boolean v2, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->lastWasCR:Z

    const/16 v4, 0xa

    if-eqz v2, :cond_0

    .line 69
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v2, v4}, Lorg/apache/commons/net/telnet/TelnetClient;->sendByte(I)V

    if-ne p1, v4, :cond_0

    .line 72
    iput-boolean v3, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->lastWasCR:Z

    .line 73
    monitor-exit v0

    return-void

    :cond_0
    const/16 v2, 0xd

    if-eq p1, v4, :cond_3

    if-eq p1, v2, :cond_2

    if-eq p1, v1, :cond_1

    .line 101
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, p1}, Lorg/apache/commons/net/telnet/TelnetClient;->sendByte(I)V

    .line 102
    iput-boolean v3, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->lastWasCR:Z

    goto :goto_0

    .line 96
    :cond_1
    iget-object p1, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {p1, v1}, Lorg/apache/commons/net/telnet/TelnetClient;->sendByte(I)V

    .line 97
    iget-object p1, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {p1, v1}, Lorg/apache/commons/net/telnet/TelnetClient;->sendByte(I)V

    .line 98
    iput-boolean v3, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->lastWasCR:Z

    goto :goto_0

    .line 85
    :cond_2
    iget-object p1, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {p1, v2}, Lorg/apache/commons/net/telnet/TelnetClient;->sendByte(I)V

    const/4 p1, 0x1

    .line 86
    iput-boolean p1, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->lastWasCR:Z

    goto :goto_0

    .line 89
    :cond_3
    iget-boolean v1, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->lastWasCR:Z

    if-nez v1, :cond_4

    .line 90
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, v2}, Lorg/apache/commons/net/telnet/TelnetClient;->sendByte(I)V

    .line 92
    :cond_4
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, p1}, Lorg/apache/commons/net/telnet/TelnetClient;->sendByte(I)V

    .line 93
    iput-boolean v3, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->lastWasCR:Z

    goto :goto_0

    :cond_5
    if-ne p1, v1, :cond_6

    .line 108
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v2, p1}, Lorg/apache/commons/net/telnet/TelnetClient;->sendByte(I)V

    .line 109
    iget-object p1, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {p1, v1}, Lorg/apache/commons/net/telnet/TelnetClient;->sendByte(I)V

    goto :goto_0

    .line 111
    :cond_6
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, p1}, Lorg/apache/commons/net/telnet/TelnetClient;->sendByte(I)V

    .line 113
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public write([B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 127
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/net/telnet/TelnetOutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 144
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetOutputStream;->client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v0

    :goto_0
    add-int/lit8 v1, p3, -0x1

    if-lez p3, :cond_0

    add-int/lit8 p3, p2, 0x1

    .line 147
    :try_start_0
    aget-byte p2, p1, p2

    invoke-virtual {p0, p2}, Lorg/apache/commons/net/telnet/TelnetOutputStream;->write(I)V

    move p2, p3

    move p3, v1

    goto :goto_0

    .line 149
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
