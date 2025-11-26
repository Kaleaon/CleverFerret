.class public final Lorg/apache/commons/net/io/DotTerminatedMessageReader;
.super Ljava/io/BufferedReader;
.source "DotTerminatedMessageReader.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# static fields
.field private static final CR:C = '\r'

.field private static final DOT:I = 0x2e

.field private static final LF:C = '\n'


# instance fields
.field private atBeginning:Z

.field private eof:Z

.field private seenCR:Z


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .locals 0

    .line 56
    invoke-direct {p0, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    const/4 p1, 0x1

    .line 58
    iput-boolean p1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->atBeginning:Z

    const/4 p1, 0x0

    .line 59
    iput-boolean p1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->eof:Z

    return-void
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 209
    iget-object v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 211
    :try_start_0
    iget-boolean v1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->eof:Z

    if-nez v1, :cond_0

    .line 213
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->read()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    .line 218
    iput-boolean v1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->eof:Z

    const/4 v1, 0x0

    .line 219
    iput-boolean v1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->atBeginning:Z

    .line 220
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public read()I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 76
    iget-object v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 77
    :try_start_0
    iget-boolean v1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->eof:Z

    const/4 v2, -0x1

    if-eqz v1, :cond_0

    .line 78
    monitor-exit v0

    return v2

    .line 80
    :cond_0
    invoke-super {p0}, Ljava/io/BufferedReader;->read()I

    move-result v1

    const/4 v3, 0x1

    if-ne v1, v2, :cond_1

    .line 82
    iput-boolean v3, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->eof:Z

    .line 83
    monitor-exit v0

    return v2

    .line 85
    :cond_1
    iget-boolean v4, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->atBeginning:Z

    const/16 v5, 0xa

    const/16 v6, 0xd

    const/4 v7, 0x0

    if-eqz v4, :cond_6

    .line 86
    iput-boolean v7, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->atBeginning:Z

    const/16 v4, 0x2e

    if-ne v1, v4, :cond_6

    const/4 v1, 0x2

    .line 88
    invoke-virtual {p0, v1}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->mark(I)V

    .line 89
    invoke-super {p0}, Ljava/io/BufferedReader;->read()I

    move-result v1

    if-ne v1, v2, :cond_2

    .line 92
    iput-boolean v3, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->eof:Z

    .line 93
    monitor-exit v0

    return v4

    :cond_2
    if-ne v1, v4, :cond_3

    .line 97
    monitor-exit v0

    return v1

    :cond_3
    if-ne v1, v6, :cond_5

    .line 100
    invoke-super {p0}, Ljava/io/BufferedReader;->read()I

    move-result v1

    if-ne v1, v2, :cond_4

    .line 103
    invoke-virtual {p0}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->reset()V

    .line 104
    monitor-exit v0

    return v4

    :cond_4
    if-ne v1, v5, :cond_5

    .line 107
    iput-boolean v3, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->atBeginning:Z

    .line 108
    iput-boolean v3, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->eof:Z

    .line 110
    monitor-exit v0

    return v2

    .line 115
    :cond_5
    invoke-virtual {p0}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->reset()V

    .line 116
    monitor-exit v0

    return v4

    .line 121
    :cond_6
    iget-boolean v2, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->seenCR:Z

    if-eqz v2, :cond_7

    .line 122
    iput-boolean v7, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->seenCR:Z

    if-ne v1, v5, :cond_7

    .line 124
    iput-boolean v3, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->atBeginning:Z

    :cond_7
    if-ne v1, v6, :cond_8

    .line 128
    iput-boolean v3, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->seenCR:Z

    .line 130
    :cond_8
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 131
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public read([C)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 148
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->read([CII)I

    move-result p1

    return p1
.end method

.method public read([CII)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    if-ge p3, v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 173
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 175
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->read()I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 177
    monitor-exit v0

    return v2

    :cond_1
    move v3, p2

    :goto_0
    add-int/lit8 v4, v3, 0x1

    int-to-char v1, v1

    .line 184
    aput-char v1, p1, v3

    add-int/2addr p3, v2

    if-lez p3, :cond_3

    .line 186
    invoke-virtual {p0}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->read()I

    move-result v1

    if-ne v1, v2, :cond_2

    goto :goto_1

    :cond_2
    move v3, v4

    goto :goto_0

    :cond_3
    :goto_1
    sub-int/2addr v4, p2

    .line 188
    monitor-exit v0

    return v4

    :catchall_0
    move-exception p1

    .line 189
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public readLine()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 231
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 233
    iget-object v1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 234
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->read()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    .line 236
    iget-boolean v3, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->atBeginning:Z

    if-eqz v3, :cond_0

    .line 237
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v0

    monitor-exit v1

    return-object v0

    :cond_0
    int-to-char v2, v2

    .line 239
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 241
    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 242
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 243
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x0

    :cond_2
    return-object v0

    :catchall_0
    move-exception v0

    .line 241
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
