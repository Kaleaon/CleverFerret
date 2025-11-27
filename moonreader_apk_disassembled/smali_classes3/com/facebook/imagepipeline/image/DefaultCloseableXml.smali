.class public final Lcom/facebook/imagepipeline/image/DefaultCloseableXml;
.super Lcom/facebook/imagepipeline/image/DefaultCloseableImage;
.source "DefaultCloseableXml.kt"

# interfaces
.implements Lcom/facebook/imagepipeline/image/CloseableXml;
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDefaultCloseableXml.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DefaultCloseableXml.kt\ncom/facebook/imagepipeline/image/DefaultCloseableXml\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,41:1\n1#2:42\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u00012\u00020\u0002B\u0011\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0008\u0010\t\u001a\u00020\nH\u0016J\u0008\u0010\u000b\u001a\u00020\u000cH\u0016J\u0008\u0010\r\u001a\u00020\u0008H\u0016J\u0008\u0010\u000e\u001a\u00020\nH\u0016J\u0008\u0010\u000f\u001a\u00020\nH\u0016J\n\u0010\u0010\u001a\u0004\u0018\u00010\u0004H\u0016R\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0011"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/image/DefaultCloseableXml;",
        "Lcom/facebook/imagepipeline/image/DefaultCloseableImage;",
        "Lcom/facebook/imagepipeline/image/CloseableXml;",
        "drawable",
        "Landroid/graphics/drawable/Drawable;",
        "<init>",
        "(Landroid/graphics/drawable/Drawable;)V",
        "closed",
        "",
        "getSizeInBytes",
        "",
        "close",
        "",
        "isClosed",
        "getWidth",
        "getHeight",
        "buildDrawable",
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


# instance fields
.field private closed:Z

.field private drawable:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/facebook/imagepipeline/image/DefaultCloseableImage;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/facebook/imagepipeline/image/DefaultCloseableXml;->drawable:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method public buildDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/facebook/imagepipeline/image/DefaultCloseableXml;->drawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public close()V
    .locals 1

    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Lcom/facebook/imagepipeline/image/DefaultCloseableXml;->drawable:Landroid/graphics/drawable/Drawable;

    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Lcom/facebook/imagepipeline/image/DefaultCloseableXml;->closed:Z

    return-void
.end method

.method public getHeight()I
    .locals 2

    .line 34
    iget-object v0, p0, Lcom/facebook/imagepipeline/image/DefaultCloseableXml;->drawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    if-ltz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public getSizeInBytes()I
    .locals 2

    .line 17
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/image/DefaultCloseableXml;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/facebook/imagepipeline/image/DefaultCloseableXml;->getHeight()I

    move-result v1

    mul-int v0, v0, v1

    mul-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public getWidth()I
    .locals 2

    .line 30
    iget-object v0, p0, Lcom/facebook/imagepipeline/image/DefaultCloseableXml;->drawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    if-ltz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public isClosed()Z
    .locals 1

    .line 26
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/image/DefaultCloseableXml;->closed:Z

    return v0
.end method
