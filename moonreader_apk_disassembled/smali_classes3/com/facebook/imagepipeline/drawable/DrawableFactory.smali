.class public interface abstract Lcom/facebook/imagepipeline/drawable/DrawableFactory;
.super Ljava/lang/Object;
.source "DrawableFactory.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008f\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u0004\u001a\u00020\u0005H&\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/drawable/DrawableFactory;",
        "",
        "supportsImageType",
        "",
        "image",
        "Lcom/facebook/imagepipeline/image/CloseableImage;",
        "createDrawable",
        "Landroid/graphics/drawable/Drawable;",
        "imagepipeline-base_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# virtual methods
.method public abstract createDrawable(Lcom/facebook/imagepipeline/image/CloseableImage;)Landroid/graphics/drawable/Drawable;
.end method

.method public abstract supportsImageType(Lcom/facebook/imagepipeline/image/CloseableImage;)Z
.end method
