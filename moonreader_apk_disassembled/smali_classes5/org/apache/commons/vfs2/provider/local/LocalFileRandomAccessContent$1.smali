.class Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent$1;
.super Ljava/io/InputStream;
.source "LocalFileRandomAccessContent.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;-><init>(Ljava/io/File;Lorg/apache/commons/vfs2/util/RandomAccessMode;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;


# direct methods
.method constructor <init>(Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;)V
    .locals 0

    .line 43
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public available()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 76
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;->access$000(Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;)Ljava/io/RandomAccessFile;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v0

    iget-object v2, p0, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;

    invoke-static {v2}, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;->access$000(Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;)Ljava/io/RandomAccessFile;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x7fffffff

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const v0, 0x7fffffff

    return v0

    :cond_0
    long-to-int v1, v0

    return v1
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 61
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;->access$000(Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;)Ljava/io/RandomAccessFile;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    return-void
.end method

.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 47
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;->access$000(Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;)Ljava/io/RandomAccessFile;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->readByte()B

    move-result v0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    const/4 v0, -0x1

    return v0
.end method

.method public read([B)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 66
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;->access$000(Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;)Ljava/io/RandomAccessFile;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/io/RandomAccessFile;->read([B)I

    move-result p1

    return p1
.end method

.method public read([BII)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 71
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;->access$000(Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;)Ljava/io/RandomAccessFile;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result p1

    return p1
.end method

.method public skip(J)J
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;->access$000(Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;)Ljava/io/RandomAccessFile;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;

    invoke-static {v1}, Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;->access$000(Lorg/apache/commons/vfs2/provider/local/LocalFileRandomAccessContent;)Ljava/io/RandomAccessFile;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v1

    add-long/2addr v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    return-wide p1
.end method
