.class public Lcom/flyersoft/books/chmlib/HHC;
.super Ljava/lang/Object;
.source "HHC.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/books/chmlib/HHC$IndexEntry;,
        Lcom/flyersoft/books/chmlib/HHC$HChapter;
    }
.end annotation


# static fields
.field private static logger:Lcom/flyersoft/books/chmlib/Logger;


# instance fields
.field public hChapters:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/books/chmlib/HHC$HChapter;",
            ">;"
        }
    .end annotation
.end field

.field private hhcIndexHTML:Ljava/lang/String;

.field private indexes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/books/chmlib/HHC$IndexEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 18
    const-string v0, "HHC"

    invoke-static {v0}, Lcom/flyersoft/books/chmlib/Logger;->getLogger(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/Logger;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/HHC;->logger:Lcom/flyersoft/books/chmlib/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/books/chmlib/MyBufferedReader;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    sget-object v0, Lcom/flyersoft/books/chmlib/HHC;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string v1, "***************(1)HHC: start"

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/chmlib/Logger;->logTimeStart(Ljava/lang/String;)V

    .line 31
    iput-object p2, p0, Lcom/flyersoft/books/chmlib/HHC;->hhcIndexHTML:Ljava/lang/String;

    .line 32
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/flyersoft/books/chmlib/HHC;->hChapters:Ljava/util/ArrayList;

    .line 33
    invoke-direct {p0, p1, p3}, Lcom/flyersoft/books/chmlib/HHC;->convert(Lcom/flyersoft/books/chmlib/MyBufferedReader;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/HHC;->indexes:Ljava/util/List;

    .line 34
    sget-object p1, Lcom/flyersoft/books/chmlib/HHC;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string p2, "******************(2)HHC: After convert"

    invoke-virtual {p1, p2}, Lcom/flyersoft/books/chmlib/Logger;->logTime(Ljava/lang/String;)V

    .line 35
    invoke-virtual {p0, p3}, Lcom/flyersoft/books/chmlib/HHC;->writeIndex(Ljava/lang/String;)V

    .line 36
    sget-object p1, Lcom/flyersoft/books/chmlib/HHC;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string p2, "******************(3)HHC: After writeIndex"

    invoke-virtual {p1, p2}, Lcom/flyersoft/books/chmlib/Logger;->logTime(Ljava/lang/String;)V

    return-void
.end method

.method private convert(Lcom/flyersoft/books/chmlib/MyBufferedReader;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/books/chmlib/MyBufferedReader;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/flyersoft/books/chmlib/HHC$IndexEntry;",
            ">;"
        }
    .end annotation

    .line 46
    iget-object p2, p0, Lcom/flyersoft/books/chmlib/HHC;->hhcIndexHTML:Ljava/lang/String;

    invoke-static {p2}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p2

    .line 49
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/HHC;->hChapters:Ljava/util/ArrayList;

    invoke-static {p1, p2, v0}, Lcom/flyersoft/books/chmlib/HHCConverter;->convertToTree(Lcom/flyersoft/books/chmlib/MyBufferedReader;Ljava/io/OutputStream;Ljava/util/ArrayList;)Ljava/util/List;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 51
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    :goto_0
    if-eqz p2, :cond_0

    .line 55
    :try_start_1
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p2

    .line 57
    invoke-static {p2}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    :goto_1
    return-object p1
.end method


# virtual methods
.method public getFileId(Ljava/lang/String;)I
    .locals 2

    .line 106
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 107
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 108
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p1

    const/4 v0, 0x0

    .line 109
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/HHC;->indexes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 110
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/HHC;->indexes:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;

    iget v1, v1, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;->pathHash:I

    if-ne v1, p1, :cond_1

    return v0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, -0x1

    return p1
.end method

.method public getFileNameById(I)Ljava/lang/String;
    .locals 4

    .line 151
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/HHC;->indexes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;

    iget-wide v0, p1, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;->position:J

    .line 152
    new-instance p1, Lcom/flyersoft/books/chmlib/ByteBufferFile;

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/HHC;->hhcIndexHTML:Ljava/lang/String;

    invoke-direct {p1, v2}, Lcom/flyersoft/books/chmlib/ByteBufferFile;-><init>(Ljava/lang/String;)V

    .line 153
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/books/chmlib/ByteBufferFile;->seek(J)V

    const/16 v0, 0x400

    .line 154
    new-array v0, v0, [B

    const/16 v1, 0x3e

    .line 155
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/books/chmlib/ByteBufferFile;->readUntil([BI)I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .line 156
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBufferFile;->close()V

    .line 157
    new-instance p1, Ljava/lang/String;

    const-string v2, "UTF-8"

    const/4 v3, 0x0

    invoke-direct {p1, v0, v3, v1, v2}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 159
    new-instance v0, Lcom/flyersoft/books/chmlib/ChmParseException;

    invoke-direct {v0, p1}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/Exception;)V

    throw v0
.end method

.method public getNextFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 117
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 118
    sget-object v1, Lcom/flyersoft/books/chmlib/HHC;->logger:Lcom/flyersoft/books/chmlib/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "getNextFile: Start: hash="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ";path="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/flyersoft/books/chmlib/Logger;->logTimeStart(Ljava/lang/String;)V

    .line 119
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/HHC;->getFileId(Ljava/lang/String;)I

    move-result p1

    if-gez p1, :cond_0

    const/4 p1, 0x0

    .line 122
    :cond_0
    sget-object v1, Lcom/flyersoft/books/chmlib/HHC;->logger:Lcom/flyersoft/books/chmlib/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "getNextFile: after getID: currentId="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/flyersoft/books/chmlib/Logger;->logTime(Ljava/lang/String;)V

    move v1, p1

    .line 123
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/books/chmlib/HHC;->indexes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 124
    iget-object v2, p0, Lcom/flyersoft/books/chmlib/HHC;->indexes:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;

    iget v2, v2, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;->pathHash:I

    if-eqz v2, :cond_1

    if-eq v2, v0, :cond_1

    if-eq v1, p1, :cond_1

    .line 126
    sget-object p1, Lcom/flyersoft/books/chmlib/HHC;->logger:Lcom/flyersoft/books/chmlib/Logger;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "getNextFile: done, id="

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/Logger;->logTime(Ljava/lang/String;)V

    .line 127
    invoke-virtual {p0, v1}, Lcom/flyersoft/books/chmlib/HHC;->getFileNameById(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 130
    :cond_2
    sget-object p1, Lcom/flyersoft/books/chmlib/HHC;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string v0, "getNextFile: done, return null"

    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/Logger;->logTime(Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public getPreviousFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 136
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 137
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/HHC;->getFileId(Ljava/lang/String;)I

    move-result p1

    if-gez p1, :cond_0

    const/4 p1, 0x0

    :cond_0
    move v1, p1

    :goto_0
    if-ltz v1, :cond_2

    .line 141
    iget-object v2, p0, Lcom/flyersoft/books/chmlib/HHC;->indexes:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;

    iget v2, v2, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;->pathHash:I

    if-eqz v2, :cond_1

    if-eq v2, v0, :cond_1

    if-eq v1, p1, :cond_1

    .line 143
    invoke-virtual {p0, v1}, Lcom/flyersoft/books/chmlib/HHC;->getFileNameById(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public readIndex(Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    sget-object v0, Lcom/flyersoft/books/chmlib/HHC;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string v1, "readIndex: start"

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/chmlib/Logger;->logTimeStart(Ljava/lang/String;)V

    .line 65
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 66
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    long-to-int p1, v1

    div-int/lit8 p1, p1, 0x8

    .line 67
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lcom/flyersoft/books/chmlib/HHC;->indexes:Ljava/util/List;

    .line 68
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 69
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 70
    new-instance v2, Ljava/io/DataInputStream;

    invoke-direct {v2, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    .line 72
    new-instance v3, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;

    invoke-direct {v3}, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;-><init>()V

    .line 73
    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    iput v4, v3, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;->pathHash:I

    .line 74
    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    int-to-long v4, v4

    iput-wide v4, v3, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;->position:J

    .line 75
    iget-object v4, p0, Lcom/flyersoft/books/chmlib/HHC;->indexes:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 77
    :cond_0
    sget-object p1, Lcom/flyersoft/books/chmlib/HHC;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string v0, "readIndex: end"

    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/Logger;->logTime(Ljava/lang/String;)V

    .line 78
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    return-void
.end method

.method public writeIndex(Ljava/lang/String;)V
    .locals 4

    .line 83
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p1

    .line 85
    :try_start_0
    new-instance v0, Ljava/io/BufferedOutputStream;

    invoke-direct {v0, p1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 86
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 87
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/HHC;->indexes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;

    .line 88
    iget v3, v2, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;->pathHash:I

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 89
    iget-wide v2, v2, Lcom/flyersoft/books/chmlib/HHC$IndexEntry;->position:J

    long-to-int v3, v2

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 93
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_1
    if-eqz p1, :cond_1

    .line 97
    :try_start_1
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception p1

    .line 99
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 101
    :cond_1
    :goto_2
    sget-object p1, Lcom/flyersoft/books/chmlib/HHC;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string v0, "writeIndex: after close"

    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/Logger;->logTime(Ljava/lang/String;)V

    return-void
.end method
