.class public Lcom/github/junrar/io/ReadOnlyAccessInputStream;
.super Ljava/io/InputStream;
.source "ReadOnlyAccessInputStream.java"


# instance fields
.field private curPos:J

.field private final endPos:J

.field private file:Lcom/github/junrar/io/IReadOnlyAccess;


# direct methods
.method public constructor <init>(Lcom/github/junrar/io/IReadOnlyAccess;JJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 38
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/github/junrar/io/ReadOnlyAccessInputStream;->file:Lcom/github/junrar/io/IReadOnlyAccess;

    .line 40
    iput-wide p2, p0, Lcom/github/junrar/io/ReadOnlyAccessInputStream;->curPos:J

    .line 41
    iput-wide p4, p0, Lcom/github/junrar/io/ReadOnlyAccessInputStream;->endPos:J

    .line 42
    invoke-interface {p1, p2, p3}, Lcom/github/junrar/io/IReadOnlyAccess;->setPosition(J)V

    return-void
.end method


# virtual methods
.method public read()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 47
    iget-wide v0, p0, Lcom/github/junrar/io/ReadOnlyAccessInputStream;->curPos:J

    iget-wide v2, p0, Lcom/github/junrar/io/ReadOnlyAccessInputStream;->endPos:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, -0x1

    return v0

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/github/junrar/io/ReadOnlyAccessInputStream;->file:Lcom/github/junrar/io/IReadOnlyAccess;

    invoke-interface {v0}, Lcom/github/junrar/io/IReadOnlyAccess;->read()I

    move-result v0

    .line 51
    iget-wide v1, p0, Lcom/github/junrar/io/ReadOnlyAccessInputStream;->curPos:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/github/junrar/io/ReadOnlyAccessInputStream;->curPos:J

    return v0
.end method

.method public read([B)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 72
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/github/junrar/io/ReadOnlyAccessInputStream;->read([BII)I

    move-result p1

    return p1
.end method

.method public read([BII)I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p3, :cond_0

    const/4 p1, 0x0

    return p1

    .line 61
    :cond_0
    iget-wide v0, p0, Lcom/github/junrar/io/ReadOnlyAccessInputStream;->curPos:J

    iget-wide v2, p0, Lcom/github/junrar/io/ReadOnlyAccessInputStream;->endPos:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    const/4 p1, -0x1

    return p1

    .line 64
    :cond_1
    iget-object v4, p0, Lcom/github/junrar/io/ReadOnlyAccessInputStream;->file:Lcom/github/junrar/io/IReadOnlyAccess;

    int-to-long v5, p3

    sub-long/2addr v2, v0

    .line 65
    invoke-static {v5, v6, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int p3, v0

    .line 64
    invoke-interface {v4, p1, p2, p3}, Lcom/github/junrar/io/IReadOnlyAccess;->read([BII)I

    move-result p1

    .line 66
    iget-wide p2, p0, Lcom/github/junrar/io/ReadOnlyAccessInputStream;->curPos:J

    int-to-long v0, p1

    add-long/2addr p2, v0

    iput-wide p2, p0, Lcom/github/junrar/io/ReadOnlyAccessInputStream;->curPos:J

    return p1
.end method
