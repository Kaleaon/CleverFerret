.class public final Landroidx/window/embedding/DividerAttributes$Companion;
.super Ljava/lang/Object;
.source "DividerAttributes.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/window/embedding/DividerAttributes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J5\u0010\u000c\u001a\u00020\u00082\u0006\u0010\r\u001a\u00020\u00042\u0006\u0010\u000e\u001a\u00020\u00042\u0006\u0010\u000f\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u00062\u0006\u0010\u0011\u001a\u00020\u0006H\u0000\u00a2\u0006\u0002\u0008\u0012J\u0012\u0010\u0013\u001a\u00020\u00142\u0008\u0008\u0001\u0010\u000f\u001a\u00020\u0004H\u0002J\u0010\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000e\u001a\u00020\u0004H\u0002J%\u0010\u0016\u001a\u00020\u00142\u0006\u0010\r\u001a\u00020\u00042\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u0018H\u0000\u00a2\u0006\u0002\u0008\u001aJ\u000c\u0010\u001b\u001a\u00020\u0004*\u00020\u0004H\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0080T\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u00020\u00088\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0080T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001c"
    }
    d2 = {
        "Landroidx/window/embedding/DividerAttributes$Companion;",
        "",
        "()V",
        "COLOR_SYSTEM_DEFAULT",
        "",
        "DRAG_RANGE_VALUE_UNSPECIFIED",
        "",
        "NO_DIVIDER",
        "Landroidx/window/embedding/DividerAttributes;",
        "TYPE_VALUE_DRAGGABLE",
        "TYPE_VALUE_FIXED",
        "WIDTH_SYSTEM_DEFAULT",
        "createDividerAttributes",
        "type",
        "widthDp",
        "color",
        "dragRangeMinRatio",
        "dragRangeMaxRatio",
        "createDividerAttributes$window_release",
        "validateColor",
        "",
        "validateWidth",
        "validateXmlDividerAttributes",
        "hasDragRangeMinRatio",
        "",
        "hasDragRangeMaxRatio",
        "validateXmlDividerAttributes$window_release",
        "alpha",
        "window_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 310
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Landroidx/window/embedding/DividerAttributes$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$validateColor(Landroidx/window/embedding/DividerAttributes$Companion;I)V
    .locals 0

    .line 310
    invoke-direct {p0, p1}, Landroidx/window/embedding/DividerAttributes$Companion;->validateColor(I)V

    return-void
.end method

.method public static final synthetic access$validateWidth(Landroidx/window/embedding/DividerAttributes$Companion;I)V
    .locals 0

    .line 310
    invoke-direct {p0, p1}, Landroidx/window/embedding/DividerAttributes$Companion;->validateWidth(I)V

    return-void
.end method

.method private final alpha(I)I
    .locals 0

    ushr-int/lit8 p1, p1, 0x18

    return p1
.end method

.method private final validateColor(I)V
    .locals 2

    .line 396
    move-object v0, p0

    check-cast v0, Landroidx/window/embedding/DividerAttributes$Companion;

    .line 397
    invoke-direct {p0, p1}, Landroidx/window/embedding/DividerAttributes$Companion;->alpha(I)I

    move-result v0

    const/16 v1, 0xff

    if-ne v0, v1, :cond_0

    return-void

    .line 398
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Divider color must be opaque. Got: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 397
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final validateWidth(I)V
    .locals 2

    .line 390
    move-object v0, p0

    check-cast v0, Landroidx/window/embedding/DividerAttributes$Companion;

    const/4 v0, -0x1

    if-eq p1, v0, :cond_1

    if-ltz p1, :cond_0

    goto :goto_0

    .line 392
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "widthDp must be greater than or equal to 0 or WIDTH_SYSTEM_DEFAULT. Got: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 391
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public final createDividerAttributes$window_release(IIIFF)Landroidx/window/embedding/DividerAttributes;
    .locals 1

    if-eqz p1, :cond_3

    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 351
    new-instance p1, Landroidx/window/embedding/DividerAttributes$DraggableDividerAttributes$Builder;

    invoke-direct {p1}, Landroidx/window/embedding/DividerAttributes$DraggableDividerAttributes$Builder;-><init>()V

    invoke-virtual {p1, p2}, Landroidx/window/embedding/DividerAttributes$DraggableDividerAttributes$Builder;->setWidthDp(I)Landroidx/window/embedding/DividerAttributes$DraggableDividerAttributes$Builder;

    move-result-object p1

    invoke-virtual {p1, p3}, Landroidx/window/embedding/DividerAttributes$DraggableDividerAttributes$Builder;->setColor(I)Landroidx/window/embedding/DividerAttributes$DraggableDividerAttributes$Builder;

    move-result-object p1

    const/high16 p2, -0x40800000    # -1.0f

    cmpg-float p3, p4, p2

    if-nez p3, :cond_0

    goto :goto_0

    :cond_0
    cmpg-float p2, p5, p2

    if-nez p2, :cond_1

    .line 356
    :goto_0
    sget-object p2, Landroidx/window/embedding/DividerAttributes$DragRange;->DRAG_RANGE_SYSTEM_DEFAULT:Landroidx/window/embedding/DividerAttributes$DragRange;

    invoke-virtual {p1, p2}, Landroidx/window/embedding/DividerAttributes$DraggableDividerAttributes$Builder;->setDragRange(Landroidx/window/embedding/DividerAttributes$DragRange;)Landroidx/window/embedding/DividerAttributes$DraggableDividerAttributes$Builder;

    goto :goto_1

    .line 360
    :cond_1
    new-instance p2, Landroidx/window/embedding/DividerAttributes$DragRange$SplitRatioDragRange;

    invoke-direct {p2, p4, p5}, Landroidx/window/embedding/DividerAttributes$DragRange$SplitRatioDragRange;-><init>(FF)V

    check-cast p2, Landroidx/window/embedding/DividerAttributes$DragRange;

    .line 359
    invoke-virtual {p1, p2}, Landroidx/window/embedding/DividerAttributes$DraggableDividerAttributes$Builder;->setDragRange(Landroidx/window/embedding/DividerAttributes$DragRange;)Landroidx/window/embedding/DividerAttributes$DraggableDividerAttributes$Builder;

    .line 363
    :goto_1
    invoke-virtual {p1}, Landroidx/window/embedding/DividerAttributes$DraggableDividerAttributes$Builder;->build()Landroidx/window/embedding/DividerAttributes$DraggableDividerAttributes;

    move-result-object p1

    check-cast p1, Landroidx/window/embedding/DividerAttributes;

    return-object p1

    .line 365
    :cond_2
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string p4, "Got unknown divider type "

    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 p1, 0x21

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 348
    :cond_3
    new-instance p1, Landroidx/window/embedding/DividerAttributes$FixedDividerAttributes$Builder;

    invoke-direct {p1}, Landroidx/window/embedding/DividerAttributes$FixedDividerAttributes$Builder;-><init>()V

    invoke-virtual {p1, p2}, Landroidx/window/embedding/DividerAttributes$FixedDividerAttributes$Builder;->setWidthDp(I)Landroidx/window/embedding/DividerAttributes$FixedDividerAttributes$Builder;

    move-result-object p1

    invoke-virtual {p1, p3}, Landroidx/window/embedding/DividerAttributes$FixedDividerAttributes$Builder;->setColor(I)Landroidx/window/embedding/DividerAttributes$FixedDividerAttributes$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/window/embedding/DividerAttributes$FixedDividerAttributes$Builder;->build()Landroidx/window/embedding/DividerAttributes$FixedDividerAttributes;

    move-result-object p1

    check-cast p1, Landroidx/window/embedding/DividerAttributes;

    return-object p1
.end method

.method public final validateXmlDividerAttributes$window_release(IZZ)V
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    if-nez p2, :cond_2

    if-nez p3, :cond_1

    :goto_0
    return-void

    .line 384
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 385
    const-string p2, "Fixed divider does not allow attribute dragRangeMaxRatio!"

    .line 384
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 379
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 380
    const-string p2, "Fixed divider does not allow attribute dragRangeMinRatio!"

    .line 379
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
