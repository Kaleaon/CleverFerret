.class public Lcom/flyersoft/views/NewCurl3D;
.super Landroid/opengl/GLSurfaceView;
.source "NewCurl3D.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/views/NewCurl3D$PointerPosition;,
        Lcom/flyersoft/views/NewCurl3D$PageShot;,
        Lcom/flyersoft/views/NewCurl3D$Render3D;,
        Lcom/flyersoft/views/NewCurl3D$Observer3D;,
        Lcom/flyersoft/views/NewCurl3D$Mesh3D;
    }
.end annotation


# static fields
.field private static final CURL_LEFT:I = 0x1

.field private static final CURL_NONE:I = 0x0

.field private static final CURL_RIGHT:I = 0x2

.field public static final GOOGLE:I = 0x1

.field public static final IBOOK:I = 0x0

.field public static forceSimulate:Z = false


# instance fields
.field public aboutColor:I

.field afterFlipCurl:Lcom/flyersoft/tools/A$AfterFlipCurl;

.field private clickHandler:Landroid/os/Handler;

.field public curl3dCover:Lcom/flyersoft/views/FlipImageView;

.field public curl3dLay:Landroid/widget/FrameLayout;

.field private dualCache1:Landroid/graphics/Bitmap;

.field private dualCache2:Landroid/graphics/Bitmap;

.field public dualPage:Z

.field private dualPageAnimateState:J

.field private dualPageCacheTime:J

.field private fromClick:Z

.field public mAnimate:Z

.field private mAnimationDurationTime:J

.field private mAnimationDurationTime2:J

.field private mAnimationSource:Landroid/graphics/PointF;

.field private mAnimationStartTime:J

.field private mAnimationTarget:Landroid/graphics/PointF;

.field private mCurlDir:Landroid/graphics/PointF;

.field private mCurlPos:Landroid/graphics/PointF;

.field public mCurlState:I

.field private mDownX:F

.field private mDragStartPos:Landroid/graphics/PointF;

.field private mEnableTouchPressure:Z

.field private mFOV:F

.field private mGB:Lcom/flyersoft/views/GoogleBook3D;

.field private mGBBg:Lcom/flyersoft/views/GoogleBook3D;

.field private mGBBgLeft:Lcom/flyersoft/views/GoogleBook3D;

.field private mGBBgRight:Lcom/flyersoft/views/GoogleBook3D;

.field private mGBShadow:Lcom/flyersoft/views/GoogleBook3D;

.field private mIgnoreUp:Z

.field private mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

.field private mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

.field private mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

.field private mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

.field public mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

.field public mTurnType:I

.field private mUScale:F

.field private mVScale:F

.field observer3D:Lcom/flyersoft/views/NewCurl3D$Observer3D;

.field public pageHeight:I

.field public pageWidth:I

.field public renderInited:I

.field public renderState:I

.field public shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

.field stepDelay:I

.field toutchDownX:F

.field toutchDownY:F

.field public turnSuccess:Z


