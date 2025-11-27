.class public Lcom/flyersoft/books/chmlib/ChmDocument;
.super Ljava/lang/Object;
.source "ChmDocument.java"


# static fields
.field public static final BLOCK_CACHE_SIZE:I = 0x3

.field public static final FILE_INDEX_CACHE_SIZE:I = 0xa

.field public static final FN_COMPRESSED_CONTENT:Ljava/lang/String; = "::DataSpace/Storage/MSCompressed/Content"

.field public static final FN_CONTROL_DATA:Ljava/lang/String; = "::DataSpace/Storage/MSCompressed/ControlData"

.field public static final FN_RESET_TABLE:Ljava/lang/String; = "::DataSpace/Storage/MSCompressed/Transform/{7FC28940-9D31-11D0-9B27-00A0C91E9C7C}/InstanceData/ResetTable"

.field public static final FN_SPAN_INFO:Ljava/lang/String; = "::DataSpace/Storage/MSCompressed/SpanInfo"

.field public static final FN_STRING:Ljava/lang/String; = "/#STRINGS"

.field public static final FN_SYSTEM:Ljava/lang/String; = "/#SYSTEM"

.field public static final FN_WINDOWS:Ljava/lang/String; = "/#WINDOWS"

.field private static logger:Lcom/flyersoft/books/chmlib/Logger;


# instance fields
.field private bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

.field private blockCache:Lcom/flyersoft/books/chmlib/ChmUtil$Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flyersoft/books/chmlib/ChmUtil$Cache<",
            "Ljava/lang/Integer;",
            "[B>;"
        }
    .end annotation
.end field

.field public chmFileName:Ljava/lang/String;

.field public chunkListingCache:Lcom/flyersoft/books/chmlib/ChmUtil$Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flyersoft/books/chmlib/ChmUtil$Cache<",
            "Ljava/lang/Integer;",
            "Lcom/flyersoft/books/chmlib/ChunkListing;",
            ">;"
        }
    .end annotation
.end field

.field public fileSystem:Lcom/flyersoft/books/chmlib/FileSystem;

.field public fileWindows:Lcom/flyersoft/books/chmlib/FileWindows;

.field public fnEntry:Lcom/flyersoft/books/chmlib/DirectoryEntry;

.field public headerITSF:Lcom/flyersoft/books/chmlib/HeaderITSF;

.field public headerITSP:Lcom/flyersoft/books/chmlib/HeaderITSP;

.field public hhcFileName:Ljava/lang/String;

.field public hhkFileName:Ljava/lang/String;

.field public homePage:Ljava/lang/String;

.field public lzxControlData:Lcom/flyersoft/books/chmlib/FileControlData;

.field public lzxResetTable:Lcom/flyersoft/books/chmlib/FileResetTable;

