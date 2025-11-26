.class public final Lcom/facebook/drawee/drawable/DrawableProperties;
.super Ljava/lang/Object;
.source "DrawableProperties.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/drawee/drawable/DrawableProperties$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u000c\u001a\u00020\r2\u0006\u0010\u0004\u001a\u00020\u0005J\u0010\u0010\u000e\u001a\u00020\r2\u0008\u0010\u0008\u001a\u0004\u0018\u00010\tJ\u000e\u0010\u000f\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\u0007J\u000e\u0010\u0010\u001a\u00020\r2\u0006\u0010\u000b\u001a\u00020\u0007J\u0012\u0010\u0011\u001a\u00020\r2\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u0013H\u0007R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0008\u001a\u0004\u0018\u00010\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/facebook/drawee/drawable/DrawableProperties;",
        "",
        "<init>",
        "()V",
        "alpha",
        "",
        "isSetColorFilter",
        "",
        "colorFilter",
        "Landroid/graphics/ColorFilter;",
        "dither",
        "filterBitmap",
        "setAlpha",
        "",
        "setColorFilter",
        "setDither",
        "setFilterBitmap",
        "applyTo",
        "drawable",
        "Landroid/graphics/drawable/Drawable;",
        "Companion",
        "drawee_release"
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
.field public static final Companion:Lcom/facebook/drawee/drawable/DrawableProperties$Companion;

.field private static final UNSET:I = -0x1


# instance fields
.field private alpha:I

.field private colorFilter:Landroid/graphics/ColorFilter;

.field private dither:I

.field private filterBitmap:I

.field private isSetColorFilter:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/drawee/drawable/DrawableProperties$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/drawee/drawable/DrawableProperties$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/drawee/drawable/DrawableProperties;->Companion:Lcom/facebook/drawee/drawable/DrawableProperties$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 20
    iput v0, p0, Lcom/facebook/drawee/drawable/DrawableProperties;->alpha:I

    .line 23
    iput v0, p0, Lcom/facebook/drawee/drawable/DrawableProperties;->dither:I

    .line 24
    iput v0, p0, Lcom/facebook/drawee/drawable/DrawableProperties;->filterBitmap:I

    return-void
.end method


# virtual methods
.method public final applyTo(Landroid/graphics/drawable/Drawable;)V
    .locals 4

    if-nez p1, :cond_0

    goto :goto_2

    .line 48
    :cond_0
    iget v0, p0, Lcom/facebook/drawee/drawable/DrawableProperties;->alpha:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 49
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 51
    :cond_1
    iget-boolean v0, p0, Lcom/facebook/drawee/drawable/DrawableProperties;->isSetColorFilter:Z

    if-eqz v0, :cond_2

    .line 52
    iget-object v0, p0, Lcom/facebook/drawee/drawable/DrawableProperties;->colorFilter:Landroid/graphics/ColorFilter;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 54
    :cond_2
    iget v0, p0, Lcom/facebook/drawee/drawable/DrawableProperties;->dither:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_4

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    .line 55
    :goto_0
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setDither(Z)V

    .line 57
    :cond_4
    iget v0, p0, Lcom/facebook/drawee/drawable/DrawableProperties;->filterBitmap:I

    if-eq v0, v1, :cond_6

    if-eqz v0, :cond_5

    goto :goto_1

    :cond_5
    const/4 v2, 0x0

    .line 58
    :goto_1
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    :cond_6
    :goto_2
    return-void
.end method

.method public final setAlpha(I)V
    .locals 0

    .line 27
    iput p1, p0, Lcom/facebook/drawee/drawable/DrawableProperties;->alpha:I

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 31
    iput-object p1, p0, Lcom/facebook/drawee/drawable/DrawableProperties;->colorFilter:Landroid/graphics/ColorFilter;

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 32
    :goto_0
    iput-boolean p1, p0, Lcom/facebook/drawee/drawable/DrawableProperties;->isSetColorFilter:Z

    return-void
.end method

.method public final setDither(Z)V
    .locals 0

    .line 36
    iput p1, p0, Lcom/facebook/drawee/drawable/DrawableProperties;->dither:I

    return-void
.end method

.method public final setFilterBitmap(Z)V
    .locals 0

    .line 40
    iput p1, p0, Lcom/facebook/drawee/drawable/DrawableProperties;->filterBitmap:I

    return-void
.end method