# direct methods
.method static bridge synthetic -$$Nest$fgetclickHandler(Lcom/flyersoft/views/NewCurl3D;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/NewCurl3D;->clickHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetdualCache1(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/NewCurl3D;->dualCache1:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetdualCache2(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/NewCurl3D;->dualCache2:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetdualPageAnimateState(Lcom/flyersoft/views/NewCurl3D;)J
    .locals 2

    iget-wide v0, p0, Lcom/flyersoft/views/NewCurl3D;->dualPageAnimateState:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$fgetfromClick(Lcom/flyersoft/views/NewCurl3D;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/flyersoft/views/NewCurl3D;->fromClick:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmAnimationDurationTime(Lcom/flyersoft/views/NewCurl3D;)J
    .locals 2

    iget-wide v0, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$fgetmAnimationSource(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/PointF;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationSource:Landroid/graphics/PointF;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmAnimationStartTime(Lcom/flyersoft/views/NewCurl3D;)J
    .locals 2

    iget-wide v0, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationStartTime:J

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$fgetmAnimationTarget(Lcom/flyersoft/views/NewCurl3D;)Landroid/graphics/PointF;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmFOV(Lcom/flyersoft/views/NewCurl3D;)F
    .locals 0

    iget p0, p0, Lcom/flyersoft/views/NewCurl3D;->mFOV:F

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/NewCurl3D;->mGB:Lcom/flyersoft/views/GoogleBook3D;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmGBBg(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/NewCurl3D;->mGBBg:Lcom/flyersoft/views/GoogleBook3D;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmGBBgLeft(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/NewCurl3D;->mGBBgLeft:Lcom/flyersoft/views/GoogleBook3D;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmGBBgRight(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/NewCurl3D;->mGBBgRight:Lcom/flyersoft/views/GoogleBook3D;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmGBShadow(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/NewCurl3D;->mGBShadow:Lcom/flyersoft/views/GoogleBook3D;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmPageCurl(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmPageLeft(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmPageRight(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$Mesh3D;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmPointerPos(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/NewCurl3D$PointerPosition;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmUScale(Lcom/flyersoft/views/NewCurl3D;)F
    .locals 0

    iget p0, p0, Lcom/flyersoft/views/NewCurl3D;->mUScale:F

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmVScale(Lcom/flyersoft/views/NewCurl3D;)F
    .locals 0

    iget p0, p0, Lcom/flyersoft/views/NewCurl3D;->mVScale:F

    return p0
.end method

.method static bridge synthetic -$$Nest$fputdualCache1(Lcom/flyersoft/views/NewCurl3D;Landroid/graphics/Bitmap;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->dualCache1:Landroid/graphics/Bitmap;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputdualCache2(Lcom/flyersoft/views/NewCurl3D;Landroid/graphics/Bitmap;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->dualCache2:Landroid/graphics/Bitmap;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputdualPageAnimateState(Lcom/flyersoft/views/NewCurl3D;J)V
    .locals 0

    iput-wide p1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPageAnimateState:J

    return-void
.end method

.method static bridge synthetic -$$Nest$fputdualPageCacheTime(Lcom/flyersoft/views/NewCurl3D;J)V
    .locals 0

    iput-wide p1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPageCacheTime:J

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmAnimationStartTime(Lcom/flyersoft/views/NewCurl3D;J)V
    .locals 0

    iput-wide p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationStartTime:J

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmFOV(Lcom/flyersoft/views/NewCurl3D;F)V
    .locals 0

    iput p1, p0, Lcom/flyersoft/views/NewCurl3D;->mFOV:F

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmGB(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/GoogleBook3D;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mGB:Lcom/flyersoft/views/GoogleBook3D;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmGBBg(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/GoogleBook3D;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mGBBg:Lcom/flyersoft/views/GoogleBook3D;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmGBBgLeft(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/GoogleBook3D;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mGBBgLeft:Lcom/flyersoft/views/GoogleBook3D;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmGBBgRight(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/GoogleBook3D;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mGBBgRight:Lcom/flyersoft/views/GoogleBook3D;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmGBShadow(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/GoogleBook3D;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mGBShadow:Lcom/flyersoft/views/GoogleBook3D;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmPageCurl(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmPageLeft(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmPageRight(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmUScale(Lcom/flyersoft/views/NewCurl3D;F)V
    .locals 0

    iput p1, p0, Lcom/flyersoft/views/NewCurl3D;->mUScale:F

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmVScale(Lcom/flyersoft/views/NewCurl3D;F)V
    .locals 0

    iput p1, p0, Lcom/flyersoft/views/NewCurl3D;->mVScale:F

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateCurlPos(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/NewCurl3D$PointerPosition;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/views/NewCurl3D;->updateCurlPos(Lcom/flyersoft/views/NewCurl3D$PointerPosition;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 89
    invoke-direct {p0, p1}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    .line 53
    iput v0, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlState:I

    const/4 v1, -0x1

    .line 54
    iput v1, p0, Lcom/flyersoft/views/NewCurl3D;->pageWidth:I

    .line 55
    iput v1, p0, Lcom/flyersoft/views/NewCurl3D;->pageHeight:I

    .line 57
    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    .line 58
    new-instance v1, Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/flyersoft/views/NewCurl3D$PointerPosition;-><init>(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/NewCurl3D-IA;)V

    iput-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    .line 59
    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    .line 60
    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    .line 62
    iput-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimate:Z

    .line 63
    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationSource:Landroid/graphics/PointF;

    .line 64
    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    iput-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    const-wide/16 v1, 0x258

    .line 66
    iput-wide v1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime:J

    .line 69
    iput-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->mEnableTouchPressure:Z

    .line 74
    iput v0, p0, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    const/high16 v0, 0x41a00000    # 20.0f

    .line 83
    iput v0, p0, Lcom/flyersoft/views/NewCurl3D;->mFOV:F

    const/4 v0, 0x4

    .line 130
    new-array v0, v0, [Lcom/flyersoft/views/NewCurl3D$PageShot;

    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    const/4 v0, 0x1

    .line 181
    iput-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->turnSuccess:Z

    .line 1938
    new-instance v0, Lcom/flyersoft/views/NewCurl3D$2;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/views/NewCurl3D$2;-><init>(Lcom/flyersoft/views/NewCurl3D;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->clickHandler:Landroid/os/Handler;

    .line 90
    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->getStyle()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    .line 91
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/NewCurl3D;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 96
    invoke-direct {p0, p1, p2}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 53
    iput p2, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlState:I

    const/4 v0, -0x1

    .line 54
    iput v0, p0, Lcom/flyersoft/views/NewCurl3D;->pageWidth:I

    .line 55
    iput v0, p0, Lcom/flyersoft/views/NewCurl3D;->pageHeight:I

    .line 57
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    .line 58
    new-instance v0, Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/views/NewCurl3D$PointerPosition;-><init>(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/NewCurl3D-IA;)V

    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    .line 59
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    .line 60
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    .line 62
    iput-boolean p2, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimate:Z

    .line 63
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationSource:Landroid/graphics/PointF;

    .line 64
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    const-wide/16 v0, 0x258

    .line 66
    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime:J

    .line 69
    iput-boolean p2, p0, Lcom/flyersoft/views/NewCurl3D;->mEnableTouchPressure:Z

    .line 74
    iput p2, p0, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    const/high16 p2, 0x41a00000    # 20.0f

    .line 83
    iput p2, p0, Lcom/flyersoft/views/NewCurl3D;->mFOV:F

    const/4 p2, 0x4

    .line 130
    new-array p2, p2, [Lcom/flyersoft/views/NewCurl3D$PageShot;

    iput-object p2, p0, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    const/4 p2, 0x1

    .line 181
    iput-boolean p2, p0, Lcom/flyersoft/views/NewCurl3D;->turnSuccess:Z

    .line 1938
    new-instance p2, Lcom/flyersoft/views/NewCurl3D$2;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p2, p0, v0}, Lcom/flyersoft/views/NewCurl3D$2;-><init>(Lcom/flyersoft/views/NewCurl3D;Landroid/os/Looper;)V

    iput-object p2, p0, Lcom/flyersoft/views/NewCurl3D;->clickHandler:Landroid/os/Handler;

    .line 97
    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->getStyle()I

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    .line 98
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/NewCurl3D;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 102
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/views/NewCurl3D;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 103
    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->getStyle()I

    move-result p1

    iput p1, p0, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    return-void
.end method

.method private initObserver3D()V
    .locals 1

    .line 372
    new-instance v0, Lcom/flyersoft/views/NewCurl3D$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/views/NewCurl3D$1;-><init>(Lcom/flyersoft/views/NewCurl3D;)V

    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->observer3D:Lcom/flyersoft/views/NewCurl3D$Observer3D;

    return-void
.end method

.method public static isHuaweiSpecialIssue(Z)Z
    .locals 3

    .line 2095
    sget v0, Lcom/flyersoft/tools/A;->flip_animation:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    .line 2097
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_1

    if-nez p0, :cond_0

    .line 2098
    invoke-static {}, Lcom/flyersoft/tools/A;->getROMInfo()Ljava/lang/String;

    move-result-object p0

    const-string v0, "huawei"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    .line 2100
    new-array v0, p0, [Ljava/lang/Object;

    const-string v1, "fix Google Flip Animation isHuaweiSpecialIssue"

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return p0

    :cond_1
    return v2
.end method

.method private setCurlPos(Landroid/graphics/PointF;Landroid/graphics/PointF;D)V
    .locals 5

    .line 472
    iget v0, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlState:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-eq v0, v2, :cond_4

    const/4 v3, 0x1

    if-ne v0, v3, :cond_0

    iget-boolean v4, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-nez v4, :cond_0

    goto :goto_0

    :cond_0
    if-ne v0, v3, :cond_8

    .line 493
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v0, v3}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v0

    .line 494
    iget v2, p1, Landroid/graphics/PointF;->x:F

    iget v3, v0, Landroid/graphics/RectF;->left:F

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_1

    .line 495
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->reset()V

    .line 496
    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->requestRender()V

    return-void

    .line 499
    :cond_1
    iget v2, p1, Landroid/graphics/PointF;->x:F

    iget v3, v0, Landroid/graphics/RectF;->right:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    .line 500
    iget v2, v0, Landroid/graphics/RectF;->right:F

    iput v2, p1, Landroid/graphics/PointF;->x:F

    .line 501
    :cond_2
    iget v2, p2, Landroid/graphics/PointF;->y:F

    cmpl-float v2, v2, v1

    if-eqz v2, :cond_8

    .line 502
    iget v2, p1, Landroid/graphics/PointF;->x:F

    iget v3, v0, Landroid/graphics/RectF;->right:F

    sub-float/2addr v2, v3

    .line 503
    iget v3, p1, Landroid/graphics/PointF;->y:F

    iget v4, p2, Landroid/graphics/PointF;->x:F

    mul-float v2, v2, v4

    iget v4, p2, Landroid/graphics/PointF;->y:F

    div-float/2addr v2, v4

    add-float/2addr v3, v2

    .line 504
    iget v2, p2, Landroid/graphics/PointF;->y:F

    cmpg-float v2, v2, v1

    if-gez v2, :cond_3

    iget v2, v0, Landroid/graphics/RectF;->top:F

    cmpg-float v2, v3, v2

    if-gez v2, :cond_3

    .line 505
    iget v1, v0, Landroid/graphics/RectF;->top:F

    iget v2, p1, Landroid/graphics/PointF;->y:F

    sub-float/2addr v1, v2

    iput v1, p2, Landroid/graphics/PointF;->x:F

    .line 506
    iget v1, p1, Landroid/graphics/PointF;->x:F

    iget v0, v0, Landroid/graphics/RectF;->right:F

    sub-float/2addr v1, v0

    iput v1, p2, Landroid/graphics/PointF;->y:F

    goto/16 :goto_1

    .line 507
    :cond_3
    iget v2, p2, Landroid/graphics/PointF;->y:F

    cmpl-float v1, v2, v1

    if-lez v1, :cond_8

    iget v1, v0, Landroid/graphics/RectF;->bottom:F

    cmpl-float v1, v3, v1

    if-lez v1, :cond_8

    .line 508
    iget v1, p1, Landroid/graphics/PointF;->y:F

    iget v2, v0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v1, v2

    iput v1, p2, Landroid/graphics/PointF;->x:F

    .line 509
    iget v0, v0, Landroid/graphics/RectF;->right:F

    iget v1, p1, Landroid/graphics/PointF;->x:F

    sub-float/2addr v0, v1

    iput v0, p2, Landroid/graphics/PointF;->y:F

    goto :goto_1

    .line 473
    :cond_4
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v0

    .line 474
    iget v2, p1, Landroid/graphics/PointF;->x:F

    iget v3, v0, Landroid/graphics/RectF;->right:F

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_5

    .line 475
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->reset()V

    .line 476
    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->requestRender()V

    return-void

    .line 479
    :cond_5
    iget v2, p1, Landroid/graphics/PointF;->x:F

    iget v3, v0, Landroid/graphics/RectF;->left:F

    cmpg-float v2, v2, v3

    if-gez v2, :cond_6

    .line 480
    iget v2, v0, Landroid/graphics/RectF;->left:F

    iput v2, p1, Landroid/graphics/PointF;->x:F

    .line 481
    :cond_6
    iget v2, p2, Landroid/graphics/PointF;->y:F

    cmpl-float v2, v2, v1

    if-eqz v2, :cond_8

    .line 482
    iget v2, p1, Landroid/graphics/PointF;->x:F

    iget v3, v0, Landroid/graphics/RectF;->left:F

    sub-float/2addr v2, v3

    .line 483
    iget v3, p1, Landroid/graphics/PointF;->y:F

    iget v4, p2, Landroid/graphics/PointF;->x:F

    mul-float v2, v2, v4

    iget v4, p2, Landroid/graphics/PointF;->y:F

    div-float/2addr v2, v4

    add-float/2addr v3, v2

    .line 484
    iget v2, p2, Landroid/graphics/PointF;->y:F

    cmpg-float v2, v2, v1

    if-gez v2, :cond_7

    iget v2, v0, Landroid/graphics/RectF;->top:F

    cmpg-float v2, v3, v2

    if-gez v2, :cond_7

    .line 485
    iget v1, p1, Landroid/graphics/PointF;->y:F

    iget v2, v0, Landroid/graphics/RectF;->top:F

    sub-float/2addr v1, v2

    iput v1, p2, Landroid/graphics/PointF;->x:F

    .line 486
    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget v1, p1, Landroid/graphics/PointF;->x:F

    sub-float/2addr v0, v1

    iput v0, p2, Landroid/graphics/PointF;->y:F

    goto :goto_1

    .line 487
    :cond_7
    iget v2, p2, Landroid/graphics/PointF;->y:F

    cmpl-float v1, v2, v1

    if-lez v1, :cond_8

    iget v1, v0, Landroid/graphics/RectF;->bottom:F

    cmpl-float v1, v3, v1

    if-lez v1, :cond_8

    .line 488
    iget v1, v0, Landroid/graphics/RectF;->bottom:F

    iget v2, p1, Landroid/graphics/PointF;->y:F

    sub-float/2addr v1, v2

    iput v1, p2, Landroid/graphics/PointF;->x:F

    .line 489
    iget v1, p1, Landroid/graphics/PointF;->x:F

    iget v0, v0, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v0

    iput v1, p2, Landroid/graphics/PointF;->y:F

    .line 515
    :cond_8
    :goto_1
    iget v0, p2, Landroid/graphics/PointF;->x:F

    iget v1, p2, Landroid/graphics/PointF;->x:F

    mul-float v0, v0, v1

    iget v1, p2, Landroid/graphics/PointF;->y:F

    iget v2, p2, Landroid/graphics/PointF;->y:F

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpl-double v4, v0, v2

    if-eqz v4, :cond_9

    .line 517
    iget v2, p2, Landroid/graphics/PointF;->x:F

    float-to-double v2, v2

    div-double/2addr v2, v0

    double-to-float v2, v2

    iput v2, p2, Landroid/graphics/PointF;->x:F

    .line 518
    iget v2, p2, Landroid/graphics/PointF;->y:F

    float-to-double v2, v2

    div-double/2addr v2, v0

    double-to-float v0, v2

    iput v0, p2, Landroid/graphics/PointF;->y:F

    .line 519
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->curl(Landroid/graphics/PointF;Landroid/graphics/PointF;D)V

    goto :goto_2

    .line 521
    :cond_9
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->reset()V

    .line 523
    :goto_2
    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->requestRender()V

    return-void
.end method

.method private startCurl(I)V
    .locals 5

    const/4 v0, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-eq p1, v2, :cond_4

    if-eq p1, v3, :cond_0

    goto/16 :goto_3

    .line 529
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    .line 530
    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iput-object v4, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    .line 531
    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    .line 533
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v4, v2}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setRect(Landroid/graphics/RectF;)V

    .line 534
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->reset()V

    .line 535
    iget-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz p1, :cond_1

    .line 536
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1, v4}, Lcom/flyersoft/views/NewCurl3D$Render3D;->addCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    .line 538
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-boolean v4, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz v4, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setBitmap(II)V

    .line 539
    iget-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz p1, :cond_3

    .line 540
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1, v3, v2}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setBitmap(II)V

    .line 541
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v0, v3}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setRect(Landroid/graphics/RectF;)V

    .line 542
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setFlipTexture(ZZ)V

    .line 543
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->reset()V

    .line 544
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/NewCurl3D$Render3D;->addCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    .line 547
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v0, v3}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setRect(Landroid/graphics/RectF;)V

    .line 548
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setFlipTexture(ZZ)V

    .line 549
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->reset()V

    .line 550
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/NewCurl3D$Render3D;->addCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    .line 551
    iput v3, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlState:I

    goto/16 :goto_3

    .line 555
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    .line 556
    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iput-object v4, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    .line 557
    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    .line 559
    iget-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz p1, :cond_5

    const/4 p1, 0x2

    goto :goto_1

    :cond_5
    const/4 p1, 0x0

    :goto_1
    invoke-virtual {v4, p1, v1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setBitmap(II)V

    .line 560
    iget-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz p1, :cond_6

    .line 561
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1, v0, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setBitmap(II)V

    .line 562
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setRect(Landroid/graphics/RectF;)V

    .line 563
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->reset()V

    .line 564
    iget-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz p1, :cond_7

    .line 565
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/NewCurl3D$Render3D;->addCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    .line 567
    :cond_7
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v0, v3}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setRect(Landroid/graphics/RectF;)V

    .line 568
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->reset()V

    .line 569
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/NewCurl3D$Render3D;->addCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    .line 572
    iget-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-nez p1, :cond_8

    .line 573
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v0, v3}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setRect(Landroid/graphics/RectF;)V

    .line 574
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setFlipTexture(ZZ)V

    goto :goto_2

    .line 576
    :cond_8
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setRect(Landroid/graphics/RectF;)V

    .line 578
    :goto_2
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->reset()V

    .line 579
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/NewCurl3D$Render3D;->addCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    .line 581
    iput v2, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlState:I

    .line 584
    :goto_3
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    const-string v0, "pageCurl"

    iput-object v0, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->name:Ljava/lang/String;

    .line 585
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    const-string v0, "pageRight"

    iput-object v0, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->name:Ljava/lang/String;

    .line 586
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    const-string v0, "pageLeft"

    iput-object v0, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->name:Ljava/lang/String;

    return-void
.end method

.method private turnPageGoogleStyle(FF)V
    .locals 1

    .line 2088
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mGB:Lcom/flyersoft/views/GoogleBook3D;

    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/views/GoogleBook3D;->startPageTurnAnimation(FF)V

    const-wide/16 p1, 0x0

    .line 2089
    iput-wide p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationStartTime:J

    const/4 p1, 0x1

    .line 2090
    iput-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimate:Z

    return-void
.end method

.method private turnPageGoogleStyle(Z)V
    .locals 2

    .line 2076
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mGB:Lcom/flyersoft/views/GoogleBook3D;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    .line 2079
    iput p1, v0, Lcom/flyersoft/views/GoogleBook3D;->mDir:I

    const/high16 p1, 0x3f800000    # 1.0f

    .line 2080
    invoke-direct {p0, v1, p1}, Lcom/flyersoft/views/NewCurl3D;->turnPageGoogleStyle(FF)V

    return-void

    :cond_1
    const/4 p1, 0x2

    .line 2082
    iput p1, v0, Lcom/flyersoft/views/GoogleBook3D;->mDir:I

    const/high16 p1, -0x40800000    # -1.0f

    .line 2083
    invoke-direct {p0, v1, p1}, Lcom/flyersoft/views/NewCurl3D;->turnPageGoogleStyle(FF)V

    return-void
.end method

.method private updateCurlPos(Lcom/flyersoft/views/NewCurl3D$PointerPosition;)V
    .locals 13

    .line 619
    iget-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->fromClick:Z

    if-eqz v0, :cond_0

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    goto :goto_0

    :cond_0
    const-wide/high16 v0, 0x3ff8000000000000L    # 1.5

    .line 620
    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v2

    if-eqz v2, :cond_1

    const-wide/high16 v2, 0x4018000000000000L    # 6.0

    goto :goto_1

    :cond_1
    const-wide/high16 v2, 0x4008000000000000L    # 3.0

    .line 622
    :goto_1
    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    float-to-double v6, v4

    mul-double v6, v6, v0

    div-double/2addr v6, v2

    const/high16 v0, 0x3f800000    # 1.0f

    .line 623
    iget v1, p1, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPressure:F

    sub-float/2addr v0, v1

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    float-to-double v2, v0

    mul-double v6, v6, v2

    .line 624
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    iget-object p1, p1, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    invoke-virtual {v0, p1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 626
    iget p1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlState:I

    if-eq p1, v5, :cond_4

    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    iget-boolean v2, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    if-ne p1, v0, :cond_3

    .line 652
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {p1, v5}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object p1

    iget p1, p1, Landroid/graphics/RectF;->left:F

    .line 653
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    sub-float/2addr v0, p1

    float-to-double v0, v0

    invoke-static {v0, v1, v6, v7}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    .line 655
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {p1, v5}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object p1

    iget p1, p1, Landroid/graphics/RectF;->right:F

    .line 656
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->x:F

    float-to-double v3, v3

    iget-object v5, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    iget v5, v5, Landroid/graphics/PointF;->x:F

    sub-float/2addr p1, v5

    float-to-double v5, p1

    invoke-static {v5, v6, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v5

    sub-double/2addr v3, v5

    double-to-float p1, v3

    iput p1, v2, Landroid/graphics/PointF;->x:F

    .line 657
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    add-float/2addr v2, v3

    iput v2, p1, Landroid/graphics/PointF;->x:F

    .line 658
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    sub-float/2addr v2, v3

    iput v2, p1, Landroid/graphics/PointF;->y:F

    .line 660
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    invoke-direct {p0, p1, v2, v0, v1}, Lcom/flyersoft/views/NewCurl3D;->setCurlPos(Landroid/graphics/PointF;Landroid/graphics/PointF;D)V

    :cond_3
    return-void

    .line 627
    :cond_4
    :goto_2
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    sub-float/2addr v0, v2

    iput v0, p1, Landroid/graphics/PointF;->x:F

    .line 628
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    sub-float/2addr v0, v2

    iput v0, p1, Landroid/graphics/PointF;->y:F

    .line 629
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    iget p1, p1, Landroid/graphics/PointF;->x:F

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    mul-float p1, p1, v0

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    mul-float v0, v0, v2

    add-float/2addr p1, v0

    float-to-double v2, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float p1, v2

    .line 630
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v0, v5}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    const-wide v2, 0x400921fb54442d18L    # Math.PI

    mul-double v4, v6, v2

    float-to-double v8, p1

    const/high16 v10, 0x40000000    # 2.0f

    mul-float v0, v0, v10

    float-to-double v10, v0

    sub-double/2addr v10, v4

    cmpl-double v12, v8, v10

    if-lez v12, :cond_5

    sub-float/2addr v0, p1

    .line 633
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    float-to-double v4, p1

    div-double v6, v4, v2

    :cond_5
    cmpl-double p1, v8, v4

    if-ltz p1, :cond_6

    sub-double v0, v8, v4

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    div-double/2addr v0, v2

    .line 640
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    iget v2, p1, Landroid/graphics/PointF;->x:F

    float-to-double v2, v2

    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->x:F

    float-to-double v4, v4

    mul-double v4, v4, v0

    div-double/2addr v4, v8

    sub-double/2addr v2, v4

    double-to-float v2, v2

    iput v2, p1, Landroid/graphics/PointF;->x:F

    .line 641
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    iget v2, p1, Landroid/graphics/PointF;->y:F

    float-to-double v2, v2

    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    float-to-double v4, v4

    mul-double v4, v4, v0

    div-double/2addr v4, v8

    sub-double/2addr v2, v4

    double-to-float v0, v2

    iput v0, p1, Landroid/graphics/PointF;->y:F

    goto :goto_3

    :cond_6
    div-double v0, v8, v4

    .line 643
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    mul-double v0, v0, v2

    .line 644
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    mul-double v0, v0, v6

    .line 645
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    iget v2, p1, Landroid/graphics/PointF;->x:F

    float-to-double v2, v2

    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->x:F

    float-to-double v4, v4

    mul-double v4, v4, v0

    div-double/2addr v4, v8

    add-double/2addr v2, v4

    double-to-float v2, v2

    iput v2, p1, Landroid/graphics/PointF;->x:F

    .line 646
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    iget v2, p1, Landroid/graphics/PointF;->y:F

    float-to-double v2, v2

    iget-object v4, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    float-to-double v4, v4

    mul-double v4, v4, v0

    div-double/2addr v4, v8

    add-double/2addr v2, v4

    double-to-float v0, v2

    iput v0, p1, Landroid/graphics/PointF;->y:F

    .line 649
    :goto_3
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlPos:Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlDir:Landroid/graphics/PointF;

    invoke-direct {p0, p1, v0, v6, v7}, Lcom/flyersoft/views/NewCurl3D;->setCurlPos(Landroid/graphics/PointF;Landroid/graphics/PointF;D)V

    return-void
.end method

.method private updateGBPos(F)V
    .locals 1

    .line 666
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->gb(F)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 668
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 670
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->requestRender()V

    return-void
.end method


# virtual methods
.method public clearAllShots()V
    .locals 1

    const/4 v0, 0x0

    .line 148
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/NewCurl3D;->recycle(I)V

    const/4 v0, 0x1

    .line 149
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/NewCurl3D;->recycle(I)V

    const/4 v0, 0x2

    .line 150
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/NewCurl3D;->recycle(I)V

    const/4 v0, 0x3

    .line 151
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/NewCurl3D;->recycle(I)V

    return-void
.end method

.method public createMesh3Ds()V
    .locals 3

    .line 363
    new-instance v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;-><init>(Lcom/flyersoft/views/NewCurl3D;I)V

    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    .line 364
    new-instance v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;-><init>(Lcom/flyersoft/views/NewCurl3D;I)V

    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    .line 365
    new-instance v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;-><init>(Lcom/flyersoft/views/NewCurl3D;I)V

    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    .line 366
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-boolean v1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setFlipTexture(ZZ)V

    .line 367
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-boolean v1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    invoke-virtual {v0, v2, v1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setFlipTexture(ZZ)V

    return-void
.end method

.method d(F)F
    .locals 1

    .line 2072
    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float v0, v0, p1

    return v0
.end method

.method public getShotBitmap(I)Landroid/graphics/Bitmap;
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D$PageShot;->bm:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 133
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    aget-object p1, v0, p1

    iget-object p1, p1, Lcom/flyersoft/views/NewCurl3D$PageShot;->bm:Landroid/graphics/Bitmap;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getStyle()I
    .locals 2

    .line 107
    sget v0, Lcom/flyersoft/tools/A;->flip_animation:I

    if-nez v0, :cond_0

    sget v0, Lcom/flyersoft/tools/A;->hori_fling_animation:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->flip_animation:I

    :goto_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    return v1
.end method

.method public inDualPageCachingShot()Z
    .locals 5

    .line 127
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/flyersoft/views/NewCurl3D;->dualPageCacheTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x5dc

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public init(Landroid/content/Context;)V
    .locals 1

    .line 354
    invoke-direct {p0}, Lcom/flyersoft/views/NewCurl3D;->initObserver3D()V

    .line 355
    new-instance p1, Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->observer3D:Lcom/flyersoft/views/NewCurl3D$Observer3D;

    invoke-direct {p1, p0, v0}, Lcom/flyersoft/views/NewCurl3D$Render3D;-><init>(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/NewCurl3D$Observer3D;)V

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    .line 356
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/NewCurl3D;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    const/4 p1, 0x0

    .line 357
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/NewCurl3D;->setRenderMode(I)V

    .line 359
    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->createMesh3Ds()V

    return-void
.end method

.method public pageScroll(Z)V
    .locals 10

    .line 2001
    iget-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimate:Z

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 2004
    :cond_0
    sget-boolean v0, Lcom/flyersoft/views/NewCurl3D;->forceSimulate:Z

    const-wide/16 v1, 0xa

    const-wide/16 v3, 0x0

    if-nez v0, :cond_b

    iget v0, p0, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    if-nez v0, :cond_1

    goto/16 :goto_5

    :cond_1
    if-nez p1, :cond_2

    .line 2024
    iget-wide v5, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime2:J

    const-wide/16 v7, 0xd

    mul-long v5, v5, v7

    div-long/2addr v5, v1

    iput-wide v5, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime:J

    :cond_2
    const/4 v0, 0x1

    .line 2026
    iput-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->fromClick:Z

    .line 2027
    iput-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->turnSuccess:Z

    .line 2028
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v1

    .line 2029
    iget-object v5, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v5, v0}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v5

    .line 2031
    iget-object v6, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    iget-object v6, v6, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    const/4 v7, 0x0

    if-nez p1, :cond_3

    const/4 v8, 0x0

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->getWidth()I

    move-result v8

    int-to-float v8, v8

    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->getHeight()I

    move-result v9

    div-int/2addr v9, v2

    int-to-float v9, v9

    invoke-virtual {v6, v8, v9}, Landroid/graphics/PointF;->set(FF)V

    .line 2032
    iget-object v6, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v8, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    iget-object v8, v8, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    invoke-virtual {v6, v8}, Lcom/flyersoft/views/NewCurl3D$Render3D;->translate(Landroid/graphics/PointF;)V

    .line 2033
    iget-object v6, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    iget-boolean v8, p0, Lcom/flyersoft/views/NewCurl3D;->mEnableTouchPressure:Z

    if-eqz v8, :cond_4

    const v7, 0x3f48c7e3    # 0.7843f

    :cond_4
    iput v7, v6, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPressure:F

    .line 2034
    iget-object v6, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget-object v7, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    iget-object v7, v7, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    invoke-virtual {v6, v7}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 2036
    iget-object v6, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget v6, v6, Landroid/graphics/PointF;->y:F

    iget v7, v1, Landroid/graphics/RectF;->top:F

    cmpl-float v6, v6, v7

    if-lez v6, :cond_5

    .line 2037
    iget-object v6, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget v7, v1, Landroid/graphics/RectF;->top:F

    iput v7, v6, Landroid/graphics/PointF;->y:F

    goto :goto_1

    .line 2038
    :cond_5
    iget-object v6, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget v6, v6, Landroid/graphics/PointF;->y:F

    iget v7, v1, Landroid/graphics/RectF;->bottom:F

    cmpg-float v6, v6, v7

    if-gez v6, :cond_6

    .line 2039
    iget-object v6, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget v7, v1, Landroid/graphics/RectF;->bottom:F

    iput v7, v6, Landroid/graphics/PointF;->y:F

    :cond_6
    :goto_1
    if-eqz p1, :cond_7

    .line 2042
    iget-object v6, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget v7, v1, Landroid/graphics/RectF;->right:F

    iput v7, v6, Landroid/graphics/PointF;->x:F

    .line 2043
    invoke-direct {p0, v2}, Lcom/flyersoft/views/NewCurl3D;->startCurl(I)V

    goto :goto_2

    .line 2045
    :cond_7
    iget-object v6, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget v7, v5, Landroid/graphics/RectF;->left:F

    iput v7, v6, Landroid/graphics/PointF;->x:F

    .line 2046
    invoke-direct {p0, v0}, Lcom/flyersoft/views/NewCurl3D;->startCurl(I)V

    .line 2048
    :goto_2
    iget v6, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlState:I

    if-nez v6, :cond_8

    :goto_3
    return-void

    .line 2051
    :cond_8
    iget v6, p0, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    if-nez v6, :cond_a

    .line 2052
    iput-wide v3, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationStartTime:J

    .line 2053
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    invoke-direct {p0, p1}, Lcom/flyersoft/views/NewCurl3D;->updateCurlPos(Lcom/flyersoft/views/NewCurl3D$PointerPosition;)V

    .line 2054
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationSource:Landroid/graphics/PointF;

    iget-object v6, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    iget-object v6, v6, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    invoke-virtual {p1, v6}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 2055
    iget p1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlState:I

    if-ne p1, v2, :cond_9

    .line 2056
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    invoke-virtual {p1, v1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 2057
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget v1, v5, Landroid/graphics/RectF;->left:F

    iput v1, p1, Landroid/graphics/PointF;->x:F

    goto :goto_4

    .line 2059
    :cond_9
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    invoke-virtual {p1, v2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 2060
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    iput v1, p1, Landroid/graphics/PointF;->x:F

    goto :goto_4

    .line 2063
    :cond_a
    invoke-direct {p0, p1}, Lcom/flyersoft/views/NewCurl3D;->turnPageGoogleStyle(Z)V

    .line 2066
    :goto_4
    iput-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimate:Z

    .line 2067
    iput-wide v3, p0, Lcom/flyersoft/views/NewCurl3D;->dualPageAnimateState:J

    .line 2068
    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->requestRender()V

    return-void

    :cond_b
    :goto_5
    const/4 v0, 0x0

    .line 2005
    sput-boolean v0, Lcom/flyersoft/views/NewCurl3D;->forceSimulate:Z

    .line 2006
    iget-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-nez v0, :cond_d

    iget-wide v5, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime2:J

    cmp-long v0, v5, v3

    if-lez v0, :cond_d

    if-eqz p1, :cond_c

    const-wide/16 v7, 0x9

    goto :goto_6

    :cond_c
    const-wide/16 v7, 0x6

    :goto_6
    mul-long v5, v5, v7

    .line 2007
    div-long/2addr v5, v1

    iput-wide v5, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime:J

    .line 2008
    :cond_d
    iget-wide v5, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime:J

    div-long/2addr v5, v1

    long-to-int v0, v5

    iput v0, p0, Lcom/flyersoft/views/NewCurl3D;->stepDelay:I

    if-eqz p1, :cond_e

    .line 2010
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->clickHandler:Landroid/os/Handler;

    const/16 v0, 0xb

    invoke-virtual {p1, v0, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void

    .line 2015
    :cond_e
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->clickHandler:Landroid/os/Handler;

    const/16 v0, 0x15

    invoke-virtual {p1, v0, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method public recycle(I)V
    .locals 2

    .line 155
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    aget-object v0, v0, p1

    if-eqz v0, :cond_2

    .line 156
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D$PageShot;->bm:Landroid/graphics/Bitmap;

    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->tmpFlipShot2:Landroid/graphics/Bitmap;

    if-eq v0, v1, :cond_1

    .line 157
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D$PageShot;->bm:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 158
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D$PageShot;->bm_texture:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 160
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    const/4 v1, 0x0

    aput-object v1, v0, p1

    return-void
.end method

.method public setDurationTime(J)V
    .locals 4

    .line 119
    iget v0, p0, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    const/4 v1, 0x1

    const-wide/16 v2, 0x64

    if-ne v0, v1, :cond_1

    .line 120
    iget-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz v0, :cond_0

    mul-long p1, p1, v2

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x3c

    mul-long p1, p1, v0

    :goto_0
    div-long/2addr p1, v2

    iput-wide p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime:J

    goto :goto_2

    .line 122
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz v0, :cond_2

    const-wide/16 v0, 0xf

    mul-long p1, p1, v0

    const-wide/16 v0, 0xb

    div-long/2addr p1, v0

    goto :goto_1

    :cond_2
    mul-long p1, p1, v2

    div-long/2addr p1, v2

    :goto_1
    iput-wide p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime:J

    .line 123
    :goto_2
    iget-wide p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime:J

    iput-wide p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime2:J

    return-void
.end method

.method public setEnableTouchPressure(Z)V
    .locals 0

    .line 339
    iput-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->mEnableTouchPressure:Z

    return-void
.end method

.method public setMargins(FFFF)V
    .locals 1

    .line 343
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/flyersoft/views/NewCurl3D$Render3D;->setMargins(FFFF)V

    return-void
.end method

.method public setOnScrollListener(Lcom/flyersoft/tools/A$AfterFlipCurl;)V
    .locals 0

    .line 165
    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->afterFlipCurl:Lcom/flyersoft/tools/A$AfterFlipCurl;

    return-void
.end method

.method public setPageShot(ILandroid/graphics/Bitmap;Z)V
    .locals 1

    if-eqz p3, :cond_0

    .line 138
    iget-object p3, p0, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    aget-object p3, p3, p1

    if-eqz p3, :cond_0

    .line 139
    iget-object p3, p3, Lcom/flyersoft/views/NewCurl3D$PageShot;->bm:Landroid/graphics/Bitmap;

    invoke-static {p3}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 140
    iget-object p3, p0, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    aget-object p3, p3, p1

    iget-object p3, p3, Lcom/flyersoft/views/NewCurl3D$PageShot;->bm_texture:Landroid/graphics/Bitmap;

    invoke-static {p3}, Lcom/flyersoft/tools/T;->recycle(Landroid/graphics/Bitmap;)Z

    .line 142
    :cond_0
    iget-object p3, p0, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    new-instance v0, Lcom/flyersoft/views/NewCurl3D$PageShot;

    invoke-direct {v0, p0}, Lcom/flyersoft/views/NewCurl3D$PageShot;-><init>(Lcom/flyersoft/views/NewCurl3D;)V

    aput-object v0, p3, p1

    .line 143
    iget-object p3, p0, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    aget-object p3, p3, p1

    iput p1, p3, Lcom/flyersoft/views/NewCurl3D$PageShot;->index:I

    .line 144
    iget-object p3, p0, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    aget-object p1, p3, p1

    iput-object p2, p1, Lcom/flyersoft/views/NewCurl3D$PageShot;->bm:Landroid/graphics/Bitmap;

    return-void
.end method

.method public setViewMode(ZII)V
    .locals 0

    .line 347
    iput-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz p1, :cond_0

    .line 348
    div-int/lit8 p2, p2, 0x2

    :cond_0
    iput p2, p0, Lcom/flyersoft/views/NewCurl3D;->pageWidth:I

    .line 349
    iput p3, p0, Lcom/flyersoft/views/NewCurl3D;->pageHeight:I

    .line 350
    iget-object p2, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {p2, p1}, Lcom/flyersoft/views/NewCurl3D$Render3D;->setViewMode(Z)V

    return-void
.end method

.method public declared-synchronized simulateOnTouch(Landroid/view/MotionEvent;Z)V
    .locals 0

    monitor-enter p0

    .line 171
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/views/NewCurl3D;->simulateOnTouchLock(Landroid/view/MotionEvent;Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 173
    :try_start_1
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 178
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

.method public simulateOnTouchLock(Landroid/view/MotionEvent;Z)Z
    .locals 10

    .line 184
    iget-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimate:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 187
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v0

    .line 188
    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v3

    .line 190
    iget-object v5, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    iget-object v5, v5, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    invoke-virtual {v5, v6, v7}, Landroid/graphics/PointF;->set(FF)V

    .line 191
    iget-object v5, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v6, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    iget-object v6, v6, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    invoke-virtual {v5, v6}, Lcom/flyersoft/views/NewCurl3D$Render3D;->translate(Landroid/graphics/PointF;)V

    .line 192
    iget-object v5, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    iget-boolean v6, p0, Lcom/flyersoft/views/NewCurl3D;->mEnableTouchPressure:Z

    const/4 v7, 0x0

    if-eqz v6, :cond_1

    const v6, 0x3f48c7e3    # 0.7843f

    goto :goto_0

    :cond_1
    const/4 v6, 0x0

    :goto_0
    iput v6, v5, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPressure:F

    .line 194
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    const/high16 v6, 0x40000000    # 2.0f

    const-wide/16 v8, 0x0

    if-eqz v5, :cond_1c

    if-eq v5, v4, :cond_6

    if-eq v5, v2, :cond_2

    goto/16 :goto_7

    .line 236
    :cond_2
    iput-boolean v1, p0, Lcom/flyersoft/views/NewCurl3D;->fromClick:Z

    .line 237
    iget p2, p0, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    if-nez p2, :cond_3

    .line 238
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    invoke-direct {p0, p1}, Lcom/flyersoft/views/NewCurl3D;->updateCurlPos(Lcom/flyersoft/views/NewCurl3D$PointerPosition;)V

    goto/16 :goto_7

    .line 240
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    .line 241
    iget-boolean p2, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz p2, :cond_4

    const p2, 0x3f51eb85    # 0.82f

    mul-float p1, p1, p2

    .line 245
    :cond_4
    iget p2, p0, Lcom/flyersoft/views/NewCurl3D;->mDownX:F

    sub-float p2, p1, p2

    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p2, v0

    .line 246
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x3e99999a    # 0.3f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_5

    const/high16 v0, 0x40a00000    # 5.0f

    mul-float v0, v0, p2

    .line 247
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    div-float/2addr p2, v0

    .line 249
    :cond_5
    invoke-direct {p0, p2}, Lcom/flyersoft/views/NewCurl3D;->updateGBPos(F)V

    .line 250
    iput p1, p0, Lcom/flyersoft/views/NewCurl3D;->mDownX:F

    goto/16 :goto_7

    .line 255
    :cond_6
    iput-boolean v1, p0, Lcom/flyersoft/views/NewCurl3D;->fromClick:Z

    .line 256
    iget-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->mIgnoreUp:Z

    if-eqz p1, :cond_7

    .line 257
    iput-boolean v1, p0, Lcom/flyersoft/views/NewCurl3D;->mIgnoreUp:Z

    return v1

    :cond_7
    xor-int/lit8 p1, p2, 0x1

    .line 260
    iput-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->turnSuccess:Z

    .line 261
    iget p1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlState:I

    if-eq p1, v4, :cond_8

    if-ne p1, v2, :cond_24

    .line 262
    :cond_8
    iput-wide v8, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationStartTime:J

    .line 263
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationSource:Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    iget-object v1, v1, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    invoke-virtual {p1, v1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 264
    iget-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-nez p1, :cond_9

    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    iget-object p1, p1, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    iget p1, p1, Landroid/graphics/PointF;->x:F

    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v5, v0, Landroid/graphics/RectF;->right:F

    add-float/2addr v1, v5

    div-float/2addr v1, v6

    cmpl-float p1, p1, v1

    if-gtz p1, :cond_a

    :cond_9
    iget-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz p1, :cond_e

    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    iget-object p1, p1, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    iget p1, p1, Landroid/graphics/PointF;->x:F

    iget v1, v0, Landroid/graphics/RectF;->left:F

    cmpl-float p1, p1, v1

    if-lez p1, :cond_e

    .line 266
    :cond_a
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    invoke-virtual {p1, v0}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 267
    iget p1, p0, Lcom/flyersoft/views/NewCurl3D;->toutchDownX:F

    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->getWidth()I

    move-result v0

    div-int/2addr v0, v2

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_c

    if-eqz p2, :cond_b

    .line 269
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v0

    iget v0, v0, Landroid/graphics/RectF;->right:F

    iput v0, p1, Landroid/graphics/PointF;->x:F

    goto/16 :goto_2

    .line 271
    :cond_b
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget v0, v3, Landroid/graphics/RectF;->left:F

    iput v0, p1, Landroid/graphics/PointF;->x:F

    goto/16 :goto_2

    :cond_c
    if-eqz p2, :cond_d

    .line 275
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget v0, v3, Landroid/graphics/RectF;->left:F

    iput v0, p1, Landroid/graphics/PointF;->x:F

    goto/16 :goto_2

    .line 277
    :cond_d
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v0

    iget v0, v0, Landroid/graphics/RectF;->right:F

    iput v0, p1, Landroid/graphics/PointF;->x:F

    goto/16 :goto_2

    .line 281
    :cond_e
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    invoke-virtual {p1, v1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 282
    iget p1, p0, Lcom/flyersoft/views/NewCurl3D;->mCurlState:I

    if-eq p1, v2, :cond_12

    iget-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz p1, :cond_f

    goto :goto_1

    .line 297
    :cond_f
    iget p1, p0, Lcom/flyersoft/views/NewCurl3D;->toutchDownX:F

    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->getWidth()I

    move-result v1

    div-int/2addr v1, v2

    int-to-float v1, v1

    cmpg-float p1, p1, v1

    if-gez p1, :cond_11

    if-eqz p2, :cond_10

    .line 299
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iput v0, p1, Landroid/graphics/PointF;->x:F

    goto :goto_2

    .line 301
    :cond_10
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v0

    iget v0, v0, Landroid/graphics/RectF;->right:F

    iput v0, p1, Landroid/graphics/PointF;->x:F

    goto :goto_2

    .line 304
    :cond_11
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iput v0, p1, Landroid/graphics/PointF;->x:F

    goto :goto_2

    .line 283
    :cond_12
    :goto_1
    iget p1, p0, Lcom/flyersoft/views/NewCurl3D;->toutchDownX:F

    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->getWidth()I

    move-result v0

    div-int/2addr v0, v2

    int-to-float v0, v0

    cmpg-float p1, p1, v0

    if-gez p1, :cond_14

    if-eqz p2, :cond_13

    .line 285
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget v0, v3, Landroid/graphics/RectF;->left:F

    iput v0, p1, Landroid/graphics/PointF;->x:F

    goto :goto_2

    .line 287
    :cond_13
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v0

    iget v0, v0, Landroid/graphics/RectF;->right:F

    iput v0, p1, Landroid/graphics/PointF;->x:F

    goto :goto_2

    :cond_14
    if-eqz p2, :cond_15

    .line 291
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v0

    iget v0, v0, Landroid/graphics/RectF;->right:F

    iput v0, p1, Landroid/graphics/PointF;->x:F

    goto :goto_2

    .line 293
    :cond_15
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationTarget:Landroid/graphics/PointF;

    iget v0, v3, Landroid/graphics/RectF;->left:F

    iput v0, p1, Landroid/graphics/PointF;->x:F

    .line 309
    :goto_2
    iget p1, p0, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    if-nez p1, :cond_17

    if-eqz p2, :cond_17

    iget-wide p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime2:J

    cmp-long v0, p1, v8

    if-lez v0, :cond_17

    .line 310
    iget p1, p0, Lcom/flyersoft/views/NewCurl3D;->toutchDownX:F

    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->getWidth()I

    move-result p2

    div-int/2addr p2, v2

    int-to-float p2, p2

    const-wide/16 v0, 0x2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_16

    .line 311
    iget-wide p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime2:J

    mul-long p1, p1, v0

    const-wide/16 v0, 0x3

    div-long/2addr p1, v0

    goto :goto_3

    :cond_16
    iget-wide p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime2:J

    mul-long p1, p1, v0

    :goto_3
    iput-wide p1, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimationDurationTime:J

    .line 314
    :cond_17
    iget p1, p0, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    if-ne p1, v4, :cond_1b

    iget-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->mIgnoreUp:Z

    if-nez p1, :cond_1b

    .line 315
    iget-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->turnSuccess:Z

    if-eqz p1, :cond_19

    .line 316
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mGB:Lcom/flyersoft/views/GoogleBook3D;

    iget p1, p1, Lcom/flyersoft/views/GoogleBook3D;->mDir:I

    if-ne p1, v2, :cond_18

    .line 317
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mGB:Lcom/flyersoft/views/GoogleBook3D;

    iget p1, p1, Lcom/flyersoft/views/GoogleBook3D;->mT:F

    const/high16 p2, -0x40800000    # -1.0f

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/views/NewCurl3D;->turnPageGoogleStyle(FF)V

    goto :goto_4

    .line 319
    :cond_18
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mGB:Lcom/flyersoft/views/GoogleBook3D;

    iget p1, p1, Lcom/flyersoft/views/GoogleBook3D;->mT:F

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/views/NewCurl3D;->turnPageGoogleStyle(FF)V

    goto :goto_4

    .line 322
    :cond_19
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mGB:Lcom/flyersoft/views/GoogleBook3D;

    iget p1, p1, Lcom/flyersoft/views/GoogleBook3D;->mDir:I

    if-ne p1, v4, :cond_1a

    .line 323
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mGB:Lcom/flyersoft/views/GoogleBook3D;

    iget p1, p1, Lcom/flyersoft/views/GoogleBook3D;->mT:F

    invoke-direct {p0, p1, v7}, Lcom/flyersoft/views/NewCurl3D;->turnPageGoogleStyle(FF)V

    goto :goto_4

    .line 325
    :cond_1a
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mGB:Lcom/flyersoft/views/GoogleBook3D;

    iget p1, p1, Lcom/flyersoft/views/GoogleBook3D;->mT:F

    invoke-direct {p0, p1, v7}, Lcom/flyersoft/views/NewCurl3D;->turnPageGoogleStyle(FF)V

    .line 330
    :cond_1b
    :goto_4
    iput-boolean v4, p0, Lcom/flyersoft/views/NewCurl3D;->mAnimate:Z

    .line 331
    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->requestRender()V

    goto/16 :goto_7

    .line 196
    :cond_1c
    iput-wide v8, p0, Lcom/flyersoft/views/NewCurl3D;->dualPageAnimateState:J

    .line 197
    iput-boolean v4, p0, Lcom/flyersoft/views/NewCurl3D;->turnSuccess:Z

    .line 198
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/NewCurl3D;->toutchDownX:F

    .line 199
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/flyersoft/views/NewCurl3D;->toutchDownY:F

    .line 200
    iget p1, p0, Lcom/flyersoft/views/NewCurl3D;->toutchDownX:F

    iput p1, p0, Lcom/flyersoft/views/NewCurl3D;->mDownX:F

    .line 201
    iget p2, p0, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    if-ne p2, v4, :cond_1d

    iget-boolean p2, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz p2, :cond_1d

    const p2, 0x3f59999a    # 0.85f

    mul-float p1, p1, p2

    .line 203
    iput p1, p0, Lcom/flyersoft/views/NewCurl3D;->mDownX:F

    .line 205
    :cond_1d
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget-object p2, p0, Lcom/flyersoft/views/NewCurl3D;->mPointerPos:Lcom/flyersoft/views/NewCurl3D$PointerPosition;

    iget-object p2, p2, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    invoke-virtual {p1, p2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 207
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget p1, p1, Landroid/graphics/PointF;->y:F

    iget p2, v0, Landroid/graphics/RectF;->top:F

    cmpl-float p1, p1, p2

    if-lez p1, :cond_1e

    .line 208
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget p2, v0, Landroid/graphics/RectF;->top:F

    iput p2, p1, Landroid/graphics/PointF;->y:F

    goto :goto_5

    .line 209
    :cond_1e
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget p1, p1, Landroid/graphics/PointF;->y:F

    iget p2, v0, Landroid/graphics/RectF;->bottom:F

    cmpg-float p1, p1, p2

    if-gez p1, :cond_1f

    .line 210
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget p2, v0, Landroid/graphics/RectF;->bottom:F

    iput p2, p1, Landroid/graphics/PointF;->y:F

    .line 212
    :cond_1f
    :goto_5
    iget-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz p1, :cond_21

    .line 213
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget p1, p1, Landroid/graphics/PointF;->x:F

    iget p2, v0, Landroid/graphics/RectF;->left:F

    cmpg-float p1, p1, p2

    if-gez p1, :cond_20

    .line 214
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget p2, v3, Landroid/graphics/RectF;->left:F

    iput p2, p1, Landroid/graphics/PointF;->x:F

    .line 215
    invoke-direct {p0, v4}, Lcom/flyersoft/views/NewCurl3D;->startCurl(I)V

    goto :goto_6

    .line 216
    :cond_20
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget p1, p1, Landroid/graphics/PointF;->x:F

    iget p2, v0, Landroid/graphics/RectF;->left:F

    cmpl-float p1, p1, p2

    if-ltz p1, :cond_23

    .line 217
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget p2, v0, Landroid/graphics/RectF;->right:F

    iput p2, p1, Landroid/graphics/PointF;->x:F

    .line 218
    invoke-direct {p0, v2}, Lcom/flyersoft/views/NewCurl3D;->startCurl(I)V

    goto :goto_6

    .line 221
    :cond_21
    iget p1, v0, Landroid/graphics/RectF;->right:F

    iget p2, v0, Landroid/graphics/RectF;->left:F

    add-float/2addr p1, p2

    div-float/2addr p1, v6

    .line 222
    iget-object p2, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget p2, p2, Landroid/graphics/PointF;->x:F

    cmpg-float p1, p2, p1

    if-gez p1, :cond_22

    .line 223
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget p2, v0, Landroid/graphics/RectF;->left:F

    iput p2, p1, Landroid/graphics/PointF;->x:F

    .line 224
    invoke-direct {p0, v4}, Lcom/flyersoft/views/NewCurl3D;->startCurl(I)V

    goto :goto_6

    .line 226
    :cond_22
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mDragStartPos:Landroid/graphics/PointF;

    iget p2, v0, Landroid/graphics/RectF;->right:F

    iput p2, p1, Landroid/graphics/PointF;->x:F

    .line 227
    invoke-direct {p0, v2}, Lcom/flyersoft/views/NewCurl3D;->startCurl(I)V

    .line 230
    :cond_23
    :goto_6
    iget p1, p0, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    if-ne p1, v4, :cond_24

    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D;->mGB:Lcom/flyersoft/views/GoogleBook3D;

    if-eqz p1, :cond_24

    .line 231
    iget p2, p0, Lcom/flyersoft/views/NewCurl3D;->mDownX:F

    invoke-virtual {p0}, Lcom/flyersoft/views/NewCurl3D;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget-boolean v1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    invoke-virtual {p1, p2, v0, v1}, Lcom/flyersoft/views/GoogleBook3D;->start(FFZ)V

    :cond_24
    :goto_7
    return v4
.end method

.method public updateBitmaps()V
    .locals 4

    .line 591
    iget v0, p0, Lcom/flyersoft/views/NewCurl3D;->pageWidth:I

    if-lez v0, :cond_1

    iget v0, p0, Lcom/flyersoft/views/NewCurl3D;->pageHeight:I

    if-gtz v0, :cond_0

    goto :goto_0

    .line 594
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/NewCurl3D$Render3D;->removeCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    .line 595
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/NewCurl3D$Render3D;->removeCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    .line 596
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/NewCurl3D$Render3D;->removeCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    .line 597
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    const/4 v1, -0x1

    iput v1, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->texIndex:I

    iput v1, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->imageIndex:I

    .line 598
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iput v1, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->texIndex:I

    iput v1, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->imageIndex:I

    .line 599
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageCurl:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iput v1, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->texIndex:I

    iput v1, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->imageIndex:I

    .line 601
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-boolean v1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setBitmap(II)V

    .line 602
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setRect(Landroid/graphics/RectF;)V

    .line 603
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->reset()V

    .line 604
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageRight:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/NewCurl3D$Render3D;->addCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    .line 606
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-boolean v1, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    const/4 v3, 0x1

    xor-int/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setBitmap(II)V

    .line 607
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    invoke-virtual {v1, v3}, Lcom/flyersoft/views/NewCurl3D$Render3D;->getPageRect(I)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setRect(Landroid/graphics/RectF;)V

    .line 608
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->reset()V

    .line 609
    iget-boolean v0, p0, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    if-eqz v0, :cond_1

    .line 610
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D;->mRenderer:Lcom/flyersoft/views/NewCurl3D$Render3D;

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D;->mPageLeft:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/NewCurl3D$Render3D;->addCurlMesh(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    :cond_1
    :goto_0
    return-void
.end method
