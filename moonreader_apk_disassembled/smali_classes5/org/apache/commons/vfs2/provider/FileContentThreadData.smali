.class Lorg/apache/commons/vfs2/provider/FileContentThreadData;
.super Ljava/lang/Object;
.source "FileContentThreadData.java"


# instance fields
.field private final inputStreamList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation
.end field

.field private outputStream:Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;

.field private final randomAccessContentList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/apache/commons/vfs2/RandomAccessContent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->inputStreamList:Ljava/util/ArrayList;

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->randomAccessContentList:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method addInstr(Ljava/io/InputStream;)V
    .locals 1

    .line 45
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->inputStreamList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method addRastr(Lorg/apache/commons/vfs2/RandomAccessContent;)V
    .locals 1

    .line 57
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->randomAccessContentList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public closeOutstr()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 85
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->outputStream:Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;->close()V

    const/4 v0, 0x0

    .line 86
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->outputStream:Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;

    return-void
.end method

.method getInstrsSize()I
    .locals 1

    .line 61
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->inputStreamList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method getOutstr()Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;
    .locals 1

    .line 53
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->outputStream:Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;

    return-object v0
.end method

.method getRastrsSize()I
    .locals 1

    .line 90
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->randomAccessContentList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public hasStreams()Z
    .locals 1

    .line 81
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->inputStreamList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_1

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->outputStream:Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->randomAccessContentList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public removeInstr(I)Ljava/lang/Object;
    .locals 1

    .line 65
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->inputStreamList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public removeInstr(Ljava/io/InputStream;)V
    .locals 1

    .line 69
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->inputStreamList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public removeRastr(I)Ljava/lang/Object;
    .locals 1

    .line 73
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->randomAccessContentList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public removeRastr(Lorg/apache/commons/vfs2/RandomAccessContent;)V
    .locals 1

    .line 77
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->randomAccessContentList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method setOutstr(Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/FileContentThreadData;->outputStream:Lorg/apache/commons/vfs2/provider/DefaultFileContent$FileContentOutputStream;

    return-void
.end method
