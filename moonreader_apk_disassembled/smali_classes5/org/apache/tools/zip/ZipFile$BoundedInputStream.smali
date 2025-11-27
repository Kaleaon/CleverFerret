.class Lorg/apache/tools/zip/ZipFile$BoundedInputStream;
.super Ljava/io/InputStream;
.source "ZipFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/zip/ZipFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BoundedInputStream"
.end annotation


# instance fields
.field private addDummyByte:Z

.field private loc:J

.field private remaining:J

.field private final synthetic this$0:Lorg/apache/tools/zip/ZipFile;


# direct methods
.method constructor <init>(Lorg/apache/tools/zip/ZipFile;JJ)V
    .locals 0

    .line 500
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    iput-object p1, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/tools/zip/ZipFile;

    const/4 p1, 0x0

    .line 498
    iput-boolean p1, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    .line 501
    iput-wide p4, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->remaining:J

    .line 502
    iput-wide p2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->loc:J

    return-void
.end method


# virtual methods
.method addDummy()V
    .locals 1

    const/4 v0, 0x1

    .line 553
    iput-boolean v0, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    return-void
.end method

.method public read()I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 506
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->remaining:J

    const-wide/16 v2, 0x1

    sub-long v4, v0, v2

    iput-wide v4, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->remaining:J

    const-wide/16 v4, 0x0

    cmp-long v6, v0, v4

    if-gtz v6, :cond_1

    .line 507
    iget-boolean v0, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 508
    iput-boolean v0, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    return v0

    :cond_0
    const/4 v0, -0x1

    return v0

    .line 513
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/tools/zip/ZipFile;

    invoke-static {v0}, Lorg/apache/tools/zip/ZipFile;->access$000(Lorg/apache/tools/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v0

    monitor-enter v0

    .line 514
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/tools/zip/ZipFile;

    invoke-static {v1}, Lorg/apache/tools/zip/ZipFile;->access$000(Lorg/apache/tools/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v1

    iget-wide v4, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->loc:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->loc:J

    invoke-virtual {v1, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 515
    iget-object v1, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/tools/zip/ZipFile;

    invoke-static {v1}, Lorg/apache/tools/zip/ZipFile;->access$000(Lorg/apache/tools/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->read()I

    move-result v1

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 516
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public read([BII)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 520
    iget-wide v0, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->remaining:J

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    cmp-long v5, v0, v2

    if-gtz v5, :cond_1

    .line 521
    iget-boolean p3, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    if-eqz p3, :cond_0

    .line 522
    iput-boolean v4, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    .line 523
    aput-byte v4, p1, p2

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1

    :cond_1
    if-gtz p3, :cond_2

    return v4

    :cond_2
    int-to-long v2, p3

    cmp-long v4, v2, v0

    if-lez v4, :cond_3

    long-to-int p3, v0

    .line 537
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/tools/zip/ZipFile;

    invoke-static {v0}, Lorg/apache/tools/zip/ZipFile;->access$000(Lorg/apache/tools/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v0

    monitor-enter v0

    .line 538
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/tools/zip/ZipFile;

    invoke-static {v1}, Lorg/apache/tools/zip/ZipFile;->access$000(Lorg/apache/tools/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v1

    iget-wide v2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->loc:J

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 539
    iget-object v1, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/tools/zip/ZipFile;

    invoke-static {v1}, Lorg/apache/tools/zip/ZipFile;->access$000(Lorg/apache/tools/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v1

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result p1

    .line 540
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lez p1, :cond_4

    .line 542
    iget-wide p2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->loc:J

    int-to-long v0, p1

    add-long/2addr p2, v0

    iput-wide p2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->loc:J

    .line 543
    iget-wide p2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->remaining:J

    sub-long/2addr p2, v0

    iput-wide p2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->remaining:J

    :cond_4
    return p1

    :catchall_0
    move-exception p1

    .line 540
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
