.class Lcom/dropbox/core/v2/files/ThumbnailV2Arg;
.super Ljava/lang/Object;
.source "ThumbnailV2Arg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;,
        Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Builder;
    }
.end annotation


# instance fields
.field protected final format:Lcom/dropbox/core/v2/files/ThumbnailFormat;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final mode:Lcom/dropbox/core/v2/files/ThumbnailMode;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final resource:Lcom/dropbox/core/v2/files/PathOrLink;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final size:Lcom/dropbox/core/v2/files/ThumbnailSize;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/files/PathOrLink;)V
    .locals 3
    .param p1    # Lcom/dropbox/core/v2/files/PathOrLink;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 84
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailFormat;->JPEG:Lcom/dropbox/core/v2/files/ThumbnailFormat;

    sget-object v1, Lcom/dropbox/core/v2/files/ThumbnailSize;->W64H64:Lcom/dropbox/core/v2/files/ThumbnailSize;

    sget-object v2, Lcom/dropbox/core/v2/files/ThumbnailMode;->STRICT:Lcom/dropbox/core/v2/files/ThumbnailMode;

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;-><init>(Lcom/dropbox/core/v2/files/PathOrLink;Lcom/dropbox/core/v2/files/ThumbnailFormat;Lcom/dropbox/core/v2/files/ThumbnailSize;Lcom/dropbox/core/v2/files/ThumbnailMode;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/files/PathOrLink;Lcom/dropbox/core/v2/files/ThumbnailFormat;Lcom/dropbox/core/v2/files/ThumbnailSize;Lcom/dropbox/core/v2/files/ThumbnailMode;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/files/PathOrLink;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/files/ThumbnailFormat;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/files/ThumbnailSize;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/files/ThumbnailMode;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 55
    iput-object p1, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->resource:Lcom/dropbox/core/v2/files/PathOrLink;

    if-eqz p2, :cond_2

    .line 59
    iput-object p2, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->format:Lcom/dropbox/core/v2/files/ThumbnailFormat;

    if-eqz p3, :cond_1

    .line 63
    iput-object p3, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->size:Lcom/dropbox/core/v2/files/ThumbnailSize;

    if-eqz p4, :cond_0

    .line 67
    iput-object p4, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->mode:Lcom/dropbox/core/v2/files/ThumbnailMode;

    return-void

    .line 65
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'mode\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 61
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'size\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 57
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'format\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 53
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'resource\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Lcom/dropbox/core/v2/files/PathOrLink;)Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Builder;
    .locals 1

    .line 148
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Builder;-><init>(Lcom/dropbox/core/v2/files/PathOrLink;)V

    return-object v0
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

    .line 279
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 280
    check-cast p1, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;

    .line 281
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->resource:Lcom/dropbox/core/v2/files/PathOrLink;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->resource:Lcom/dropbox/core/v2/files/PathOrLink;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/PathOrLink;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->format:Lcom/dropbox/core/v2/files/ThumbnailFormat;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->format:Lcom/dropbox/core/v2/files/ThumbnailFormat;

    if-eq v2, v3, :cond_3

    .line 282
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/ThumbnailFormat;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->size:Lcom/dropbox/core/v2/files/ThumbnailSize;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->size:Lcom/dropbox/core/v2/files/ThumbnailSize;

    if-eq v2, v3, :cond_4

    .line 283
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/ThumbnailSize;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->mode:Lcom/dropbox/core/v2/files/ThumbnailMode;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->mode:Lcom/dropbox/core/v2/files/ThumbnailMode;

    if-eq v2, p1, :cond_6

    .line 284
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/ThumbnailMode;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getFormat()Lcom/dropbox/core/v2/files/ThumbnailFormat;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 109
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->format:Lcom/dropbox/core/v2/files/ThumbnailFormat;

    return-object v0
.end method

.method public getMode()Lcom/dropbox/core/v2/files/ThumbnailMode;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 131
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->mode:Lcom/dropbox/core/v2/files/ThumbnailMode;

    return-object v0
.end method

.method public getResource()Lcom/dropbox/core/v2/files/PathOrLink;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 96
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->resource:Lcom/dropbox/core/v2/files/PathOrLink;

    return-object v0
.end method

.method public getSize()Lcom/dropbox/core/v2/files/ThumbnailSize;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 120
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->size:Lcom/dropbox/core/v2/files/ThumbnailSize;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 261
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->resource:Lcom/dropbox/core/v2/files/PathOrLink;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->format:Lcom/dropbox/core/v2/files/ThumbnailFormat;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->size:Lcom/dropbox/core/v2/files/ThumbnailSize;

    iget-object v3, p0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg;->mode:Lcom/dropbox/core/v2/files/ThumbnailMode;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 294
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 306
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/ThumbnailV2Arg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
