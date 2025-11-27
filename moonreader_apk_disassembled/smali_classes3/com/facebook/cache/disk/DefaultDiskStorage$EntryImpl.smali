.class Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;
.super Ljava/lang/Object;
.source "DefaultDiskStorage.java"

# interfaces
.implements Lcom/facebook/cache/disk/DiskStorage$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/cache/disk/DefaultDiskStorage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "EntryImpl"
.end annotation


# instance fields
.field private final id:Ljava/lang/String;

.field private final resource:Lcom/facebook/binaryresource/FileBinaryResource;

.field private size:J

.field private timestamp:J


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/io/File;)V
    .locals 0

    .line 498
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 499
    invoke-static {p2}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 500
    invoke-static {p1}, Lcom/facebook/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;->id:Ljava/lang/String;

    .line 501
    invoke-static {p2}, Lcom/facebook/binaryresource/FileBinaryResource;->create(Ljava/io/File;)Lcom/facebook/binaryresource/FileBinaryResource;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;->resource:Lcom/facebook/binaryresource/FileBinaryResource;

    const-wide/16 p1, -0x1

    .line 502
    iput-wide p1, p0, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;->size:J

    .line 503
    iput-wide p1, p0, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;->timestamp:J

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/io/File;Lcom/facebook/cache/disk/DefaultDiskStorage-IA;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;-><init>(Ljava/lang/String;Ljava/io/File;)V

    return-void
.end method


# virtual methods
.method public getId()Ljava/lang/String;
    .locals 1

    .line 508
    iget-object v0, p0, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;->id:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic getResource()Lcom/facebook/binaryresource/BinaryResource;
    .locals 1

    .line 491
    invoke-virtual {p0}, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;->getResource()Lcom/facebook/binaryresource/FileBinaryResource;

    move-result-object v0

    return-object v0
.end method

.method public getResource()Lcom/facebook/binaryresource/FileBinaryResource;
    .locals 1

    .line 522
    iget-object v0, p0, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;->resource:Lcom/facebook/binaryresource/FileBinaryResource;

    return-object v0
.end method

.method public getSize()J
    .locals 5

    .line 527
    iget-wide v0, p0, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;->size:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    .line 528
    iget-object v0, p0, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;->resource:Lcom/facebook/binaryresource/FileBinaryResource;

    invoke-virtual {v0}, Lcom/facebook/binaryresource/FileBinaryResource;->size()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;->size:J

    .line 530
    :cond_0
    iget-wide v0, p0, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;->size:J

    return-wide v0
.end method

.method public getTimestamp()J
    .locals 5

    .line 513
    iget-wide v0, p0, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;->timestamp:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    .line 514
    iget-object v0, p0, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;->resource:Lcom/facebook/binaryresource/FileBinaryResource;

    invoke-virtual {v0}, Lcom/facebook/binaryresource/FileBinaryResource;->getFile()Ljava/io/File;

    move-result-object v0

    .line 515
    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;->timestamp:J

    .line 517
    :cond_0
    iget-wide v0, p0, Lcom/facebook/cache/disk/DefaultDiskStorage$EntryImpl;->timestamp:J

    return-wide v0
.end method
