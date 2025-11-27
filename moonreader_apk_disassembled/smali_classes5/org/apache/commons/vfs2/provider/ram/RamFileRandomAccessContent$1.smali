.class Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent$1;
.super Ljava/io/InputStream;
.source "RamFileRandomAccessContent.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;-><init>(Lorg/apache/commons/vfs2/provider/ram/RamFileObject;Lorg/apache/commons/vfs2/util/RandomAccessMode;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;


# direct methods
.method constructor <init>(Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;)V
    .locals 0

    .line 79
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 117
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->access$000(Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;)I

    move-result v0

    return v0
.end method

.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 83
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readByte()B

    move-result v0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    const/4 v0, -0x1

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

    .line 101
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent$1;->read([BII)I

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

    .line 107
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;

    invoke-static {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->access$000(Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;)I

    move-result v0

    if-lez v0, :cond_0

    .line 109
    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 110
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->readFully([BII)V

    return p3

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public skip(J)J
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 91
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent$1;->this$0:Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->getFilePointer()J

    move-result-wide v1

    add-long/2addr v1, p1

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/ram/RamFileRandomAccessContent;->seek(J)V

    return-wide p1
.end method
