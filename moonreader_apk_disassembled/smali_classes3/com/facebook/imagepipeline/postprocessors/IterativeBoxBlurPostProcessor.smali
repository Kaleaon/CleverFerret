.class public Lcom/facebook/imagepipeline/postprocessors/IterativeBoxBlurPostProcessor;
.super Lcom/facebook/imagepipeline/request/BasePostprocessor;
.source "IterativeBoxBlurPostProcessor.java"


# static fields
.field private static final DEFAULT_ITERATIONS:I = 0x3


# instance fields
.field private final mBlurRadius:I

.field private mCacheKey:Lcom/facebook/cache/common/CacheKey;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mIterations:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x3

    .line 35
    invoke-direct {p0, v0, p1}, Lcom/facebook/imagepipeline/postprocessors/IterativeBoxBlurPostProcessor;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 3

    .line 38
    invoke-direct {p0}, Lcom/facebook/imagepipeline/request/BasePostprocessor;-><init>()V

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-lez p1, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 39
    :goto_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/common/internal/Preconditions;->checkArgument(Ljava/lang/Boolean;)V

    if-lez p2, :cond_1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    .line 40
    :goto_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/common/internal/Preconditions;->checkArgument(Ljava/lang/Boolean;)V

    .line 41
    iput p1, p0, Lcom/facebook/imagepipeline/postprocessors/IterativeBoxBlurPostProcessor;->mIterations:I

    .line 42
    iput p2, p0, Lcom/facebook/imagepipeline/postprocessors/IterativeBoxBlurPostProcessor;->mBlurRadius:I

    return-void
.end method


# virtual methods
.method public getPostprocessorCacheKey()Lcom/facebook/cache/common/CacheKey;
    .locals 5
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/facebook/imagepipeline/postprocessors/IterativeBoxBlurPostProcessor;->mCacheKey:Lcom/facebook/cache/common/CacheKey;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 54
    move-object v1, v0

    check-cast v1, Ljava/util/Locale;

    iget v1, p0, Lcom/facebook/imagepipeline/postprocessors/IterativeBoxBlurPostProcessor;->mIterations:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Lcom/facebook/imagepipeline/postprocessors/IterativeBoxBlurPostProcessor;->mBlurRadius:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const/4 v1, 0x1

    aput-object v2, v3, v1

    const-string v1, "i%dr%d"

    invoke-static {v0, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 55
    new-instance v1, Lcom/facebook/cache/common/SimpleCacheKey;

    invoke-direct {v1, v0}, Lcom/facebook/cache/common/SimpleCacheKey;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/facebook/imagepipeline/postprocessors/IterativeBoxBlurPostProcessor;->mCacheKey:Lcom/facebook/cache/common/CacheKey;

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/postprocessors/IterativeBoxBlurPostProcessor;->mCacheKey:Lcom/facebook/cache/common/CacheKey;

    return-object v0
.end method

.method public process(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 47
    iget v0, p0, Lcom/facebook/imagepipeline/postprocessors/IterativeBoxBlurPostProcessor;->mIterations:I

    iget v1, p0, Lcom/facebook/imagepipeline/postprocessors/IterativeBoxBlurPostProcessor;->mBlurRadius:I

    invoke-static {p1, v0, v1}, Lcom/facebook/imagepipeline/nativecode/NativeBlurFilter;->iterativeBoxBlur(Landroid/graphics/Bitmap;II)V

    return-void
.end method