.field triedHHC:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 16
    const-string v0, "ChmDocument"

    invoke-static {v0}, Lcom/flyersoft/books/chmlib/Logger;->getLogger(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/Logger;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/books/chmlib/ChmDocument;->logger:Lcom/flyersoft/books/chmlib/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 5

    .line 61
    const-string v0, "::DataSpace/Storage/MSCompressed/Transform/{7FC28940-9D31-11D0-9B27-00A0C91E9C7C}/InstanceData/ResetTable"

    .line 0
    const-string v1, "homePage:"

    const-string v2, "ChmDocument start: fileName: "

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v3, Lcom/flyersoft/books/chmlib/ChmUtil$Cache;

    const/4 v4, 0x3

    invoke-direct {v3, v4}, Lcom/flyersoft/books/chmlib/ChmUtil$Cache;-><init>(I)V

    iput-object v3, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->blockCache:Lcom/flyersoft/books/chmlib/ChmUtil$Cache;

    .line 54
    new-instance v3, Lcom/flyersoft/books/chmlib/ChmUtil$Cache;

    const/16 v4, 0xa

    invoke-direct {v3, v4}, Lcom/flyersoft/books/chmlib/ChmUtil$Cache;-><init>(I)V

    iput-object v3, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->chunkListingCache:Lcom/flyersoft/books/chmlib/ChmUtil$Cache;

    .line 63
    :try_start_0
    sget-object v3, Lcom/flyersoft/books/chmlib/ChmDocument;->logger:Lcom/flyersoft/books/chmlib/Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/flyersoft/books/chmlib/Logger;->logTimeStart(Ljava/lang/String;)V

    .line 64
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 65
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->chmFileName:Ljava/lang/String;

    .line 66
    new-instance p1, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->chmFileName:Ljava/lang/String;

    invoke-direct {p1, v2}, Lcom/flyersoft/books/chmlib/ByteBufferFileCache;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    .line 69
    new-instance p1, Lcom/flyersoft/books/chmlib/HeaderITSF;

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-direct {p1, v2}, Lcom/flyersoft/books/chmlib/HeaderITSF;-><init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->headerITSF:Lcom/flyersoft/books/chmlib/HeaderITSF;

    .line 72
    sget-object p1, Lcom/flyersoft/books/chmlib/ChmDocument;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string v2, "header Readed"

    invoke-virtual {p1, v2}, Lcom/flyersoft/books/chmlib/Logger;->logTime(Ljava/lang/String;)V

    .line 75
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->headerITSF:Lcom/flyersoft/books/chmlib/HeaderITSF;

    iget-wide v2, v2, Lcom/flyersoft/books/chmlib/HeaderITSF;->offsetDirectorySection:J

    invoke-virtual {p1, v2, v3}, Lcom/flyersoft/books/chmlib/ByteBuffer;->seekAbsolute(J)V

    .line 76
    new-instance p1, Lcom/flyersoft/books/chmlib/HeaderITSP;

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-direct {p1, v2}, Lcom/flyersoft/books/chmlib/HeaderITSP;-><init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->headerITSP:Lcom/flyersoft/books/chmlib/HeaderITSP;

    .line 78
    const-string p1, "::DataSpace/Storage/MSCompressed/ControlData"

    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/ChmDocument;->getRawData(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/ByteBuffer;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 80
    new-instance v2, Lcom/flyersoft/books/chmlib/FileControlData;

    invoke-direct {v2, p1}, Lcom/flyersoft/books/chmlib/FileControlData;-><init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V

    iput-object v2, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->lzxControlData:Lcom/flyersoft/books/chmlib/FileControlData;

    .line 81
    sget-object p1, Lcom/flyersoft/books/chmlib/ChmDocument;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string v2, "control data Readed"

    invoke-virtual {p1, v2}, Lcom/flyersoft/books/chmlib/Logger;->logTime(Ljava/lang/String;)V

    .line 84
    :cond_0
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/ChmDocument;->getRawData(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/ByteBuffer;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 86
    new-instance p1, Lcom/flyersoft/books/chmlib/FileResetTable;

    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/ChmDocument;->getRawData(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/ByteBuffer;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/flyersoft/books/chmlib/FileResetTable;-><init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->lzxResetTable:Lcom/flyersoft/books/chmlib/FileResetTable;

    .line 87
    sget-object p1, Lcom/flyersoft/books/chmlib/ChmDocument;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string v0, "reset table Readed"

    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/Logger;->logTime(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 92
    :cond_1
    :try_start_1
    const-string p1, "/#WINDOWS"

    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/ChmDocument;->getFileData(Ljava/lang/String;)[B

    move-result-object p1

    if-eqz p1, :cond_2

    .line 94
    new-instance v0, Lcom/flyersoft/books/chmlib/FileWindows;

    invoke-direct {v0, p1}, Lcom/flyersoft/books/chmlib/FileWindows;-><init>([B)V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->fileWindows:Lcom/flyersoft/books/chmlib/FileWindows;

    .line 95
    const-string p1, "/#STRINGS"

    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/ChmDocument;->getDirectoryEntry(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/DirectoryEntry;

    move-result-object p1

    .line 96
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->fileWindows:Lcom/flyersoft/books/chmlib/FileWindows;

    iget-object v0, v0, Lcom/flyersoft/books/chmlib/FileWindows;->entries:[Lcom/flyersoft/books/chmlib/FileWindows$Entry;

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->fileWindows:Lcom/flyersoft/books/chmlib/FileWindows;

    iget-object v2, v2, Lcom/flyersoft/books/chmlib/FileWindows;->entries:[Lcom/flyersoft/books/chmlib/FileWindows$Entry;

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    aget-object v0, v0, v2

    .line 97
    iget v2, v0, Lcom/flyersoft/books/chmlib/FileWindows$Entry;->offHome:I

    const/16 v3, 0x400

    invoke-virtual {p0, p1, v2, v3}, Lcom/flyersoft/books/chmlib/ChmDocument;->getFileData(Lcom/flyersoft/books/chmlib/DirectoryEntry;II)[B

    move-result-object v2

    .line 98
    new-instance v4, Lcom/flyersoft/books/chmlib/ByteBufferArray;

    invoke-direct {v4, v2}, Lcom/flyersoft/books/chmlib/ByteBufferArray;-><init>([B)V

    invoke-virtual {v4}, Lcom/flyersoft/books/chmlib/ByteBufferArray;->readStringNT()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->homePage:Ljava/lang/String;

    .line 99
    iget v2, v0, Lcom/flyersoft/books/chmlib/FileWindows$Entry;->offHHC:I

    invoke-virtual {p0, p1, v2, v3}, Lcom/flyersoft/books/chmlib/ChmDocument;->getFileData(Lcom/flyersoft/books/chmlib/DirectoryEntry;II)[B

    move-result-object v2

    .line 100
    new-instance v4, Lcom/flyersoft/books/chmlib/ByteBufferArray;

    invoke-direct {v4, v2}, Lcom/flyersoft/books/chmlib/ByteBufferArray;-><init>([B)V

    invoke-virtual {v4}, Lcom/flyersoft/books/chmlib/ByteBufferArray;->readStringNT()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->hhcFileName:Ljava/lang/String;

    .line 101
    iget v0, v0, Lcom/flyersoft/books/chmlib/FileWindows$Entry;->offHHK:I

    invoke-virtual {p0, p1, v0, v3}, Lcom/flyersoft/books/chmlib/ChmDocument;->getFileData(Lcom/flyersoft/books/chmlib/DirectoryEntry;II)[B

    move-result-object p1

    .line 102
    new-instance v0, Lcom/flyersoft/books/chmlib/ByteBufferArray;

    invoke-direct {v0, p1}, Lcom/flyersoft/books/chmlib/ByteBufferArray;-><init>([B)V

    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/ByteBufferArray;->readStringNT()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->hhkFileName:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 106
    :catch_0
    :try_start_2
    sget-object p1, Lcom/flyersoft/books/chmlib/ChmDocument;->logger:Lcom/flyersoft/books/chmlib/Logger;

    const-string v0, ":::::::::::::::::::::Error::LZXCoder.decompressBlock():::::::::::::::::::::::"

    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/Logger;->log(Ljava/lang/String;)V

    .line 110
    :cond_2
    :goto_0
    const-string p1, "/#SYSTEM"

    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/ChmDocument;->getFileData(Ljava/lang/String;)[B

    move-result-object p1

    if-eqz p1, :cond_8

    .line 112
    new-instance v0, Lcom/flyersoft/books/chmlib/FileSystem;

    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ChmDocument;->getCharset()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p1, v2}, Lcom/flyersoft/books/chmlib/FileSystem;-><init>([BLjava/lang/String;)V

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->fileSystem:Lcom/flyersoft/books/chmlib/FileSystem;

    .line 113
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->homePage:Ljava/lang/String;

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-nez p1, :cond_4

    :cond_3
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->fileSystem:Lcom/flyersoft/books/chmlib/FileSystem;

    iget-object p1, p1, Lcom/flyersoft/books/chmlib/FileSystem;->defaultTopic:Ljava/lang/String;

    if-eqz p1, :cond_4

    .line 114
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->fileSystem:Lcom/flyersoft/books/chmlib/FileSystem;

    iget-object p1, p1, Lcom/flyersoft/books/chmlib/FileSystem;->defaultTopic:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->homePage:Ljava/lang/String;

    .line 115
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->hhcFileName:Ljava/lang/String;

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-nez p1, :cond_6

    :cond_5
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->fileSystem:Lcom/flyersoft/books/chmlib/FileSystem;

    iget-object p1, p1, Lcom/flyersoft/books/chmlib/FileSystem;->contentFile:Ljava/lang/String;

    if-eqz p1, :cond_6

    .line 116
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->fileSystem:Lcom/flyersoft/books/chmlib/FileSystem;

    iget-object p1, p1, Lcom/flyersoft/books/chmlib/FileSystem;->contentFile:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->hhcFileName:Ljava/lang/String;

    .line 117
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->hhkFileName:Ljava/lang/String;

    if-eqz p1, :cond_7

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-nez p1, :cond_8

    :cond_7
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->fileSystem:Lcom/flyersoft/books/chmlib/FileSystem;

    iget-object p1, p1, Lcom/flyersoft/books/chmlib/FileSystem;->indexFile:Ljava/lang/String;

    if-eqz p1, :cond_8

    .line 118
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->fileSystem:Lcom/flyersoft/books/chmlib/FileSystem;

    iget-object p1, p1, Lcom/flyersoft/books/chmlib/FileSystem;->indexFile:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->hhkFileName:Ljava/lang/String;

    .line 122
    :cond_8
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->hhcFileName:Ljava/lang/String;

    if-eqz p1, :cond_a

    const-string v0, ".html"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_9

    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->hhcFileName:Ljava/lang/String;

    const-string v0, ".htm"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_a

    .line 123
    :cond_9
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->hhcFileName:Ljava/lang/String;

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->homePage:Ljava/lang/String;

    const/4 p1, 0x0

    .line 124
    iput-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->hhcFileName:Ljava/lang/String;

    .line 127
    :cond_a
    sget-object p1, Lcom/flyersoft/books/chmlib/ChmDocument;->logger:Lcom/flyersoft/books/chmlib/Logger;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->homePage:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/books/chmlib/ChmUtil;->dumpUTF16(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/Logger;->log(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    return-void

    :catch_1
    move-exception p1

    .line 130
    new-instance v0, Lcom/flyersoft/books/chmlib/ChmParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error parsing CHM:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->chmFileName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v0
.end method

.method private getChunkListing(I)Lcom/flyersoft/books/chmlib/ChunkListing;
    .locals 3

    .line 140
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->chunkListingCache:Lcom/flyersoft/books/chmlib/ChmUtil$Cache;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/chmlib/ChmUtil$Cache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/chmlib/ChunkListing;

    if-eqz v0, :cond_0

    return-object v0

    .line 144
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-direct {p0, p1}, Lcom/flyersoft/books/chmlib/ChmDocument;->getChunkOffset(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/books/chmlib/ByteBuffer;->seekAbsolute(J)V

    .line 145
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->headerITSP:Lcom/flyersoft/books/chmlib/HeaderITSP;

    iget v1, v1, Lcom/flyersoft/books/chmlib/HeaderITSP;->dirChunkSize:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/books/chmlib/ByteBuffer;->resetSize(J)V

    .line 147
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    sget-object v1, Lcom/flyersoft/books/chmlib/ChunkPMGI;->TAG:[B

    array-length v1, v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes(I)[B

    move-result-object v0

    .line 148
    sget-object v1, Lcom/flyersoft/books/chmlib/ChunkPMGI;->TAG:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 149
    new-instance v0, Lcom/flyersoft/books/chmlib/ChunkPMGI;

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-direct {v0, v1}, Lcom/flyersoft/books/chmlib/ChunkPMGI;-><init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V

    goto :goto_0

    .line 150
    :cond_1
    sget-object v1, Lcom/flyersoft/books/chmlib/ChunkPMGL;->TAG:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 151
    new-instance v0, Lcom/flyersoft/books/chmlib/ChunkPMGL;

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-direct {v0, v1}, Lcom/flyersoft/books/chmlib/ChunkPMGL;-><init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V

    .line 155
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->chunkListingCache:Lcom/flyersoft/books/chmlib/ChmUtil$Cache;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Lcom/flyersoft/books/chmlib/ChmUtil$Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    .line 153
    :cond_2
    new-instance p1, Lcom/flyersoft/books/chmlib/ChmParseException;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    const-string v0, "Error parsing index, Unknown tag: "

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private getChunkOffset(I)J
    .locals 4

    .line 135
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->headerITSF:Lcom/flyersoft/books/chmlib/HeaderITSF;

    iget-wide v0, v0, Lcom/flyersoft/books/chmlib/HeaderITSF;->offsetDirectorySection:J

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->headerITSP:Lcom/flyersoft/books/chmlib/HeaderITSP;

    iget v2, v2, Lcom/flyersoft/books/chmlib/HeaderITSP;->headLength:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->headerITSP:Lcom/flyersoft/books/chmlib/HeaderITSP;

    iget v2, v2, Lcom/flyersoft/books/chmlib/HeaderITSP;->dirChunkSize:I

    mul-int p1, p1, v2

    int-to-long v2, p1

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public static log(Ljava/lang/String;)V
    .locals 1

    .line 469
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 474
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->close()V

    return-void
.end method

.method public decompressRegion(IILjava/io/OutputStream;)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 291
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->lzxControlData:Lcom/flyersoft/books/chmlib/FileControlData;

    iget v0, v0, Lcom/flyersoft/books/chmlib/FileControlData;->lzxResetInterval:I

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->lzxResetTable:Lcom/flyersoft/books/chmlib/FileResetTable;

    iget-wide v1, v1, Lcom/flyersoft/books/chmlib/FileResetTable;->blockSize:J

    long-to-int v2, v1

    mul-int v8, v0, v2

    .line 292
    div-int v0, p1, v8

    .line 293
    rem-int v1, p1, v8

    add-int/2addr p1, p2

    .line 294
    div-int p2, p1, v8

    sub-int/2addr p2, v0

    add-int/lit8 v2, p2, 0x1

    .line 297
    new-instance v3, Lcom/flyersoft/books/chmlib/LZXCoder;

    iget-object v4, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->lzxControlData:Lcom/flyersoft/books/chmlib/FileControlData;

    iget v4, v4, Lcom/flyersoft/books/chmlib/FileControlData;->windowSize:I

    iget-object v5, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->lzxResetTable:Lcom/flyersoft/books/chmlib/FileResetTable;

    iget-wide v5, v5, Lcom/flyersoft/books/chmlib/FileResetTable;->blockSize:J

    invoke-direct {v3, v4, v5, v6}, Lcom/flyersoft/books/chmlib/LZXCoder;-><init>(IJ)V

    .line 298
    new-array v6, v8, [B

    .line 299
    new-array v4, v8, [B

    const/4 v9, 0x0

    const/4 v10, 0x0

    :goto_0
    if-ge v10, v2, :cond_3

    add-int v11, v0, v10

    .line 303
    iget-object v5, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->blockCache:Lcom/flyersoft/books/chmlib/ChmUtil$Cache;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v7}, Lcom/flyersoft/books/chmlib/ChmUtil$Cache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    if-nez v5, :cond_0

    .line 306
    iget-object v5, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->lzxControlData:Lcom/flyersoft/books/chmlib/FileControlData;

    iget v5, v5, Lcom/flyersoft/books/chmlib/FileControlData;->lzxResetInterval:I

    mul-int v5, v5, v11

    invoke-virtual {p0, v5}, Lcom/flyersoft/books/chmlib/ChmDocument;->getCompressedData(I)Lcom/flyersoft/books/chmlib/ByteBuffer;

    move-result-object v5

    .line 307
    invoke-virtual {v5, v4}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes([B)I

    move-result v5

    const/4 v7, 0x0

    .line 308
    invoke-virtual/range {v3 .. v8}, Lcom/flyersoft/books/chmlib/LZXCoder;->decompress([BI[BII)V

    .line 309
    iget-object v5, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->blockCache:Lcom/flyersoft/books/chmlib/ChmUtil$Cache;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v7, v6}, Lcom/flyersoft/books/chmlib/ChmUtil$Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v5, v6

    :cond_0
    if-nez v10, :cond_1

    sub-int v7, v8, v1

    move v11, v1

    goto :goto_1

    :cond_1
    move v7, v8

    const/4 v11, 0x0

    :goto_1
    if-ne v10, p2, :cond_2

    .line 318
    rem-int v7, p1, v8

    sub-int/2addr v7, v11

    .line 320
    :cond_2
    invoke-virtual {p3, v5, v11, v7}, Ljava/io/OutputStream;->write([BII)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method public extract(Lcom/flyersoft/books/chmlib/DirectoryEntry;Ljava/lang/String;)V
    .locals 2

    .line 414
    iget-object v0, p1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 417
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/DirectoryEntry;->getFileSystemName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 420
    const-string v0, "\\"

    const-string v1, "/"

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    .line 421
    invoke-virtual {p2, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 423
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 424
    invoke-static {v0}, Lcom/flyersoft/tools/T;->createFolder(Ljava/lang/String;)Z

    .line 426
    :cond_1
    invoke-static {p2}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p2

    .line 428
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/books/chmlib/ChmDocument;->getFileData(Lcom/flyersoft/books/chmlib/DirectoryEntry;Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 430
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_0
    if-eqz p2, :cond_2

    .line 434
    :try_start_1
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    .line 436
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public extract(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 407
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/ChmDocument;->getDirectoryEntry(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/DirectoryEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 410
    invoke-virtual {p0, v0, p2}, Lcom/flyersoft/books/chmlib/ChmDocument;->extract(Lcom/flyersoft/books/chmlib/DirectoryEntry;Ljava/lang/String;)V

    return-void

    .line 409
    :cond_0
    new-instance p2, Ljava/io/FileNotFoundException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "fileName: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "; chmFileName="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->chmFileName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public extractAll(Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 388
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/ChmDocument;->listFiles(Z)Ljava/util/List;

    move-result-object v0

    .line 389
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/chmlib/DirectoryEntry;

    .line 390
    iget-object v2, v1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->name:Ljava/lang/String;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 392
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/flyersoft/books/chmlib/DirectoryEntry;->getFileSystemName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 393
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/flyersoft/books/chmlib/DirectoryEntry;->getFileSystemName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->createFolder(Ljava/lang/String;)Z

    goto :goto_0

    .line 397
    :cond_1
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "extract:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/books/chmlib/ChmDocument;->log(Ljava/lang/String;)V

    .line 399
    iget-object v1, v1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->name:Ljava/lang/String;

    invoke-virtual {p0, v1, p1}, Lcom/flyersoft/books/chmlib/ChmDocument;->extract(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 401
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public getCharset()Ljava/lang/String;
    .locals 1

    .line 465
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->headerITSF:Lcom/flyersoft/books/chmlib/HeaderITSF;

    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/HeaderITSF;->getCharset()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCompressedData(I)Lcom/flyersoft/books/chmlib/ByteBuffer;
    .locals 6

    .line 374
    const-string v0, "::DataSpace/Storage/MSCompressed/Content"

    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/ChmDocument;->getRawData(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/ByteBuffer;

    move-result-object v0

    .line 375
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->lzxResetTable:Lcom/flyersoft/books/chmlib/FileResetTable;

    iget-object v1, v1, Lcom/flyersoft/books/chmlib/FileResetTable;->locations:[J

    aget-wide v2, v1, p1

    .line 377
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->lzxControlData:Lcom/flyersoft/books/chmlib/FileControlData;

    iget v1, v1, Lcom/flyersoft/books/chmlib/FileControlData;->lzxResetInterval:I

    add-int/2addr p1, v1

    .line 378
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->lzxResetTable:Lcom/flyersoft/books/chmlib/FileResetTable;

    iget v1, v1, Lcom/flyersoft/books/chmlib/FileResetTable;->numOfEntries:I

    if-ge p1, v1, :cond_0

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->lzxResetTable:Lcom/flyersoft/books/chmlib/FileResetTable;

    iget-object v1, v1, Lcom/flyersoft/books/chmlib/FileResetTable;->locations:[J

    aget-wide v4, v1, p1

    goto :goto_0

    .line 379
    :cond_0
    invoke-virtual {v0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->getSize()J

    move-result-wide v4

    .line 380
    :goto_0
    invoke-virtual {v0, v2, v3}, Lcom/flyersoft/books/chmlib/ByteBuffer;->seek(J)V

    sub-long/2addr v4, v2

    .line 382
    invoke-virtual {v0, v4, v5}, Lcom/flyersoft/books/chmlib/ByteBuffer;->resetSize(J)V

    return-object v0
.end method

.method public getDirectoryEntry(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/DirectoryEntry;
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 160
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    .line 162
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-eq v1, v2, :cond_1

    const/16 v2, 0x3a

    if-eq v1, v2, :cond_1

    const/16 v2, 0x23

    if-eq v1, v2, :cond_1

    .line 164
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 165
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->headerITSP:Lcom/flyersoft/books/chmlib/HeaderITSP;

    invoke-virtual {v1}, Lcom/flyersoft/books/chmlib/HeaderITSP;->getRootChunkNum()I

    move-result v1

    :goto_0
    const/4 v2, -0x1

    if-eq v1, v2, :cond_3

    .line 167
    invoke-direct {p0, v1}, Lcom/flyersoft/books/chmlib/ChmDocument;->getChunkListing(I)Lcom/flyersoft/books/chmlib/ChunkListing;

    move-result-object v1

    .line 168
    instance-of v2, v1, Lcom/flyersoft/books/chmlib/ChunkPMGI;

    if-eqz v2, :cond_2

    .line 169
    check-cast v1, Lcom/flyersoft/books/chmlib/ChunkPMGI;

    invoke-virtual {v1, p1}, Lcom/flyersoft/books/chmlib/ChunkPMGI;->find(Ljava/lang/String;)I

    move-result v1

    goto :goto_0

    .line 171
    :cond_2
    check-cast v1, Lcom/flyersoft/books/chmlib/ChunkPMGL;

    invoke-virtual {v1, p1}, Lcom/flyersoft/books/chmlib/ChunkPMGL;->find(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/DirectoryEntry;

    move-result-object p1

    return-object p1

    :cond_3
    :goto_1
    return-object v0
.end method

.method public getFileData(Ljava/lang/String;Ljava/io/OutputStream;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 199
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/ChmDocument;->getDirectoryEntry(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/DirectoryEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 202
    invoke-virtual {p0, v0, p2}, Lcom/flyersoft/books/chmlib/ChmDocument;->getFileData(Lcom/flyersoft/books/chmlib/DirectoryEntry;Ljava/io/OutputStream;)V

    .line 203
    iget p1, v0, Lcom/flyersoft/books/chmlib/DirectoryEntry;->length:I

    return p1

    .line 201
    :cond_0
    new-instance p2, Ljava/io/FileNotFoundException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "fileName: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "; chmFileName="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->chmFileName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public getFileData(Lcom/flyersoft/books/chmlib/DirectoryEntry;Ljava/io/OutputStream;)V
    .locals 3

    .line 256
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/DirectoryEntry;->isCompressed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 257
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/ChmDocument;->getRawData(Lcom/flyersoft/books/chmlib/DirectoryEntry;)Lcom/flyersoft/books/chmlib/ByteBuffer;

    move-result-object p1

    .line 258
    invoke-virtual {p1, p2}, Lcom/flyersoft/books/chmlib/ByteBuffer;->copyTo(Ljava/io/OutputStream;)I

    return-void

    .line 262
    :cond_0
    :try_start_0
    iget v0, p1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->offset:I

    iget v1, p1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->length:I

    invoke-virtual {p0, v0, v1, p2}, Lcom/flyersoft/books/chmlib/ChmDocument;->decompressRegion(IILjava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p2

    .line 264
    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V

    .line 265
    new-instance v0, Lcom/flyersoft/books/chmlib/ChmParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error parse file: chm="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->chmFileName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "; file="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->name:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1, p2}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v0
.end method

.method public getFileData(Lcom/flyersoft/books/chmlib/DirectoryEntry;)[B
    .locals 2

    .line 238
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    iget v1, p1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->length:I

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 239
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/books/chmlib/ChmDocument;->getFileData(Lcom/flyersoft/books/chmlib/DirectoryEntry;Ljava/io/OutputStream;)V

    .line 240
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    return-object p1
.end method

.method public getFileData(Lcom/flyersoft/books/chmlib/DirectoryEntry;II)[B
    .locals 4

    .line 278
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/DirectoryEntry;->isCompressed()Z

    move-result v0

    invoke-static {v0}, Lcom/flyersoft/books/chmlib/ChmUtil;->assertTrue(Z)V

    .line 280
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, p3}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 281
    iget v1, p1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->offset:I

    add-int/2addr v1, p2

    invoke-virtual {p0, v1, p3, v0}, Lcom/flyersoft/books/chmlib/ChmDocument;->decompressRegion(IILjava/io/OutputStream;)V

    .line 282
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    .line 284
    new-instance v1, Lcom/flyersoft/books/chmlib/ChmParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error parse file: chm="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->chmFileName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "; file="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->name:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ";offset="

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ";length="

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public getFileData(Ljava/lang/String;)[B
    .locals 0

    .line 250
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/ChmDocument;->getDirectoryEntry(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/DirectoryEntry;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 251
    :cond_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/ChmDocument;->getFileData(Lcom/flyersoft/books/chmlib/DirectoryEntry;)[B

    move-result-object p1

    return-object p1
.end method

.method public getHHCFileName()Ljava/lang/String;
    .locals 4

    .line 442
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->hhcFileName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 443
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/ChmDocument;->getDirectoryEntry(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/DirectoryEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 445
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->hhcFileName:Ljava/lang/String;

    return-object v0

    .line 447
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->triedHHC:Z

    if-nez v0, :cond_3

    .line 448
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->headerITSP:Lcom/flyersoft/books/chmlib/HeaderITSP;

    iget v0, v0, Lcom/flyersoft/books/chmlib/HeaderITSP;->chunkNumberOfDirectory:I

    const/16 v1, 0x28

    if-ge v0, v1, :cond_2

    .line 449
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ChmDocument;->listFiles()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/chmlib/DirectoryEntry;

    .line 450
    iget-object v2, v1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, ".hhc"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 451
    iget-object v0, v1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->hhcFileName:Ljava/lang/String;

    return-object v0

    :cond_2
    const/4 v0, 0x1

    .line 453
    iput-boolean v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->triedHHC:Z

    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRawData(Lcom/flyersoft/books/chmlib/DirectoryEntry;)Lcom/flyersoft/books/chmlib/ByteBuffer;
    .locals 5

    .line 226
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->headerITSF:Lcom/flyersoft/books/chmlib/HeaderITSF;

    iget-wide v1, v1, Lcom/flyersoft/books/chmlib/HeaderITSF;->offsetContentSection:J

    iget v3, p1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->offset:I

    int-to-long v3, v3

    add-long/2addr v1, v3

    iget p1, p1, Lcom/flyersoft/books/chmlib/DirectoryEntry;->length:I

    int-to-long v3, p1

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/flyersoft/books/chmlib/ByteBuffer;->resetSize(JJ)V

    .line 227
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    return-object p1
.end method

.method public getRawData(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/ByteBuffer;
    .locals 0

    .line 221
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/ChmDocument;->getDirectoryEntry(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/DirectoryEntry;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 222
    :cond_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/ChmDocument;->getRawData(Lcom/flyersoft/books/chmlib/DirectoryEntry;)Lcom/flyersoft/books/chmlib/ByteBuffer;

    move-result-object p1

    return-object p1
.end method

.method public hasHHC()Z
    .locals 1

    .line 460
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/ChmDocument;->getHHCFileName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->hhcFileName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 461
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public listFiles()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/flyersoft/books/chmlib/DirectoryEntry;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 177
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/ChmDocument;->listFiles(Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public listFiles(Z)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/flyersoft/books/chmlib/DirectoryEntry;",
            ">;"
        }
    .end annotation

    .line 181
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 182
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->headerITSP:Lcom/flyersoft/books/chmlib/HeaderITSP;

    iget v0, v0, Lcom/flyersoft/books/chmlib/HeaderITSP;->chunkNumberFirstPMGL:I

    :goto_0
    if-ltz v0, :cond_1

    .line 184
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-direct {p0, v0}, Lcom/flyersoft/books/chmlib/ChmDocument;->getChunkOffset(I)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/flyersoft/books/chmlib/ByteBuffer;->seekAbsolute(J)V

    .line 185
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->headerITSP:Lcom/flyersoft/books/chmlib/HeaderITSP;

    iget v1, v1, Lcom/flyersoft/books/chmlib/HeaderITSP;->dirChunkSize:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/books/chmlib/ByteBuffer;->resetSize(J)V

    .line 187
    sget-object v0, Lcom/flyersoft/books/chmlib/ChunkPMGL;->TAG:[B

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    sget-object v2, Lcom/flyersoft/books/chmlib/ChunkPMGL;->TAG:[B

    array-length v2, v2

    .line 188
    invoke-virtual {v1, v2}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes(I)[B

    move-result-object v1

    .line 187
    invoke-static {v0, v1}, Lcom/flyersoft/books/chmlib/ChmUtil;->assertEqual([B[B)V

    .line 189
    new-instance v0, Lcom/flyersoft/books/chmlib/ChunkPMGL;

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/ChmDocument;->bf:Lcom/flyersoft/books/chmlib/ByteBuffer;

    invoke-direct {v0, v1}, Lcom/flyersoft/books/chmlib/ChunkPMGL;-><init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V

    .line 190
    iget-object v1, v0, Lcom/flyersoft/books/chmlib/ChunkPMGL;->directoryEntries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/books/chmlib/DirectoryEntry;

    .line 191
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 193
    :cond_0
    iget v0, v0, Lcom/flyersoft/books/chmlib/ChunkPMGL;->chunkNumberNext:I

    goto :goto_0

    :cond_1
    return-object p1
.end method
