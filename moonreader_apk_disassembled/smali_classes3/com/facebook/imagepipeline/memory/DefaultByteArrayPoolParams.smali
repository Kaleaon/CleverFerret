.class public final Lcom/facebook/imagepipeline/memory/DefaultByteArrayPoolParams;
.super Ljava/lang/Object;
.source "DefaultByteArrayPoolParams.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\t\u001a\u00020\nH\u0007R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/memory/DefaultByteArrayPoolParams;",
        "",
        "<init>",
        "()V",
        "DEFAULT_IO_BUFFER_SIZE",
        "",
        "DEFAULT_BUCKET_SIZE",
        "MAX_SIZE_SOFT_CAP",
        "MAX_SIZE_HARD_CAP",
        "get",
        "Lcom/facebook/imagepipeline/memory/PoolParams;",
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
.field private static final DEFAULT_BUCKET_SIZE:I = 0x5

.field private static final DEFAULT_IO_BUFFER_SIZE:I = 0x4000

.field public static final INSTANCE:Lcom/facebook/imagepipeline/memory/DefaultByteArrayPoolParams;

.field private static final MAX_SIZE_HARD_CAP:I = 0x100000

.field private static final MAX_SIZE_SOFT_CAP:I = 0x14000


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/imagepipeline/memory/DefaultByteArrayPoolParams;

    invoke-direct {v0}, Lcom/facebook/imagepipeline/memory/DefaultByteArrayPoolParams;-><init>()V

    sput-object v0, Lcom/facebook/imagepipeline/memory/DefaultByteArrayPoolParams;->INSTANCE:Lcom/facebook/imagepipeline/memory/DefaultByteArrayPoolParams;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final get()Lcom/facebook/imagepipeline/memory/PoolParams;
    .locals 4
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 34
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    const/16 v1, 0x4000

    const/4 v2, 0x5

    .line 35
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 36
    new-instance v1, Lcom/facebook/imagepipeline/memory/PoolParams;

    const v2, 0x14000

    const/high16 v3, 0x100000

    invoke-direct {v1, v2, v3, v0}, Lcom/facebook/imagepipeline/memory/PoolParams;-><init>(IILandroid/util/SparseIntArray;)V

    return-object v1
.end method
