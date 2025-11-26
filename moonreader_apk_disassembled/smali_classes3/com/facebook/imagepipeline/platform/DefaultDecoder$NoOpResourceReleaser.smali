.class final Lcom/facebook/imagepipeline/platform/DefaultDecoder$NoOpResourceReleaser;
.super Ljava/lang/Object;
.source "DefaultDecoder.java"

# interfaces
.implements Lcom/facebook/common/references/ResourceReleaser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/platform/DefaultDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NoOpResourceReleaser"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/common/references/ResourceReleaser<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# static fields
.field private static final INSTANCE:Lcom/facebook/imagepipeline/platform/DefaultDecoder$NoOpResourceReleaser;


# direct methods
.method static bridge synthetic -$$Nest$sfgetINSTANCE()Lcom/facebook/imagepipeline/platform/DefaultDecoder$NoOpResourceReleaser;
    .locals 1

    sget-object v0, Lcom/facebook/imagepipeline/platform/DefaultDecoder$NoOpResourceReleaser;->INSTANCE:Lcom/facebook/imagepipeline/platform/DefaultDecoder$NoOpResourceReleaser;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 358
    new-instance v0, Lcom/facebook/imagepipeline/platform/DefaultDecoder$NoOpResourceReleaser;

    invoke-direct {v0}, Lcom/facebook/imagepipeline/platform/DefaultDecoder$NoOpResourceReleaser;-><init>()V

    sput-object v0, Lcom/facebook/imagepipeline/platform/DefaultDecoder$NoOpResourceReleaser;->INSTANCE:Lcom/facebook/imagepipeline/platform/DefaultDecoder$NoOpResourceReleaser;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 357
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public release(Landroid/graphics/Bitmap;)V
    .locals 0

    return-void
.end method

.method public bridge synthetic release(Ljava/lang/Object;)V
    .locals 0

    .line 357
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/platform/DefaultDecoder$NoOpResourceReleaser;->release(Landroid/graphics/Bitmap;)V

    return-void
.end method
