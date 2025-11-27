.class public final Landroidx/window/core/layout/WindowSizeClass$Companion;
.super Ljava/lang/Object;
.source "WindowSizeClass.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/window/core/layout/WindowSizeClass;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0010\u0007\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0018\u0010\u000e\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0010H\u0007R\u0016\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u00048\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0008X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0008X\u0086T\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0008X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0008X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Landroidx/window/core/layout/WindowSizeClass$Companion;",
        "",
        "()V",
        "BREAKPOINTS_V1",
        "",
        "Landroidx/window/core/layout/WindowSizeClass;",
        "HEIGHT_DP_BREAKPOINTS_V1",
        "",
        "",
        "HEIGHT_DP_EXPANDED_LOWER_BOUND",
        "HEIGHT_DP_MEDIUM_LOWER_BOUND",
        "WIDTH_DP_BREAKPOINTS_V1",
        "WIDTH_DP_EXPANDED_LOWER_BOUND",
        "WIDTH_DP_MEDIUM_LOWER_BOUND",
        "compute",
        "dpWidth",
        "",
        "dpHeight",
        "window-core"
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

    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Landroidx/window/core/layout/WindowSizeClass$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final compute(FF)Landroidx/window/core/layout/WindowSizeClass;
    .locals 2
    .annotation runtime Lkotlin/Deprecated;
        message = "Use computeWindowSizeClass instead."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "BREAKPOINTS_V1.computeWindowSizeClass(widthDp = dpWidth, heightDp = dpHeight)"
            imports = {
                "androidx.window.core.layout.computeWindowSizeClass"
            }
        .end subannotation
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const/high16 v0, 0x44520000    # 840.0f

    const/4 v1, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/16 p1, 0x348

    goto :goto_0

    :cond_0
    const/high16 v0, 0x44160000    # 600.0f

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_1

    const/16 p1, 0x258

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    const/high16 v0, 0x44610000    # 900.0f

    cmpl-float v0, p2, v0

    if-ltz v0, :cond_2

    const/16 v1, 0x384

    goto :goto_1

    :cond_2
    const/high16 v0, 0x43f00000    # 480.0f

    cmpl-float p2, p2, v0

    if-ltz p2, :cond_3

    const/16 v1, 0x1e0

    .line 206
    :cond_3
    :goto_1
    new-instance p2, Landroidx/window/core/layout/WindowSizeClass;

    invoke-direct {p2, p1, v1}, Landroidx/window/core/layout/WindowSizeClass;-><init>(II)V

    return-object p2
.end method
