.class abstract Lcom/radaee/reader/GLView$TouchRunnable;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/reader/GLView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "TouchRunnable"
.end annotation


# instance fields
.field private final pts:[F

.field private pts_cur:I

.field private pts_end:I


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1062
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x100

    .line 1063
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/radaee/reader/GLView$TouchRunnable;->pts:[F

    const/4 v0, 0x0

    .line 1064
    iput v0, p0, Lcom/radaee/reader/GLView$TouchRunnable;->pts_cur:I

    .line 1065
    iput v0, p0, Lcom/radaee/reader/GLView$TouchRunnable;->pts_end:I

    return-void
.end method


# virtual methods
.method protected get_x()F
    .locals 2

    .line 1076
    iget-object v0, p0, Lcom/radaee/reader/GLView$TouchRunnable;->pts:[F

    iget v1, p0, Lcom/radaee/reader/GLView$TouchRunnable;->pts_cur:I

    aget v0, v0, v1

    return v0
.end method

.method protected get_y()F
    .locals 2

    .line 1080
    iget-object v0, p0, Lcom/radaee/reader/GLView$TouchRunnable;->pts:[F

    iget v1, p0, Lcom/radaee/reader/GLView$TouchRunnable;->pts_cur:I

    add-int/lit8 v1, v1, 0x1

    aget v0, v0, v1

    return v0
.end method

.method public new_point(FF)V
    .locals 2

    .line 1069
    iget-object v0, p0, Lcom/radaee/reader/GLView$TouchRunnable;->pts:[F

    iget v1, p0, Lcom/radaee/reader/GLView$TouchRunnable;->pts_end:I

    aput p1, v0, v1

    add-int/lit8 p1, v1, 0x1

    .line 1070
    aput p2, v0, p1

    add-int/lit8 v1, v1, 0x2

    and-int/lit16 p1, v1, 0xff

    .line 1072
    iput p1, p0, Lcom/radaee/reader/GLView$TouchRunnable;->pts_end:I

    return-void
.end method

.method protected next()V
    .locals 1

    .line 1084
    iget v0, p0, Lcom/radaee/reader/GLView$TouchRunnable;->pts_cur:I

    add-int/lit8 v0, v0, 0x2

    and-int/lit16 v0, v0, 0xff

    .line 1085
    iput v0, p0, Lcom/radaee/reader/GLView$TouchRunnable;->pts_cur:I

    return-void
.end method
