.class final Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;
.super Ljava/io/OutputStream;
.source "DbxClientV1.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v1/DbxClientV1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ChunkedUploadOutputStream"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final chunk:[B

.field private chunkPos:I

.field final synthetic this$0:Lcom/dropbox/core/v1/DbxClientV1;

.field private uploadId:Ljava/lang/String;

.field private uploadOffset:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1332
    const-class v0, Lcom/dropbox/core/v1/DbxClientV1;

    return-void
.end method

.method private constructor <init>(Lcom/dropbox/core/v1/DbxClientV1;I)V
    .locals 0

    .line 1340
    iput-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->this$0:Lcom/dropbox/core/v1/DbxClientV1;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    const/4 p1, 0x0

    .line 1335
    iput p1, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunkPos:I

    .line 1341
    new-array p2, p2, [B

    iput-object p2, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunk:[B

    .line 1342
    iput p1, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunkPos:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/dropbox/core/v1/DbxClientV1;ILcom/dropbox/core/v1/DbxClientV1$1;)V
    .locals 0

    .line 1332
    invoke-direct {p0, p1, p2}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;-><init>(Lcom/dropbox/core/v1/DbxClientV1;I)V

    return-void
.end method

.method static synthetic access$400(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)Ljava/lang/String;
    .locals 0

    .line 1332
    iget-object p0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->uploadId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$500(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)I
    .locals 0

    .line 1332
    iget p0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunkPos:I

    return p0
.end method

.method static synthetic access$600(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)[B
    .locals 0

    .line 1332
    iget-object p0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunk:[B

    return-object p0
.end method

.method static synthetic access$700(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1332
    invoke-direct {p0}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->finishChunk()V

    return-void
.end method

.method static synthetic access$800(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)J
    .locals 2

    .line 1332
    iget-wide v0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->uploadOffset:J

    return-wide v0
.end method

.method private finishChunk()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1370
    iget v0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunkPos:I

    if-nez v0, :cond_0

    return-void

    .line 1372
    :cond_0
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->uploadId:Ljava/lang/String;

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 1376
    new-instance v0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream$1;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream$1;-><init>(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;)V

    invoke-static {v1, v0}, Lcom/dropbox/core/DbxRequestUtil;->runAndRetry(ILcom/dropbox/core/DbxRequestUtil$RequestMaker;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->uploadId:Ljava/lang/String;

    .line 1381
    iget v0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunkPos:I

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->uploadOffset:J

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    .line 1388
    :goto_0
    new-instance v4, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream$2;

    invoke-direct {v4, p0, v0, v3}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream$2;-><init>(Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;Ljava/lang/String;I)V

    invoke-static {v1, v4}, Lcom/dropbox/core/DbxRequestUtil;->runAndRetry(ILcom/dropbox/core/DbxRequestUtil$RequestMaker;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 1393
    iget-wide v6, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->uploadOffset:J

    iget v8, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunkPos:I

    int-to-long v8, v8

    add-long/2addr v8, v6

    const-wide/16 v10, -0x1

    cmp-long v12, v4, v10

    if-nez v12, :cond_2

    .line 1396
    iput-wide v8, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->uploadOffset:J

    .line 1405
    :goto_1
    iput v2, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunkPos:I

    return-void

    :cond_2
    sub-long/2addr v4, v6

    long-to-int v5, v4

    add-int/2addr v3, v5

    goto :goto_0
.end method

.method private finishChunkIfNecessary()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 1362
    iget v0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunkPos:I

    iget-object v1, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunk:[B

    array-length v1, v1

    if-ne v0, v1, :cond_0

    .line 1363
    invoke-direct {p0}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->finishChunk()V

    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public write(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1349
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunk:[B

    iget v1, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunkPos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunkPos:I

    int-to-byte p1, p1

    aput-byte p1, v0, v1

    .line 1351
    :try_start_0
    invoke-direct {p0}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->finishChunkIfNecessary()V
    :try_end_0
    .catch Lcom/dropbox/core/DbxException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 1354
    new-instance v0, Lcom/dropbox/core/v1/DbxClientV1$IODbxException;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v1/DbxClientV1$IODbxException;-><init>(Lcom/dropbox/core/DbxException;)V

    throw v0
.end method

.method public write([BII)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    add-int/2addr p3, p2

    :goto_0
    if-ge p2, p3, :cond_0

    .line 1415
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunk:[B

    array-length v0, v0

    iget v1, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunkPos:I

    sub-int/2addr v0, v1

    sub-int v1, p3, p2

    .line 1417
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1418
    iget-object v1, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunk:[B

    iget v2, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunkPos:I

    invoke-static {p1, p2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1419
    iget v1, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunkPos:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->chunkPos:I

    add-int/2addr p2, v0

    .line 1422
    :try_start_0
    invoke-direct {p0}, Lcom/dropbox/core/v1/DbxClientV1$ChunkedUploadOutputStream;->finishChunkIfNecessary()V
    :try_end_0
    .catch Lcom/dropbox/core/DbxException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 1425
    new-instance p2, Lcom/dropbox/core/v1/DbxClientV1$IODbxException;

    invoke-direct {p2, p1}, Lcom/dropbox/core/v1/DbxClientV1$IODbxException;-><init>(Lcom/dropbox/core/DbxException;)V

    throw p2

    :cond_0
    return-void
.end method
