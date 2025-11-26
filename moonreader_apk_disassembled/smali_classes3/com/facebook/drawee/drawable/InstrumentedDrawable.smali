.class public final Lcom/facebook/drawee/drawable/InstrumentedDrawable;
.super Lcom/facebook/drawee/drawable/ForwardingDrawable;
.source "InstrumentedDrawable.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/drawee/drawable/InstrumentedDrawable$Listener;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001:\u0001\u0011B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0010\u0010\u000c\u001a\u00020\t2\u0006\u0010\u0002\u001a\u00020\u0003H\u0002J\u0010\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0010H\u0016R\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Lcom/facebook/drawee/drawable/InstrumentedDrawable;",
        "Lcom/facebook/drawee/drawable/ForwardingDrawable;",
        "drawable",
        "Landroid/graphics/drawable/Drawable;",
        "listener",
        "Lcom/facebook/drawee/drawable/InstrumentedDrawable$Listener;",
        "<init>",
        "(Landroid/graphics/drawable/Drawable;Lcom/facebook/drawee/drawable/InstrumentedDrawable$Listener;)V",
        "_scaleType",
        "",
        "isChecked",
        "",
        "getScaleType",
        "draw",
        "",
        "canvas",
        "Landroid/graphics/Canvas;",
        "Listener",
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


# instance fields
.field private final _scaleType:Ljava/lang/String;

.field private isChecked:Z

.field private final listener:Lcom/facebook/drawee/drawable/InstrumentedDrawable$Listener;


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;Lcom/facebook/drawee/drawable/InstrumentedDrawable$Listener;)V
    .locals 1

    const-string v0, "drawable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-direct {p0, p1}, Lcom/facebook/drawee/drawable/ForwardingDrawable;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 15
    iput-object p2, p0, Lcom/facebook/drawee/drawable/InstrumentedDrawable;->listener:Lcom/facebook/drawee/drawable/InstrumentedDrawable$Listener;

    .line 18
    invoke-direct {p0, p1}, Lcom/facebook/drawee/drawable/InstrumentedDrawable;->getScaleType(Landroid/graphics/drawable/Drawable;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/drawee/drawable/InstrumentedDrawable;->_scaleType:Ljava/lang/String;

    return-void
.end method

.method private final getScaleType(Landroid/graphics/drawable/Drawable;)Ljava/lang/String;
    .locals 1

    .line 35
    instance-of v0, p1, Lcom/facebook/drawee/drawable/ScaleTypeDrawable;

    if-eqz v0, :cond_0

    .line 36
    check-cast p1, Lcom/facebook/drawee/drawable/ScaleTypeDrawable;

    invoke-virtual {p1}, Lcom/facebook/drawee/drawable/ScaleTypeDrawable;->getScaleType()Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 39
    :cond_0
    const-string p1, "none"

    return-object p1
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 10

    const-string v0, "canvas"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    iget-boolean v0, p0, Lcom/facebook/drawee/drawable/InstrumentedDrawable;->isChecked:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 44
    iput-boolean v0, p0, Lcom/facebook/drawee/drawable/InstrumentedDrawable;->isChecked:Z

    .line 45
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 46
    invoke-virtual {p0, v0}, Lcom/facebook/drawee/drawable/InstrumentedDrawable;->getRootBounds(Landroid/graphics/RectF;)V

    .line 47
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    float-to-int v3, v1

    .line 48
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v1

    float-to-int v4, v1

    .line 49
    invoke-virtual {p0, v0}, Lcom/facebook/drawee/drawable/InstrumentedDrawable;->getTransformedBounds(Landroid/graphics/RectF;)V

    .line 50
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    float-to-int v7, v1

    .line 51
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    float-to-int v8, v0

    .line 52
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/InstrumentedDrawable;->getIntrinsicWidth()I

    move-result v5

    .line 53
    invoke-virtual {p0}, Lcom/facebook/drawee/drawable/InstrumentedDrawable;->getIntrinsicHeight()I

    move-result v6

    .line 54
    iget-object v2, p0, Lcom/facebook/drawee/drawable/InstrumentedDrawable;->listener:Lcom/facebook/drawee/drawable/InstrumentedDrawable$Listener;

    if-eqz v2, :cond_0

    .line 55
    iget-object v9, p0, Lcom/facebook/drawee/drawable/InstrumentedDrawable;->_scaleType:Ljava/lang/String;

    .line 54
    invoke-interface/range {v2 .. v9}, Lcom/facebook/drawee/drawable/InstrumentedDrawable$Listener;->track(IIIIIILjava/lang/String;)V

    .line 57
    :cond_0
    invoke-super {p0, p1}, Lcom/facebook/drawee/drawable/ForwardingDrawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method
