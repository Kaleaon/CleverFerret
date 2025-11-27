.class public Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;
.super Lorg/apache/commons/vfs2/provider/AbstractRandomAccessContent;
.source "HdfsRandomAccessContent.java"


# instance fields
.field private final fis:Lorg/apache/hadoop/fs/FSDataInputStream;

.field private final fs:Lorg/apache/hadoop/fs/FileSystem;

.field private final path:Lorg/apache/hadoop/fs/Path;


# direct methods
.method public constructor <init>(Lorg/apache/hadoop/fs/Path;Lorg/apache/hadoop/fs/FileSystem;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 47
    sget-object v0, Lorg/apache/commons/vfs2/util/RandomAccessMode;->READ:Lorg/apache/commons/vfs2/util/RandomAccessMode;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/provider/AbstractRandomAccessContent;-><init>(Lorg/apache/commons/vfs2/util/RandomAccessMode;)V

    .line 48
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fs:Lorg/apache/hadoop/fs/FileSystem;

    .line 49
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->path:Lorg/apache/hadoop/fs/Path;

    .line 50
    invoke-virtual {p2, p1}, Lorg/apache/hadoop/fs/FileSystem;->open(Lorg/apache/hadoop/fs/Path;)Lorg/apache/hadoop/fs/FSDataInputStream;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

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

    .line 58
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FSDataInputStream;->close()V

    return-void
.end method

.method public getFilePointer()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 66
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FSDataInputStream;->getPos()J

    move-result-wide v0

    return-wide v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    return-object v0
.end method

.method public length()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fs:Lorg/apache/hadoop/fs/FileSystem;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->path:Lorg/apache/hadoop/fs/Path;

    invoke-virtual {v0, v1}, Lorg/apache/hadoop/fs/FileSystem;->getFileStatus(Lorg/apache/hadoop/fs/Path;)Lorg/apache/hadoop/fs/FileStatus;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FileStatus;->getLen()J

    move-result-wide v0

    return-wide v0
.end method

.method public readBoolean()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 90
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FSDataInputStream;->readBoolean()Z

    move-result v0

    return v0
.end method

.method public readByte()B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 98
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FSDataInputStream;->readByte()B

    move-result v0

    return v0
.end method

.method public readChar()C
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 106
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FSDataInputStream;->readChar()C

    move-result v0

    return v0
.end method

.method public readDouble()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 114
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FSDataInputStream;->readDouble()D

    move-result-wide v0

    return-wide v0
.end method

.method public readFloat()F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 122
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FSDataInputStream;->readFloat()F

    move-result v0

    return v0
.end method

.method public readFully([B)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 130
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public readFully([BII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 138
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public readInt()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 146
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FSDataInputStream;->readInt()I

    move-result v0

    return v0
.end method

.method public readLine()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 155
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FSDataInputStream;->readLine()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readLong()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 163
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FSDataInputStream;->readLong()J

    move-result-wide v0

    return-wide v0
.end method

.method public readShort()S
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 171
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FSDataInputStream;->readShort()S

    move-result v0

    return v0
.end method

.method public readUTF()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 195
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FSDataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUnsignedByte()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 179
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FSDataInputStream;->readUnsignedByte()I

    move-result v0

    return v0
.end method

.method public readUnsignedShort()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 187
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    invoke-virtual {v0}, Lorg/apache/hadoop/fs/FSDataInputStream;->readUnsignedShort()I

    move-result v0

    return v0
.end method

.method public seek(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 203
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/hdfs/HdfsRandomAccessContent;->fis:Lorg/apache/hadoop/fs/FSDataInputStream;

    invoke-virtual {v0, p1, p2}, Lorg/apache/hadoop/fs/FSDataInputStream;->seek(J)V

    return-void
.end method

.method public setLength(J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 211
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public skipBytes(I)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 219
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method
