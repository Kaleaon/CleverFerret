.class Lcom/flyersoft/views/NewCurl3D$Render3D;
.super Ljava/lang/Object;
.source "NewCurl3D.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/NewCurl3D;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Render3D"
.end annotation


# static fields
.field public static final PAGE_LEFT:I = 0x1

.field public static final PAGE_RIGHT:I = 0x2


# instance fields
.field private USE_PERSPECTIVE_PROJECTION:Z

.field private mCurlMeshes:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D;",
            ">;"
        }
    .end annotation
.end field

.field private mMargins:Landroid/graphics/RectF;

.field private mObserver:Lcom/flyersoft/views/NewCurl3D$Observer3D;

.field private mPageRectLeft:Landroid/graphics/RectF;

.field private mPageRectRight:Landroid/graphics/RectF;

.field private mViewRect:Landroid/graphics/RectF;

.field private mViewportHeight:I

.field private mViewportWidth:I

.field final synthetic this$0:Lcom/flyersoft/views/NewCurl3D;


# direct methods
.method public constructor <init>(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/NewCurl3D$Observer3D;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 699
    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 688
    iget p1, p1, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->USE_PERSPECTIVE_PROJECTION:Z

    .line 689
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    .line 690
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mMargins:Landroid/graphics/RectF;

    .line 700
    iput-object p2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mObserver:Lcom/flyersoft/views/NewCurl3D$Observer3D;

    .line 701
    new-instance p1, Ljava/util/Vector;

    invoke-direct {p1}, Ljava/util/Vector;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mCurlMeshes:Ljava/util/Vector;

    .line 702
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectLeft:Landroid/graphics/RectF;

    .line 703
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    return-void
.end method

.method private updatePageRects()V
    .locals 5

    .line 893
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    goto/16 :goto_0

    .line 895
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-boolean v0, v0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-nez v0, :cond_1

    .line 896
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 897
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    iget v2, v0, Landroid/graphics/RectF;->left:F

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mMargins:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    mul-float v3, v3, v4

    add-float/2addr v2, v3

    iput v2, v0, Landroid/graphics/RectF;->left:F

    .line 898
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    iget v2, v0, Landroid/graphics/RectF;->right:F

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mMargins:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    mul-float v3, v3, v4

    sub-float/2addr v2, v3

    iput v2, v0, Landroid/graphics/RectF;->right:F

    .line 899
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    iget v2, v0, Landroid/graphics/RectF;->top:F

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mMargins:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    mul-float v3, v3, v4

    add-float/2addr v2, v3

    iput v2, v0, Landroid/graphics/RectF;->top:F

    .line 900
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    iget v2, v0, Landroid/graphics/RectF;->bottom:F

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mMargins:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    mul-float v3, v3, v4

    sub-float/2addr v2, v3

    iput v2, v0, Landroid/graphics/RectF;->bottom:F

    .line 901
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectLeft:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    invoke-virtual {v0, v2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 902
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectLeft:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {v0, v2, v1}, Landroid/graphics/RectF;->offset(FF)V

    return-void

    .line 903
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-boolean v0, v0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz v0, :cond_2

    .line 904
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 905
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mMargins:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    mul-float v2, v2, v3

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 906
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->right:F

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mMargins:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    mul-float v2, v2, v3

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 907
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->top:F

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mMargins:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    mul-float v2, v2, v3

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 908
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->bottom:F

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mMargins:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    mul-float v2, v2, v3

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 909
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectLeft:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 910
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectLeft:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->right:F

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectLeft:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    add-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 911
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectLeft:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    iput v1, v0, Landroid/graphics/RectF;->left:F

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public declared-synchronized addCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V
    .locals 1

    monitor-enter p0

    .line 707
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/NewCurl3D$Render3D;->removeCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    .line 708
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mCurlMeshes:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 709
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public getPageRect(I)Landroid/graphics/RectF;
    .locals 1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 713
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectLeft:Landroid/graphics/RectF;

    return-object p1

    :cond_0
    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    .line 715
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mPageRectRight:Landroid/graphics/RectF;

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public declared-synchronized onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 0

    monitor-enter p0

    .line 723
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/NewCurl3D$Render3D;->onDrawFrameLocked(Ljavax/microedition/khronos/opengles/GL10;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 725
    :try_start_1
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 730
    :goto_0
    monitor-exit p0

    return-void

    :catchall_1
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1
.end method

.method public declared-synchronized onDrawFrameLocked(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 8

    monitor-enter p0

    .line 733
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mObserver:Lcom/flyersoft/views/NewCurl3D$Observer3D;

    invoke-interface {v0}, Lcom/flyersoft/views/NewCurl3D$Observer3D;->onDrawFrame()V

    const/16 v0, 0x4000

    .line 734
    invoke-interface {p1, v0}, Ljavax/microedition/khronos/opengles/GL10;->glClear(I)V

    .line 735
    invoke-interface {p1}, Ljavax/microedition/khronos/opengles/GL10;->glLoadIdentity()V

    .line 736
    iget-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->USE_PERSPECTIVE_PROJECTION:Z

    if-eqz v0, :cond_0

    .line 737
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmFOV(Lcom/flyersoft/views/NewCurl3D;)F

    move-result v0

    float-to-double v0, v0

    const-wide v2, 0x400921fb54442d18L    # Math.PI

    mul-double v0, v0, v2

    const-wide v2, 0x4066800000000000L    # 180.0

    div-double/2addr v0, v2

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->tan(D)D

    move-result-wide v0

    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    div-double/2addr v2, v0

    double-to-float v0, v2

    const/4 v1, 0x0

    invoke-interface {p1, v1, v1, v0}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 739
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mCurlMeshes:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 740
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mCurlMeshes:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {v2, p1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->generateTexture(Ljavax/microedition/khronos/opengles/GL10;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 742
    :goto_1
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mCurlMeshes:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 743
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v2, v2, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    if-nez v2, :cond_2

    .line 744
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mCurlMeshes:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-boolean v3, v3, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    invoke-virtual {v2, p1, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->drawiBook(Ljavax/microedition/khronos/opengles/GL10;Z)V

    goto :goto_2

    .line 746
    :cond_2
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mCurlMeshes:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-boolean v3, v3, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    invoke-static {v2, p1, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->-$$Nest$mdrawGoogleBook(Lcom/flyersoft/views/NewCurl3D$Mesh3D;Ljavax/microedition/khronos/opengles/GL10;Z)V

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 750
    :cond_3
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-object v1, v1, Lcom/flyersoft/views/NewCurl3D;->curl3dCover:Lcom/flyersoft/views/FlipImageView;

    const/4 v2, 0x1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v1, v1, Lcom/flyersoft/views/NewCurl3D;->renderState:I

    if-nez v1, :cond_4

    .line 751
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iput v2, v1, Lcom/flyersoft/views/NewCurl3D;->renderState:I

    .line 752
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-object v1, v1, Lcom/flyersoft/views/NewCurl3D;->curl3dCover:Lcom/flyersoft/views/FlipImageView;

    iget-boolean v1, v1, Lcom/flyersoft/views/FlipImageView;->isCoverShow:Z

    if-nez v1, :cond_4

    .line 753
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    new-instance v3, Lcom/flyersoft/views/NewCurl3D$Render3D$1;

    invoke-direct {v3, p0}, Lcom/flyersoft/views/NewCurl3D$Render3D$1;-><init>(Lcom/flyersoft/views/NewCurl3D$Render3D;)V

    invoke-virtual {v1, v3}, Lcom/flyersoft/views/NewCurl3D;->post(Ljava/lang/Runnable;)Z

    .line 763
    :cond_4
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-boolean v1, v1, Lcom/flyersoft/views/NewCurl3D;->mAnimate:Z

    const-wide/16 v3, 0x0

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmAnimationStartTime(Lcom/flyersoft/views/NewCurl3D;)J

    move-result-wide v5

    cmp-long v1, v5, v3

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v1, v1, Lcom/flyersoft/views/NewCurl3D;->renderState:I

    if-eq v1, v2, :cond_5

    .line 764
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {v1, v5, v6}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputmAnimationStartTime(Lcom/flyersoft/views/NewCurl3D;J)V

    .line 767
    :cond_5
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualPageAnimateState(Lcom/flyersoft/views/NewCurl3D;)J

    move-result-wide v1

    const-wide/16 v5, 0x1

    cmp-long v7, v1, v5

    if-lez v7, :cond_6

    .line 768
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {p1, v5, v6}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputdualPageAnimateState(Lcom/flyersoft/views/NewCurl3D;J)V

    goto/16 :goto_4

    .line 769
    :cond_6
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualPageAnimateState(Lcom/flyersoft/views/NewCurl3D;)J

    move-result-wide v1

    cmp-long v7, v1, v5

    if-nez v7, :cond_8

    .line 770
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v1, v3, v4}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputdualPageAnimateState(Lcom/flyersoft/views/NewCurl3D;J)V

    .line 771
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputdualPageCacheTime(Lcom/flyersoft/views/NewCurl3D;J)V

    .line 772
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualCache1(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v1

    if-nez v1, :cond_7

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualCache2(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v1, :cond_7

    .line 774
    :try_start_1
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPageLeft(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualCache1(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v1, v3, v0, v2}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setBitmap(IILandroid/graphics/Bitmap;)V

    .line 775
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPageLeft(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->-$$Nest$fgetmTextureIds(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)[I

    move-result-object v1

    aget v1, v1, v0

    const/16 v2, 0xde1

    invoke-interface {p1, v2, v1}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 776
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPageLeft(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    move-result-object v1

    iget-object v1, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object v1, v1, v0

    invoke-static {v2, v0, v1, v0}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 777
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPageRight(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    move-result-object v1

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualCache2(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {v1, v4, v0, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setBitmap(IILandroid/graphics/Bitmap;)V

    .line 778
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPageRight(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->-$$Nest$fgetmTextureIds(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)[I

    move-result-object v1

    aget v1, v1, v0

    invoke-interface {p1, v2, v1}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 779
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {p1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPageRight(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    move-result-object p1

    iget-object p1, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object p1, p1, v0

    invoke-static {v2, v0, p1, v0}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception p1

    .line 781
    :try_start_2
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 783
    :cond_7
    :goto_3
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    const-wide/16 v1, -0x1

    invoke-static {p1, v1, v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputdualPageCacheTime(Lcom/flyersoft/views/NewCurl3D;J)V

    .line 784
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {p1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualCache1(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 785
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {p1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetdualCache2(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 786
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {p1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPageLeft(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    move-result-object p1

    iget-object p1, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object p1, p1, v0

    invoke-static {p1}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 787
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {p1}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmPageRight(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    move-result-object p1

    iget-object p1, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object p1, p1, v0

    invoke-static {p1}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 789
    :cond_8
    :goto_4
    monitor-exit p0

    return-void

    :catchall_1
    move-exception p1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 26

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move/from16 v2, p2

    move/from16 v3, p3

    const/4 v4, 0x0

    .line 794
    :try_start_0
    invoke-interface {v0, v4, v4, v2, v3}, Ljavax/microedition/khronos/opengles/GL10;->glViewport(IIII)V

    .line 795
    iput v2, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewportWidth:I

    .line 796
    iput v3, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewportHeight:I

    .line 798
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v4, v4, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    const/4 v5, 0x1

    const/high16 v6, 0x42c80000    # 100.0f

    const/16 v7, 0x1701

    const/high16 v8, -0x40800000    # -1.0f

    const/high16 v9, 0x3f800000    # 1.0f

    const v10, 0x3dcccccd    # 0.1f

    if-ne v4, v5, :cond_4

    .line 799
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    if-le v2, v3, :cond_0

    const/high16 v5, 0x41f00000    # 30.0f

    goto :goto_0

    :cond_0
    const/high16 v5, 0x42340000    # 45.0f

    :goto_0
    invoke-static {v4, v5}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputmFOV(Lcom/flyersoft/views/NewCurl3D;F)V

    int-to-float v4, v2

    int-to-float v5, v3

    div-float v14, v4, v5

    .line 802
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iput v9, v4, Landroid/graphics/RectF;->top:F

    .line 803
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iput v8, v4, Landroid/graphics/RectF;->bottom:F

    .line 804
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    neg-float v5, v14

    iput v5, v4, Landroid/graphics/RectF;->left:F

    .line 805
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iput v14, v4, Landroid/graphics/RectF;->right:F

    .line 806
    invoke-direct {v1}, Lcom/flyersoft/views/NewCurl3D$Render3D;->updatePageRects()V

    .line 807
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    new-instance v5, Lcom/flyersoft/views/GoogleBook3D;

    const/high16 v8, 0x40000000    # 2.0f

    mul-float v9, v14, v8

    iget-object v11, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v11}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmFOV(Lcom/flyersoft/views/NewCurl3D;)F

    move-result v11

    invoke-direct {v5, v9, v11}, Lcom/flyersoft/views/GoogleBook3D;-><init>(FF)V

    invoke-static {v4, v5}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputmGB(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/GoogleBook3D;)V

    .line 808
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    new-instance v5, Lcom/flyersoft/views/GoogleBook3D;

    iget-object v11, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v11}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmFOV(Lcom/flyersoft/views/NewCurl3D;)F

    move-result v11

    invoke-direct {v5, v9, v11}, Lcom/flyersoft/views/GoogleBook3D;-><init>(FF)V

    invoke-static {v4, v5}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputmGBBg(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/GoogleBook3D;)V

    .line 809
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    new-instance v5, Lcom/flyersoft/views/GoogleBook3D;

    iget-object v11, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v11}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmFOV(Lcom/flyersoft/views/NewCurl3D;)F

    move-result v11

    invoke-direct {v5, v9, v11}, Lcom/flyersoft/views/GoogleBook3D;-><init>(FF)V

    invoke-static {v4, v5}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputmGBShadow(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/GoogleBook3D;)V

    .line 810
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    new-instance v5, Lcom/flyersoft/views/GoogleBook3D;

    iget-object v11, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v11}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmFOV(Lcom/flyersoft/views/NewCurl3D;)F

    move-result v11

    invoke-direct {v5, v9, v11}, Lcom/flyersoft/views/GoogleBook3D;-><init>(FF)V

    invoke-static {v4, v5}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputmGBBgLeft(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/GoogleBook3D;)V

    .line 811
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    new-instance v5, Lcom/flyersoft/views/GoogleBook3D;

    iget-object v11, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v11}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmFOV(Lcom/flyersoft/views/NewCurl3D;)F

    move-result v11

    invoke-direct {v5, v9, v11}, Lcom/flyersoft/views/GoogleBook3D;-><init>(FF)V

    invoke-static {v4, v5}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputmGBBgRight(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/GoogleBook3D;)V

    .line 812
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v4}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v15

    const/high16 v4, 0x42480000    # 50.0f

    div-float v4, v14, v4

    mul-float v18, v4, v8

    const/high16 v20, -0x3e380000    # -25.0f

    const/16 v21, 0x0

    const/16 v16, 0x32

    const/16 v17, 0x1

    const/high16 v19, 0x40000000    # 2.0f

    invoke-virtual/range {v15 .. v21}, Lcom/flyersoft/views/GoogleBook3D;->generate(IIFFFZ)V

    .line 813
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v4}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGBBg(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v15

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v16, 0x1

    const/16 v17, 0x1

    const/high16 v19, 0x40000000    # 2.0f

    move/from16 v18, v9

    invoke-virtual/range {v15 .. v21}, Lcom/flyersoft/views/GoogleBook3D;->generate(IIFFFZ)V

    if-le v2, v3, :cond_1

    const v2, 0x3d4ccccd    # 0.05f

    goto :goto_1

    :cond_1
    const v2, 0x3dcccccd    # 0.1f

    .line 816
    :goto_1
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGBShadow(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v19

    const/4 v3, 0x3

    int-to-float v4, v3

    div-float v9, v18, v4

    mul-float v22, v9, v2

    const/16 v24, 0x0

    const/16 v25, 0x1

    const/16 v21, 0x1

    const/high16 v23, 0x40000000    # 2.0f

    const/16 v20, 0x3

    invoke-virtual/range {v19 .. v25}, Lcom/flyersoft/views/GoogleBook3D;->generate(IIFFFZ)V

    .line 817
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v2

    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGBShadow(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/flyersoft/views/GoogleBook3D;->attachShadow(Lcom/flyersoft/views/GoogleBook3D;)V

    .line 819
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGBBgLeft(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v11

    const/high16 v16, -0x40800000    # -1.0f

    const/16 v17, 0x0

    const/4 v12, 0x1

    const/4 v13, 0x1

    const/high16 v15, 0x40000000    # 2.0f

    invoke-virtual/range {v11 .. v17}, Lcom/flyersoft/views/GoogleBook3D;->generate(IIFFFZ)V

    .line 820
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-boolean v2, v2, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz v2, :cond_2

    .line 821
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGBBgRight(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v11

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/4 v12, 0x1

    const/4 v13, 0x1

    const/high16 v15, 0x40000000    # 2.0f

    invoke-virtual/range {v11 .. v17}, Lcom/flyersoft/views/GoogleBook3D;->generate(IIFFFZ)V

    goto :goto_2

    .line 823
    :cond_2
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGBBgRight(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v15

    const/high16 v20, -0x41000000    # -0.5f

    const/16 v21, 0x0

    const/16 v16, 0x1

    const/16 v17, 0x1

    const/high16 v19, 0x40000000    # 2.0f

    invoke-virtual/range {v15 .. v21}, Lcom/flyersoft/views/GoogleBook3D;->generate(IIFFFZ)V

    .line 826
    :goto_2
    invoke-interface {v0, v7}, Ljavax/microedition/khronos/opengles/GL10;->glMatrixMode(I)V

    .line 827
    invoke-interface {v0}, Ljavax/microedition/khronos/opengles/GL10;->glLoadIdentity()V

    .line 828
    iget-boolean v2, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->USE_PERSPECTIVE_PROJECTION:Z

    if-eqz v2, :cond_3

    .line 829
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmFOV(Lcom/flyersoft/views/NewCurl3D;)F

    move-result v2

    invoke-static {v0, v2, v14, v10, v6}, Landroid/opengl/GLU;->gluPerspective(Ljavax/microedition/khronos/opengles/GL10;FFFF)V

    goto :goto_3

    .line 831
    :cond_3
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    iget-object v5, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    invoke-static {v0, v2, v3, v4, v5}, Landroid/opengl/GLU;->gluOrtho2D(Ljavax/microedition/khronos/opengles/GL10;FFFF)V

    goto :goto_3

    :cond_4
    int-to-float v2, v2

    int-to-float v3, v3

    div-float/2addr v2, v3

    .line 835
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iput v9, v3, Landroid/graphics/RectF;->top:F

    .line 836
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iput v8, v3, Landroid/graphics/RectF;->bottom:F

    .line 837
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    neg-float v4, v2

    iput v4, v3, Landroid/graphics/RectF;->left:F

    .line 838
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iput v2, v3, Landroid/graphics/RectF;->right:F

    .line 839
    invoke-direct {v1}, Lcom/flyersoft/views/NewCurl3D$Render3D;->updatePageRects()V

    .line 841
    invoke-interface {v0, v7}, Ljavax/microedition/khronos/opengles/GL10;->glMatrixMode(I)V

    .line 842
    invoke-interface {v0}, Ljavax/microedition/khronos/opengles/GL10;->glLoadIdentity()V

    .line 843
    iget-boolean v3, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->USE_PERSPECTIVE_PROJECTION:Z

    if-eqz v3, :cond_5

    const/high16 v3, 0x41a00000    # 20.0f

    .line 844
    invoke-static {v0, v3, v2, v10, v6}, Landroid/opengl/GLU;->gluPerspective(Ljavax/microedition/khronos/opengles/GL10;FFFF)V

    goto :goto_3

    .line 846
    :cond_5
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    iget-object v5, v1, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    invoke-static {v0, v2, v3, v4, v5}, Landroid/opengl/GLU;->gluOrtho2D(Ljavax/microedition/khronos/opengles/GL10;FFFF)V

    :goto_3
    const/16 v2, 0x1700

    .line 850
    invoke-interface {v0, v2}, Ljavax/microedition/khronos/opengles/GL10;->glMatrixMode(I)V

    .line 851
    invoke-interface {v0}, Ljavax/microedition/khronos/opengles/GL10;->glLoadIdentity()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 853
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 1

    const/4 p2, 0x0

    const/high16 v0, 0x3f800000    # 1.0f

    .line 858
    invoke-interface {p1, p2, p2, p2, v0}, Ljavax/microedition/khronos/opengles/GL10;->glClearColor(FFFF)V

    const/16 p2, 0x1d01

    .line 859
    invoke-interface {p1, p2}, Ljavax/microedition/khronos/opengles/GL10;->glShadeModel(I)V

    const/16 p2, 0xc50

    const/16 v0, 0x1102

    .line 860
    invoke-interface {p1, p2, v0}, Ljavax/microedition/khronos/opengles/GL10;->glHint(II)V

    const/16 p2, 0xc52

    .line 861
    invoke-interface {p1, p2, v0}, Ljavax/microedition/khronos/opengles/GL10;->glHint(II)V

    const/16 p2, 0xc53

    .line 862
    invoke-interface {p1, p2, v0}, Ljavax/microedition/khronos/opengles/GL10;->glHint(II)V

    const/16 p2, 0xb20

    .line 863
    invoke-interface {p1, p2}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    const/16 p2, 0xb71

    .line 864
    invoke-interface {p1, p2}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    const/16 p2, 0xb44

    .line 865
    invoke-interface {p1, p2}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    const/16 p2, 0xbd0

    .line 866
    invoke-interface {p1, p2}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 867
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mObserver:Lcom/flyersoft/views/NewCurl3D$Observer3D;

    invoke-interface {p1}, Lcom/flyersoft/views/NewCurl3D$Observer3D;->onSurfaceCreated()V

    return-void
.end method

.method public declared-synchronized removeCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V
    .locals 1

    monitor-enter p0

    .line 871
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mCurlMeshes:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 872
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized setMargins(FFFF)V
    .locals 1

    monitor-enter p0

    .line 875
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mMargins:Landroid/graphics/RectF;

    iput p1, v0, Landroid/graphics/RectF;->left:F

    .line 876
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mMargins:Landroid/graphics/RectF;

    iput p2, p1, Landroid/graphics/RectF;->top:F

    .line 877
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mMargins:Landroid/graphics/RectF;

    iput p3, p1, Landroid/graphics/RectF;->right:F

    .line 878
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mMargins:Landroid/graphics/RectF;

    iput p4, p1, Landroid/graphics/RectF;->bottom:F

    .line 879
    invoke-direct {p0}, Lcom/flyersoft/views/NewCurl3D$Render3D;->updatePageRects()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 880
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized setViewMode(Z)V
    .locals 1

    monitor-enter p0

    .line 883
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iput-boolean p1, v0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    .line 884
    invoke-direct {p0}, Lcom/flyersoft/views/NewCurl3D$Render3D;->updatePageRects()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 885
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public translate(Landroid/graphics/PointF;)V
    .locals 3

    .line 888
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    iget v2, p1, Landroid/graphics/PointF;->x:F

    mul-float v1, v1, v2

    iget v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewportWidth:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/PointF;->x:F

    .line 889
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    neg-float v1, v1

    iget v2, p1, Landroid/graphics/PointF;->y:F

    mul-float v1, v1, v2

    iget v2, p0, Lcom/flyersoft/views/NewCurl3D$Render3D;->mViewportHeight:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/PointF;->y:F

    return-void
.end method
