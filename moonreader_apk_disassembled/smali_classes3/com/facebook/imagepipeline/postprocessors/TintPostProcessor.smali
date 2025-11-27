.class public final Lcom/facebook/imagepipeline/postprocessors/TintPostProcessor;
.super Lcom/facebook/imagepipeline/request/BasePostprocessor;
.source "TintPostProcessor.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B)\u0012\u0008\u0008\u0001\u0010\u0002\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0010\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0010H\u0016J\u0008\u0010\u0011\u001a\u00020\u0012H\u0016J\u0008\u0010\u0013\u001a\u00020\u000cH\u0016R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u00020\u00038\u0002X\u0083\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/postprocessors/TintPostProcessor;",
        "Lcom/facebook/imagepipeline/request/BasePostprocessor;",
        "color",
        "",
        "alphaPercent",
        "",
        "porterDuffMode",
        "Landroid/graphics/PorterDuff$Mode;",
        "<init>",
        "(ILjava/lang/Float;Landroid/graphics/PorterDuff$Mode;)V",
        "tintColor",
        "cacheKey",
        "Lcom/facebook/cache/common/CacheKey;",
        "process",
        "",
        "sourceBitmap",
        "Landroid/graphics/Bitmap;",
        "getName",
        "",
        "getPostprocessorCacheKey",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final cacheKey:Lcom/facebook/cache/common/CacheKey;

.field private final porterDuffMode:Landroid/graphics/PorterDuff$Mode;

.field private final tintColor:I


# direct methods
.method public constructor <init>(ILjava/lang/Float;Landroid/graphics/PorterDuff$Mode;)V
    .locals 2

    .line 35
    invoke-direct {p0}, Lcom/facebook/imagepipeline/request/BasePostprocessor;-><init>()V

    .line 34
    iput-object p3, p0, Lcom/facebook/imagepipeline/postprocessors/TintPostProcessor;->porterDuffMode:Landroid/graphics/PorterDuff$Mode;

    if-eqz p2, :cond_0

    .line 39
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    const/16 v0, 0xff

    int-to-float v1, v0

    mul-float p2, p2, v1

    float-to-int p2, p2

    const/4 v1, 0x0

    invoke-static {p2, v1, v0}, Lkotlin/ranges/RangesKt;->coerceIn(III)I

    move-result p2

    invoke-static {p1, p2}, Landroidx/core/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result p1

    .line 38
    :cond_0
    iput p1, p0, Lcom/facebook/imagepipeline/postprocessors/TintPostProcessor;->tintColor:I

    .line 45
    new-instance p2, Lcom/facebook/cache/common/SimpleCacheKey;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Tint. tintColor="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", mode="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/facebook/cache/common/SimpleCacheKey;-><init>(Ljava/lang/String;)V

    check-cast p2, Lcom/facebook/cache/common/CacheKey;

    iput-object p2, p0, Lcom/facebook/imagepipeline/postprocessors/TintPostProcessor;->cacheKey:Lcom/facebook/cache/common/CacheKey;

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/Float;Landroid/graphics/PorterDuff$Mode;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    and-int/lit8 p5, p4, 0x2

    const/4 v0, 0x0

    if-eqz p5, :cond_0

    move-object p2, v0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    move-object p3, v0

    .line 31
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/imagepipeline/postprocessors/TintPostProcessor;-><init>(ILjava/lang/Float;Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    const-class v0, Lcom/facebook/imagepipeline/postprocessors/TintPostProcessor;

    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPostprocessorCacheKey()Lcom/facebook/cache/common/CacheKey;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/facebook/imagepipeline/postprocessors/TintPostProcessor;->cacheKey:Lcom/facebook/cache/common/CacheKey;

    return-object v0
.end method

.method public process(Landroid/graphics/Bitmap;)V
    .locals 2

    const-string v0, "sourceBitmap"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    iget-object v0, p0, Lcom/facebook/imagepipeline/postprocessors/TintPostProcessor;->porterDuffMode:Landroid/graphics/PorterDuff$Mode;

    if-nez v0, :cond_0

    .line 51
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iget p1, p0, Lcom/facebook/imagepipeline/postprocessors/TintPostProcessor;->tintColor:I

    invoke-virtual {v0, p1}, Landroid/graphics/Canvas;->drawColor(I)V

    return-void

    .line 53
    :cond_0
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iget p1, p0, Lcom/facebook/imagepipeline/postprocessors/TintPostProcessor;->tintColor:I

    iget-object v1, p0, Lcom/facebook/imagepipeline/postprocessors/TintPostProcessor;->porterDuffMode:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p1, v1}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    return-void
.end method
