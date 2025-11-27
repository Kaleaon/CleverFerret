.class public final Lcom/dropbox/core/NoThrowInputStream;
.super Ljava/io/InputStream;
.source "NoThrowInputStream.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/NoThrowInputStream$HiddenException;
    }
.end annotation


# instance fields
.field private bytesRead:J

.field private final underlying:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2

    .line 27
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const-wide/16 v0, 0x0

    .line 25
    iput-wide v0, p0, Lcom/dropbox/core/NoThrowInputStream;->bytesRead:J

    .line 28
    iput-object p1, p0, Lcom/dropbox/core/NoThrowInputStream;->underlying:Ljava/io/InputStream;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 33
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "don\'t call close()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBytesRead()J
    .locals 2

    .line 83
    iget-wide v0, p0, Lcom/dropbox/core/NoThrowInputStream;->bytesRead:J

    return-wide v0
.end method

.method public read()I
    .locals 4

    .line 39
    :try_start_0
    iget-wide v0, p0, Lcom/dropbox/core/NoThrowInputStream;->bytesRead:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/dropbox/core/NoThrowInputStream;->bytesRead:J

    .line 40
    iget-object v0, p0, Lcom/dropbox/core/NoThrowInputStream;->underlying:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    .line 42
    new-instance v1, Lcom/dropbox/core/NoThrowInputStream$HiddenException;

    invoke-direct {v1, v0}, Lcom/dropbox/core/NoThrowInputStream$HiddenException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public read([B)I
    .locals 4

    .line 61
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/NoThrowInputStream;->underlying:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->read([B)I

    move-result p1

    .line 62
    iget-wide v0, p0, Lcom/dropbox/core/NoThrowInputStream;->bytesRead:J

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/dropbox/core/NoThrowInputStream;->bytesRead:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 65
    new-instance v0, Lcom/dropbox/core/NoThrowInputStream$HiddenException;

    invoke-direct {v0, p1}, Lcom/dropbox/core/NoThrowInputStream$HiddenException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method

.method public read([BII)I
    .locals 2

    .line 49
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/NoThrowInputStream;->underlying:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result p1

    .line 50
    iget-wide p2, p0, Lcom/dropbox/core/NoThrowInputStream;->bytesRead:J

    int-to-long v0, p1

    add-long/2addr p2, v0

    iput-wide p2, p0, Lcom/dropbox/core/NoThrowInputStream;->bytesRead:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 54
    new-instance p2, Lcom/dropbox/core/NoThrowInputStream$HiddenException;

    invoke-direct {p2, p1}, Lcom/dropbox/core/NoThrowInputStream$HiddenException;-><init>(Ljava/io/IOException;)V

    throw p2
.end method
