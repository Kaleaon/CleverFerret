.class public abstract Lcom/facebook/imagepipeline/image/BaseCloseableImage;
.super Ljava/lang/Object;
.source "BaseCloseableImage.java"

# interfaces
.implements Lcom/facebook/imagepipeline/image/CloseableImage;


# static fields
.field private static final mImageExtrasList:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mCacheImageInfo:Lcom/facebook/imagepipeline/image/ImageInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mExtras:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 27
    new-instance v0, Ljava/util/HashSet;

    const-string v10, "modified_url"

    const-string v11, "image_color_space"

    const-string v1, "encoded_size"

    const-string v2, "encoded_width"

    const-string v3, "encoded_height"

    const-string v4, "uri_source"

    const-string v5, "image_format"

    const-string v6, "bitmap_config"

    const-string v7, "is_rounded"

    const-string v8, "non_fatal_decode_error"

    const-string v9, "original_url"

    filled-new-array/range {v1 .. v11}, [Ljava/lang/String;

    move-result-object v1

    .line 29
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->mImageExtrasList:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->mExtras:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getExtra(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 94
    invoke-virtual {p0, p1, v0}, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->getExtra(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getExtra(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;)TT;"
        }
    .end annotation

    .line 99
    iget-object v0, p0, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->mExtras:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p2

    :cond_0
    return-object p1
.end method

.method public getExtras()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 66
    iget-object v0, p0, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->mExtras:Ljava/util/Map;

    return-object v0
.end method

.method public getImageInfo()Lcom/facebook/imagepipeline/image/ImageInfo;
    .locals 7

    .line 109
    iget-object v0, p0, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->mCacheImageInfo:Lcom/facebook/imagepipeline/image/ImageInfo;

    if-nez v0, :cond_0

    .line 110
    new-instance v1, Lcom/facebook/imagepipeline/image/ImageInfoImpl;

    .line 112
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->getSizeInBytes()I

    move-result v4

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->getQualityInfo()Lcom/facebook/imagepipeline/image/QualityInfo;

    move-result-object v5

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->getExtras()Ljava/util/Map;

    move-result-object v6

    invoke-direct/range {v1 .. v6}, Lcom/facebook/imagepipeline/image/ImageInfoImpl;-><init>(IIILcom/facebook/imagepipeline/image/QualityInfo;Ljava/util/Map;)V

    iput-object v1, p0, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->mCacheImageInfo:Lcom/facebook/imagepipeline/image/ImageInfo;

    .line 114
    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->mCacheImageInfo:Lcom/facebook/imagepipeline/image/ImageInfo;

    return-object v0
.end method

.method public getQualityInfo()Lcom/facebook/imagepipeline/image/QualityInfo;
    .locals 1

    .line 51
    sget-object v0, Lcom/facebook/imagepipeline/image/ImmutableQualityInfo;->FULL_QUALITY:Lcom/facebook/imagepipeline/image/QualityInfo;

    return-object v0
.end method

.method public isStateful()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public putExtra(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p2    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TE;)V"
        }
    .end annotation

    .line 87
    sget-object v0, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->mImageExtrasList:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    iget-object v0, p0, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->mExtras:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public putExtras(Ljava/util/Map;)V
    .locals 4
    .param p1    # Ljava/util/Map;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    goto :goto_1

    .line 76
    :cond_0
    sget-object v0, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->mImageExtrasList:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 77
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_0

    .line 81
    :cond_1
    iget-object v3, p0, Lcom/facebook/imagepipeline/image/BaseCloseableImage;->mExtras:Ljava/util/Map;

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method
