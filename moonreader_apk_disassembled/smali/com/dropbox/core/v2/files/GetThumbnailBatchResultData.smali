.class public Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;
.super Ljava/lang/Object;
.source "GetThumbnailBatchResultData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData$Serializer;
    }
.end annotation


# instance fields
.field protected final metadata:Lcom/dropbox/core/v2/files/FileMetadata;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final thumbnail:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/files/FileMetadata;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/files/FileMetadata;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 42
    iput-object p1, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;->metadata:Lcom/dropbox/core/v2/files/FileMetadata;

    if-eqz p2, :cond_0

    .line 46
    iput-object p2, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;->thumbnail:Ljava/lang/String;

    return-void

    .line 44
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'thumbnail\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'metadata\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 86
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 87
    check-cast p1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;

    .line 88
    iget-object v2, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;->metadata:Lcom/dropbox/core/v2/files/FileMetadata;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;->metadata:Lcom/dropbox/core/v2/files/FileMetadata;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/FileMetadata;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;->thumbnail:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;->thumbnail:Ljava/lang/String;

    if-eq v2, p1, :cond_4

    .line 89
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    :cond_5
    return v1
.end method

.method public getMetadata()Lcom/dropbox/core/v2/files/FileMetadata;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;->metadata:Lcom/dropbox/core/v2/files/FileMetadata;

    return-object v0
.end method

.method public getThumbnail()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 65
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;->thumbnail:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 70
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;->metadata:Lcom/dropbox/core/v2/files/FileMetadata;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData;->thumbnail:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 99
    sget-object v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 111
    sget-object v0, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/GetThumbnailBatchResultData$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
