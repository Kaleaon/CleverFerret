.class public final Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;
.super Ljava/lang/Object;
.source "BitmapCounterProvider.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0007J\u0008\u0010\u0013\u001a\u00020\u000bH\u0007R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u00020\u00088\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000c\u001a\u00020\u00088BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\r\u0010\u000e\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;",
        "",
        "<init>",
        "()V",
        "KB",
        "",
        "MB",
        "MAX_BITMAP_TOTAL_SIZE",
        "",
        "maxBitmapCount",
        "bitmapCounter",
        "Lcom/facebook/imagepipeline/memory/BitmapCounter;",
        "maxSizeHardCap",
        "getMaxSizeHardCap",
        "()I",
        "initialize",
        "",
        "bitmapCounterConfig",
        "Lcom/facebook/imagepipeline/memory/BitmapCounterConfig;",
        "get",
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


# static fields
.field public static final INSTANCE:Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;

.field private static final KB:J = 0x400L

.field public static final MAX_BITMAP_TOTAL_SIZE:I

.field private static final MB:J = 0x100000L

.field private static volatile bitmapCounter:Lcom/facebook/imagepipeline/memory/BitmapCounter;

.field private static maxBitmapCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;

    invoke-direct {v0}, Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;-><init>()V

    sput-object v0, Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;->INSTANCE:Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;

    .line 25
    invoke-direct {v0}, Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;->getMaxSizeHardCap()I

    move-result v0

    sput v0, Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;->MAX_BITMAP_TOTAL_SIZE:I

    const/16 v0, 0x180

    .line 26
    sput v0, Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;->maxBitmapCount:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final get()Lcom/facebook/imagepipeline/memory/BitmapCounter;
    .locals 4
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 50
    sget-object v0, Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;->bitmapCounter:Lcom/facebook/imagepipeline/memory/BitmapCounter;

    if-nez v0, :cond_1

    .line 51
    const-class v0, Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;

    monitor-enter v0

    .line 52
    :try_start_0
    sget-object v1, Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;->bitmapCounter:Lcom/facebook/imagepipeline/memory/BitmapCounter;

    if-nez v1, :cond_0

    .line 53
    new-instance v1, Lcom/facebook/imagepipeline/memory/BitmapCounter;

    sget v2, Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;->maxBitmapCount:I

    sget v3, Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;->MAX_BITMAP_TOTAL_SIZE:I

    invoke-direct {v1, v2, v3}, Lcom/facebook/imagepipeline/memory/BitmapCounter;-><init>(II)V

    sput-object v1, Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;->bitmapCounter:Lcom/facebook/imagepipeline/memory/BitmapCounter;

    .line 55
    :cond_0
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1

    .line 57
    :cond_1
    :goto_0
    sget-object v0, Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;->bitmapCounter:Lcom/facebook/imagepipeline/memory/BitmapCounter;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    return-object v0
.end method

.method private final getMaxSizeHardCap()I
    .locals 6

    .line 31
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v0

    const-wide/32 v2, 0x7fffffff

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v1, v0

    int-to-long v2, v1

    const-wide/32 v4, 0x1000000

    cmp-long v0, v2, v4

    if-lez v0, :cond_0

    .line 33
    div-int/lit8 v1, v1, 0x4

    mul-int/lit8 v1, v1, 0x3

    return v1

    .line 35
    :cond_0
    div-int/lit8 v1, v1, 0x2

    return v1
.end method

.method public static final initialize(Lcom/facebook/imagepipeline/memory/BitmapCounterConfig;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "bitmapCounterConfig"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    sget-object v0, Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;->bitmapCounter:Lcom/facebook/imagepipeline/memory/BitmapCounter;

    if-nez v0, :cond_0

    .line 44
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/memory/BitmapCounterConfig;->getMaxBitmapCount()I

    move-result p0

    sput p0, Lcom/facebook/imagepipeline/memory/BitmapCounterProvider;->maxBitmapCount:I

    return-void

    .line 41
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "BitmapCounter has already been created! `BitmapCounterProvider.initialize(...)` should only be called before `BitmapCounterProvider.get()` or not at all!"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
