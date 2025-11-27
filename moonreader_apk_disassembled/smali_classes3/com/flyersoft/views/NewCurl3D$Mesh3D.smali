.class Lcom/flyersoft/views/NewCurl3D$Mesh3D;
.super Ljava/lang/Object;
.source "NewCurl3D.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/NewCurl3D;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Mesh3D"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;,
        Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;,
        Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;
    }
.end annotation


# static fields
.field private static final DRAW_CURL_POSITION:Z = false

.field private static final DRAW_POLYGON_OUTLINES:Z = false

.field private static final DRAW_SHADOW:Z = true

.field private static final DRAW_TEXTURE:Z = true

.field private static final FRONTFACE_ALPHA:D = 1.0


# instance fields
.field BACKFACE_ALPHA:D

.field SHADOW_INNER_COLOR:[F

.field SHADOW_OUTER_COLOR:[F

.field public bitmaps:[Landroid/graphics/Bitmap;

.field imageIndex:I

.field private isLeftBackShow:Z

.field private mColors:Ljava/nio/FloatBuffer;

.field private mCurlPositionLines:Ljava/nio/FloatBuffer;

.field private mCurlPositionLinesCount:I

.field private mDropShadowCount:I

.field private mDropShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array<",
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;",
            ">;"
        }
    .end annotation
.end field

.field private mFlipTexture:Z

.field private mIntersections:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array<",
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;",
            ">;"
        }
    .end annotation
.end field

.field private mMaxCurlSplits:I

.field private mOutputVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array<",
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;",
            ">;"
        }
    .end annotation
.end field

.field private mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

.field private mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array<",
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;",
            ">;"
        }
    .end annotation
.end field

.field private mScanLines:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field private mSelfShadowCount:I

.field private mSelfShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array<",
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;",
            ">;"
        }
    .end annotation
.end field

.field private mShadowColors:Ljava/nio/FloatBuffer;

.field private mShadowVertices:Ljava/nio/FloatBuffer;

.field private mTempShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array<",
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;",
            ">;"
        }
    .end annotation
.end field

.field private mTempVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array<",
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;",
            ">;"
        }
    .end annotation
.end field

.field private mTexCoords:Ljava/nio/FloatBuffer;

.field private mTextureIds:[I

.field private mTextureRect:Landroid/graphics/RectF;

.field private mVertices:Ljava/nio/FloatBuffer;

.field private mVerticesCountBack:I

.field private mVerticesCountFront:I

.field name:Ljava/lang/String;

.field texIndex:I

.field final synthetic this$0:Lcom/flyersoft/views/NewCurl3D;


# direct methods
.method static bridge synthetic -$$Nest$fgetmTextureIds(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)[I
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mdrawGoogleBook(Lcom/flyersoft/views/NewCurl3D$Mesh3D;Ljavax/microedition/khronos/opengles/GL10;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->drawGoogleBook(Ljavax/microedition/khronos/opengles/GL10;Z)V

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/views/NewCurl3D;I)V
    .locals 9
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

    .line 963
    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 923
    const-string p1, ""

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->name:Ljava/lang/String;

    const/4 p1, 0x4

    .line 925
    new-array v0, p1, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->SHADOW_INNER_COLOR:[F

    .line 926
    new-array v0, p1, [F

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->SHADOW_OUTER_COLOR:[F

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 928
    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->BACKFACE_ALPHA:D

    const/4 v2, 0x0

    .line 930
    iput-boolean v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mFlipTexture:Z

    .line 947
    new-array v3, p1, [Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    iput-object v3, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    const/4 v3, 0x3

    .line 950
    new-array v4, v3, [Landroid/graphics/Bitmap;

    iput-object v4, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    .line 951
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    iput-object v4, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureRect:Landroid/graphics/RectF;

    .line 952
    iput-boolean v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->isLeftBackShow:Z

    const/4 v4, 0x1

    if-ge p2, v4, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    move v5, p2

    .line 964
    :goto_0
    iput v5, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mMaxCurlSplits:I

    .line 965
    new-instance v5, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    const/4 v6, 0x2

    add-int/2addr p2, v6

    invoke-direct {v5, p0, p2}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;-><init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;I)V

    iput-object v5, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mScanLines:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    .line 966
    new-instance p2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    const/4 v5, 0x7

    invoke-direct {p2, p0, v5}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;-><init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;I)V

    iput-object p2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mOutputVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    .line 967
    new-instance p2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;-><init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;I)V

    iput-object p2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    .line 968
    new-instance p2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-direct {p2, p0, v6}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;-><init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;I)V

    iput-object p2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mIntersections:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    .line 969
    new-instance p2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    const/16 v5, 0xb

    invoke-direct {p2, p0, v5}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;-><init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;I)V

    iput-object p2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    const/4 p2, 0x0

    :goto_1
    if-ge p2, v5, :cond_1

    .line 971
    iget-object v7, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    new-instance v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    invoke-direct {v8, p0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;-><init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    invoke-virtual {v7, v8}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->add(Ljava/lang/Object;)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    .line 975
    :cond_1
    new-instance p2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    iget v5, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mMaxCurlSplits:I

    add-int/2addr v5, v6

    mul-int/lit8 v5, v5, 0x2

    invoke-direct {p2, p0, v5}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;-><init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;I)V

    iput-object p2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mSelfShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    .line 976
    new-instance p2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    iget v5, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mMaxCurlSplits:I

    add-int/2addr v5, v6

    mul-int/lit8 v5, v5, 0x2

    invoke-direct {p2, p0, v5}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;-><init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;I)V

    iput-object p2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mDropShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    .line 977
    new-instance p2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    iget v5, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mMaxCurlSplits:I

    add-int/2addr v5, v6

    mul-int/lit8 v5, v5, 0x2

    invoke-direct {p2, p0, v5}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;-><init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;I)V

    iput-object p2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    const/4 p2, 0x0

    .line 978
    :goto_2
    iget v5, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mMaxCurlSplits:I

    add-int/2addr v5, v6

    mul-int/lit8 v5, v5, 0x2

    if-ge p2, v5, :cond_2

    .line 979
    iget-object v5, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    new-instance v7, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;-><init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;Lcom/flyersoft/views/NewCurl3D-IA;)V

    invoke-virtual {v5, v7}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->add(Ljava/lang/Object;)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    :cond_2
    const/4 p2, 0x0

    :goto_3
    if-ge p2, p1, :cond_3

    .line 984
    iget-object v5, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    new-instance v7, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    invoke-direct {v7, p0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;-><init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    aput-object v7, v5, p2

    add-int/lit8 p2, p2, 0x1

    goto :goto_3

    .line 986
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    aget-object p2, p1, v2

    aget-object v4, p1, v4

    aget-object p1, p1, v3

    const-wide/high16 v7, -0x4010000000000000L    # -1.0

    iput-wide v7, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraY:D

    iput-wide v7, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraY:D

    iput-wide v7, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    iput-wide v7, p2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    .line 987
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    aget-object p2, p1, v2

    aget-object v4, p1, v6

    aget-object p1, p1, v3

    iput-wide v0, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    iput-wide v0, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraY:D

    iput-wide v0, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    iput-wide v0, p2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraY:D

    .line 997
    iget p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mMaxCurlSplits:I

    mul-int/lit8 p1, p1, 0x2

    add-int/lit8 p1, p1, 0x6

    mul-int/lit8 p2, p1, 0xc

    .line 998
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p2

    .line 999
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 1000
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVertices:Ljava/nio/FloatBuffer;

    .line 1001
    invoke-virtual {p2, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    mul-int/lit8 p2, p1, 0x8

    .line 1004
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p2

    .line 1005
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 1006
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTexCoords:Ljava/nio/FloatBuffer;

    .line 1007
    invoke-virtual {p2, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    mul-int/lit8 p1, p1, 0x10

    .line 1010
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 1011
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 1012
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mColors:Ljava/nio/FloatBuffer;

    .line 1013
    invoke-virtual {p1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1016
    iget p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mMaxCurlSplits:I

    add-int/2addr p1, v6

    mul-int/lit8 p2, p1, 0x40

    .line 1017
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p2

    .line 1018
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 1019
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowColors:Ljava/nio/FloatBuffer;

    .line 1020
    invoke-virtual {p2, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    mul-int/lit8 p1, p1, 0x30

    .line 1022
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 1023
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 1024
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    .line 1025
    invoke-virtual {p1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1027
    iput v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mSelfShadowCount:I

    iput v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mDropShadowCount:I

    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x3f000000    # 0.5f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private addVertex(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;)V
    .locals 3

    .line 1754
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVertices:Ljava/nio/FloatBuffer;

    iget-wide v1, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    double-to-float v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1755
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVertices:Ljava/nio/FloatBuffer;

    iget-wide v1, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    double-to-float v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1756
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVertices:Ljava/nio/FloatBuffer;

    iget-wide v1, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    double-to-float v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1757
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mColors:Ljava/nio/FloatBuffer;

    iget-wide v1, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mColor:D

    double-to-float v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1758
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mColors:Ljava/nio/FloatBuffer;

    iget-wide v1, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mColor:D

    double-to-float v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1759
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mColors:Ljava/nio/FloatBuffer;

    iget-wide v1, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mColor:D

    double-to-float v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1760
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mColors:Ljava/nio/FloatBuffer;

    iget-wide v1, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mAlpha:D

    double-to-float v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1762
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTexCoords:Ljava/nio/FloatBuffer;

    iget-wide v1, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexX:D

    double-to-float v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1763
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTexCoords:Ljava/nio/FloatBuffer;

    iget-wide v1, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexY:D

    double-to-float p1, v1

    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    return-void
.end method

.method private declared-synchronized drawGoogleBook(Ljavax/microedition/khronos/opengles/GL10;Z)V
    .locals 22

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    monitor-enter p0

    const/16 v2, 0xb44

    .line 1419
    :try_start_0
    invoke-interface {v0, v2}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 1421
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v2

    .line 1422
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->name:Ljava/lang/String;

    const-string v4, "pageLeft"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1423
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGBBgLeft(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v2

    goto :goto_0

    .line 1424
    :cond_0
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->name:Ljava/lang/String;

    const-string v4, "pageRight"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1425
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v2}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGBBgRight(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v2

    :cond_1
    :goto_0
    const/16 v3, 0xbe2

    .line 1429
    invoke-interface {v0, v3}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    const/16 v4, 0xde1

    .line 1430
    invoke-interface {v0, v4}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    const v5, 0x8078

    .line 1431
    invoke-interface {v0, v5}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    const/16 v6, 0x303

    const/16 v7, 0x302

    .line 1432
    invoke-interface {v0, v7, v6}, Ljavax/microedition/khronos/opengles/GL10;->glBlendFunc(II)V

    .line 1433
    iget-object v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I

    const/4 v9, 0x0

    aget v8, v8, v9

    invoke-interface {v0, v4, v8}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    const/16 v8, 0x1702

    .line 1434
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glMatrixMode(I)V

    .line 1435
    invoke-interface {v0}, Ljavax/microedition/khronos/opengles/GL10;->glLoadIdentity()V

    .line 1436
    iget-object v10, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v10}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmUScale(Lcom/flyersoft/views/NewCurl3D;)F

    move-result v10

    iget-object v11, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v11}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmVScale(Lcom/flyersoft/views/NewCurl3D;)F

    move-result v11

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-interface {v0, v10, v11, v12}, Ljavax/microedition/khronos/opengles/GL10;->glScalef(FFF)V

    const/16 v10, 0x1700

    .line 1437
    invoke-interface {v0, v10}, Ljavax/microedition/khronos/opengles/GL10;->glMatrixMode(I)V

    .line 1438
    invoke-interface {v0}, Ljavax/microedition/khronos/opengles/GL10;->glPushMatrix()V

    .line 1439
    iget-object v11, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v11}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v11

    const/4 v13, 0x0

    if-ne v2, v11, :cond_2

    iget-object v11, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v11}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v11

    iget v11, v11, Lcom/flyersoft/views/GoogleBook3D;->mT:F

    float-to-double v14, v11

    const-wide v16, 0x3fd3333333333333L    # 0.3

    cmpl-double v11, v14, v16

    if-lez v11, :cond_2

    if-nez p2, :cond_2

    .line 1441
    iget-object v11, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v11}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v11

    iget v11, v11, Lcom/flyersoft/views/GoogleBook3D;->mT:F

    const v14, 0x3e99999a    # 0.3f

    sub-float/2addr v11, v14

    const v14, 0x3f8ccccd    # 1.1f

    div-float/2addr v11, v14

    invoke-interface {v0, v13, v13, v11}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    :cond_2
    const v11, 0x8074

    .line 1445
    invoke-interface {v0, v11}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    .line 1448
    iget-object v14, v2, Lcom/flyersoft/views/GoogleBook3D;->mFBTexcoord:Ljava/nio/FloatBuffer;

    const/4 v15, 0x2

    const/16 v11, 0x1406

    invoke-interface {v0, v15, v11, v9, v14}, Ljavax/microedition/khronos/opengles/GL10;->glTexCoordPointer(IIILjava/nio/Buffer;)V

    .line 1450
    iget-object v14, v2, Lcom/flyersoft/views/GoogleBook3D;->mFBPosition:Ljava/nio/FloatBuffer;

    const/4 v5, 0x3

    invoke-interface {v0, v5, v11, v9, v14}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    if-eqz p2, :cond_5

    const/16 v18, 0x1

    .line 1454
    iget-boolean v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->isLeftBackShow:Z

    const/16 v19, 0x0

    if-eqz v14, :cond_3

    .line 1455
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object v14, v14, v15

    if-eqz v14, :cond_4

    invoke-virtual {v14}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v14

    if-nez v14, :cond_4

    .line 1457
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I

    aget v14, v14, v18

    invoke-interface {v0, v4, v14}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 1458
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object v14, v14, v15

    invoke-static {v4, v9, v14, v9}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 1459
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object v14, v14, v15

    invoke-virtual {v14}, Landroid/graphics/Bitmap;->recycle()V

    .line 1460
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aput-object v19, v14, v15

    goto :goto_1

    .line 1464
    :cond_3
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object v14, v14, v18

    if-eqz v14, :cond_4

    invoke-virtual {v14}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v14

    if-nez v14, :cond_4

    .line 1466
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I

    aget v14, v14, v18

    invoke-interface {v0, v4, v14}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 1467
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object v14, v14, v18

    invoke-static {v4, v9, v14, v9}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 1468
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object v14, v14, v18

    invoke-virtual {v14}, Landroid/graphics/Bitmap;->recycle()V

    .line 1469
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aput-object v19, v14, v18

    .line 1473
    :cond_4
    :goto_1
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I

    aget v14, v14, v18

    invoke-interface {v0, v4, v14}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    goto :goto_2

    :cond_5
    const/16 v18, 0x1

    .line 1476
    :goto_2
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v14}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v14

    const/16 v4, 0x1403

    const/16 v10, 0x405

    const/16 v6, 0x404

    const/4 v7, 0x4

    if-ne v2, v14, :cond_7

    if-eqz p2, :cond_7

    .line 1480
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v14}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v14

    iget v14, v14, Lcom/flyersoft/views/GoogleBook3D;->mDir:I

    if-ne v14, v15, :cond_6

    .line 1481
    invoke-interface {v0, v10}, Ljavax/microedition/khronos/opengles/GL10;->glCullFace(I)V

    .line 1482
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glMatrixMode(I)V

    .line 1483
    invoke-interface {v0}, Ljavax/microedition/khronos/opengles/GL10;->glLoadIdentity()V

    .line 1484
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v14}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmUScale(Lcom/flyersoft/views/NewCurl3D;)F

    move-result v14

    invoke-interface {v0, v14, v13, v13}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 1485
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v14}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmUScale(Lcom/flyersoft/views/NewCurl3D;)F

    move-result v14

    neg-float v14, v14

    iget-object v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v8}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmVScale(Lcom/flyersoft/views/NewCurl3D;)F

    move-result v8

    invoke-interface {v0, v14, v8, v12}, Ljavax/microedition/khronos/opengles/GL10;->glScalef(FFF)V

    goto :goto_3

    .line 1487
    :cond_6
    invoke-interface {v0, v6}, Ljavax/microedition/khronos/opengles/GL10;->glCullFace(I)V

    .line 1489
    :goto_3
    iget-object v8, v2, Lcom/flyersoft/views/GoogleBook3D;->mFBPosition:Ljava/nio/FloatBuffer;

    invoke-interface {v0, v5, v11, v9, v8}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 1490
    iget-object v8, v2, Lcom/flyersoft/views/GoogleBook3D;->mIndices:[S

    array-length v8, v8

    iget-object v14, v2, Lcom/flyersoft/views/GoogleBook3D;->mSBIndices:Ljava/nio/ShortBuffer;

    invoke-interface {v0, v7, v8, v4, v14}, Ljavax/microedition/khronos/opengles/GL10;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 1496
    :cond_7
    invoke-interface {v0, v3}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    const/16 v8, 0x303

    const/16 v14, 0x302

    .line 1497
    invoke-interface {v0, v14, v8}, Ljavax/microedition/khronos/opengles/GL10;->glBlendFunc(II)V

    const v8, 0x8076

    .line 1498
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    .line 1499
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v14}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v14

    if-ne v2, v14, :cond_a

    const/16 v14, 0x1700

    .line 1500
    invoke-interface {v0, v14}, Ljavax/microedition/khronos/opengles/GL10;->glMatrixMode(I)V

    .line 1501
    invoke-interface {v0}, Ljavax/microedition/khronos/opengles/GL10;->glPushMatrix()V

    .line 1503
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v14}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v14

    iget v14, v14, Lcom/flyersoft/views/GoogleBook3D;->mT:F

    invoke-static {v14}, Ljava/lang/Math;->abs(F)F

    move-result v14

    if-eqz p2, :cond_8

    const v20, 0x3f19999a    # 0.6f

    cmpl-float v21, v14, v20

    if-lez v21, :cond_8

    sub-float v14, v14, v20

    const v20, 0x3ecccccd    # 0.4f

    div-float v14, v14, v20

    mul-float v14, v14, v12

    add-float/2addr v14, v12

    goto :goto_4

    :cond_8
    const/high16 v14, 0x3f800000    # 1.0f

    :goto_4
    if-eqz p2, :cond_9

    .line 1509
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v3

    iget v3, v3, Lcom/flyersoft/views/GoogleBook3D;->mDir:I

    if-ne v3, v15, :cond_9

    .line 1510
    invoke-interface {v0, v12, v13, v13, v12}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    .line 1511
    invoke-interface {v0, v6}, Ljavax/microedition/khronos/opengles/GL10;->glCullFace(I)V

    const/high16 v3, -0x40800000    # -1.0f

    .line 1512
    invoke-interface {v0, v3, v12, v12}, Ljavax/microedition/khronos/opengles/GL10;->glScalef(FFF)V

    .line 1513
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v3

    iget-object v3, v3, Lcom/flyersoft/views/GoogleBook3D;->mShadow:Lcom/flyersoft/views/GoogleBook3D;

    iget v3, v3, Lcom/flyersoft/views/GoogleBook3D;->mTx:F

    neg-float v3, v3

    iget-object v6, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v6}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v6

    iget-object v6, v6, Lcom/flyersoft/views/GoogleBook3D;->mShadow:Lcom/flyersoft/views/GoogleBook3D;

    iget v6, v6, Lcom/flyersoft/views/GoogleBook3D;->mWidth:F

    add-float/2addr v3, v6

    iget-object v6, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v6}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v6

    iget-object v6, v6, Lcom/flyersoft/views/GoogleBook3D;->mShadow:Lcom/flyersoft/views/GoogleBook3D;

    iget v6, v6, Lcom/flyersoft/views/GoogleBook3D;->mTz:F

    invoke-interface {v0, v3, v13, v6}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 1514
    invoke-interface {v0, v14, v12, v12}, Ljavax/microedition/khronos/opengles/GL10;->glScalef(FFF)V

    sub-float v3, v14, v12

    .line 1515
    iget-object v6, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v6}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v6

    iget-object v6, v6, Lcom/flyersoft/views/GoogleBook3D;->mShadow:Lcom/flyersoft/views/GoogleBook3D;

    iget v6, v6, Lcom/flyersoft/views/GoogleBook3D;->mWidth:F

    mul-float v3, v3, v6

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v3, v6

    div-float/2addr v3, v14

    invoke-interface {v0, v3, v13, v13}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    goto :goto_5

    .line 1517
    :cond_9
    invoke-interface {v0, v10}, Ljavax/microedition/khronos/opengles/GL10;->glCullFace(I)V

    .line 1518
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v3

    iget-object v3, v3, Lcom/flyersoft/views/GoogleBook3D;->mShadow:Lcom/flyersoft/views/GoogleBook3D;

    iget v3, v3, Lcom/flyersoft/views/GoogleBook3D;->mTx:F

    iget-object v6, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v6}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v6

    iget-object v6, v6, Lcom/flyersoft/views/GoogleBook3D;->mShadow:Lcom/flyersoft/views/GoogleBook3D;

    iget v6, v6, Lcom/flyersoft/views/GoogleBook3D;->mTz:F

    invoke-interface {v0, v3, v13, v6}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 1519
    invoke-interface {v0, v14, v12, v12}, Ljavax/microedition/khronos/opengles/GL10;->glScalef(FFF)V

    sub-float v3, v14, v12

    .line 1520
    iget-object v6, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v6}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v6

    iget-object v6, v6, Lcom/flyersoft/views/GoogleBook3D;->mShadow:Lcom/flyersoft/views/GoogleBook3D;

    iget v6, v6, Lcom/flyersoft/views/GoogleBook3D;->mWidth:F

    mul-float v3, v3, v6

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v3, v6

    div-float/2addr v3, v14

    invoke-interface {v0, v3, v13, v13}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 1523
    :goto_5
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGBShadow(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v3

    iget-object v3, v3, Lcom/flyersoft/views/GoogleBook3D;->mFBShadow:Ljava/nio/FloatBuffer;

    invoke-interface {v0, v7, v11, v9, v3}, Ljavax/microedition/khronos/opengles/GL10;->glColorPointer(IIILjava/nio/Buffer;)V

    .line 1524
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGBShadow(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v3

    iget-object v3, v3, Lcom/flyersoft/views/GoogleBook3D;->mFBPosition:Ljava/nio/FloatBuffer;

    invoke-interface {v0, v5, v11, v9, v3}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 1525
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGBShadow(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v3

    iget-object v3, v3, Lcom/flyersoft/views/GoogleBook3D;->mIndices:[S

    array-length v3, v3

    iget-object v6, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v6}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGBShadow(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v6

    iget-object v6, v6, Lcom/flyersoft/views/GoogleBook3D;->mSBIndices:Ljava/nio/ShortBuffer;

    invoke-interface {v0, v7, v3, v4, v6}, Ljavax/microedition/khronos/opengles/GL10;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 1527
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V

    .line 1528
    invoke-interface {v0}, Ljavax/microedition/khronos/opengles/GL10;->glPopMatrix()V

    .line 1530
    :cond_a
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V

    const/16 v3, 0xbe2

    .line 1531
    invoke-interface {v0, v3}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    const v3, 0x8078

    .line 1535
    invoke-interface {v0, v3}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    .line 1536
    iget-object v3, v2, Lcom/flyersoft/views/GoogleBook3D;->mFBTexcoord:Ljava/nio/FloatBuffer;

    invoke-interface {v0, v15, v11, v9, v3}, Ljavax/microedition/khronos/opengles/GL10;->glTexCoordPointer(IIILjava/nio/Buffer;)V

    .line 1538
    iget-object v3, v2, Lcom/flyersoft/views/GoogleBook3D;->mFBPosition:Ljava/nio/FloatBuffer;

    invoke-interface {v0, v5, v11, v9, v3}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 1541
    invoke-interface {v0, v12, v12, v12, v12}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    .line 1542
    iget-object v3, v2, Lcom/flyersoft/views/GoogleBook3D;->mIndices:[S

    array-length v3, v3

    .line 1546
    iget-object v6, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v6}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v6

    iget v6, v6, Lcom/flyersoft/views/GoogleBook3D;->mDir:I

    const/4 v14, 0x1

    if-eq v6, v14, :cond_c

    iget-object v6, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v6}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v6

    if-ne v2, v6, :cond_c

    if-nez p2, :cond_b

    goto :goto_6

    :cond_b
    const/16 v6, 0x404

    .line 1549
    invoke-interface {v0, v6}, Ljavax/microedition/khronos/opengles/GL10;->glCullFace(I)V

    const/16 v6, 0x1702

    .line 1550
    invoke-interface {v0, v6}, Ljavax/microedition/khronos/opengles/GL10;->glMatrixMode(I)V

    .line 1551
    invoke-interface {v0}, Ljavax/microedition/khronos/opengles/GL10;->glLoadIdentity()V

    .line 1552
    iget-object v6, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v6}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmUScale(Lcom/flyersoft/views/NewCurl3D;)F

    move-result v6

    invoke-interface {v0, v6, v13, v13}, Ljavax/microedition/khronos/opengles/GL10;->glTranslatef(FFF)V

    .line 1553
    iget-object v6, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v6}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmUScale(Lcom/flyersoft/views/NewCurl3D;)F

    move-result v6

    neg-float v6, v6

    iget-object v10, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v10}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmVScale(Lcom/flyersoft/views/NewCurl3D;)F

    move-result v10

    invoke-interface {v0, v6, v10, v12}, Ljavax/microedition/khronos/opengles/GL10;->glScalef(FFF)V

    goto :goto_7

    .line 1547
    :cond_c
    :goto_6
    invoke-interface {v0, v10}, Ljavax/microedition/khronos/opengles/GL10;->glCullFace(I)V

    :goto_7
    const/16 v6, 0xde1

    .line 1555
    invoke-interface {v0, v6}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    const/16 v10, 0xbe2

    .line 1559
    invoke-interface {v0, v10}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 1560
    invoke-interface {v0, v6}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 1561
    iget-object v10, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I

    aget v10, v10, v9

    invoke-interface {v0, v6, v10}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    const/16 v10, 0x303

    const/16 v14, 0x302

    .line 1562
    invoke-interface {v0, v14, v10}, Ljavax/microedition/khronos/opengles/GL10;->glBlendFunc(II)V

    .line 1563
    iget-object v2, v2, Lcom/flyersoft/views/GoogleBook3D;->mSBIndices:Ljava/nio/ShortBuffer;

    invoke-interface {v0, v7, v3, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 1565
    invoke-interface {v0, v6}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    const/16 v3, 0xbe2

    .line 1566
    invoke-interface {v0, v3}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    if-nez p2, :cond_d

    .line 1583
    invoke-interface {v0, v3}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    const/16 v10, 0x303

    const/16 v14, 0x302

    .line 1584
    invoke-interface {v0, v14, v10}, Ljavax/microedition/khronos/opengles/GL10;->glBlendFunc(II)V

    .line 1585
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    .line 1586
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V

    .line 1587
    invoke-interface {v0, v3}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    :cond_d
    const v3, 0x8078

    .line 1590
    invoke-interface {v0, v3}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V

    .line 1591
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V

    const/16 v3, 0xbe2

    .line 1614
    invoke-interface {v0, v3}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    const/16 v10, 0x303

    const/16 v14, 0x302

    .line 1615
    invoke-interface {v0, v14, v10}, Ljavax/microedition/khronos/opengles/GL10;->glBlendFunc(II)V

    .line 1616
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    .line 1617
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowColors:Ljava/nio/FloatBuffer;

    invoke-interface {v0, v7, v11, v9, v2}, Ljavax/microedition/khronos/opengles/GL10;->glColorPointer(IIILjava/nio/Buffer;)V

    .line 1618
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    invoke-interface {v0, v5, v11, v9, v2}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 1619
    iget v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mDropShadowCount:I

    iget v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mSelfShadowCount:I

    const/4 v4, 0x5

    invoke-interface {v0, v4, v2, v3}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 1620
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V

    const/16 v3, 0xbe2

    .line 1621
    invoke-interface {v0, v3}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    const v2, 0x8074

    .line 1624
    invoke-interface {v0, v2}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V

    .line 1625
    invoke-interface {v0}, Ljavax/microedition/khronos/opengles/GL10;->glPopMatrix()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1626
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private getIntersections(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;[[ID)Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array<",
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;",
            ">;[[ID)",
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array<",
            "Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-wide/from16 v3, p3

    .line 1768
    iget-object v5, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mIntersections:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v5}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->clear()V

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 1769
    :goto_0
    array-length v7, v2

    if-ge v6, v7, :cond_1

    .line 1770
    aget-object v7, v2, v6

    aget v7, v7, v5

    invoke-virtual {v1, v7}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    .line 1771
    aget-object v8, v2, v6

    const/4 v9, 0x1

    aget v8, v8, v9

    invoke-virtual {v1, v8}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    .line 1772
    iget-wide v9, v7, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    cmpl-double v11, v9, v3

    if-lez v11, :cond_0

    iget-wide v9, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    cmpg-double v11, v9, v3

    if-gez v11, :cond_0

    .line 1773
    iget-wide v9, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    sub-double v9, v3, v9

    iget-wide v11, v7, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    iget-wide v13, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    sub-double/2addr v11, v13

    div-double/2addr v9, v11

    .line 1774
    iget-object v11, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v11, v5}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->remove(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    .line 1775
    invoke-virtual {v11, v8}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->set(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;)V

    .line 1776
    iput-wide v3, v11, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    .line 1777
    iget-wide v12, v11, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    iget-wide v14, v7, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    move/from16 v16, v6

    iget-wide v5, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    sub-double/2addr v14, v5

    mul-double v14, v14, v9

    add-double/2addr v12, v14

    iput-wide v12, v11, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    .line 1779
    iget-wide v5, v11, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexX:D

    iget-wide v12, v7, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexX:D

    iget-wide v14, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexX:D

    sub-double/2addr v12, v14

    mul-double v12, v12, v9

    add-double/2addr v5, v12

    iput-wide v5, v11, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexX:D

    .line 1780
    iget-wide v5, v11, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexY:D

    iget-wide v12, v7, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexY:D

    iget-wide v14, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexY:D

    sub-double/2addr v12, v14

    mul-double v12, v12, v9

    add-double/2addr v5, v12

    iput-wide v5, v11, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexY:D

    .line 1783
    iget-wide v5, v11, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    iget-wide v12, v7, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    iget-wide v14, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    sub-double/2addr v12, v14

    mul-double v12, v12, v9

    add-double/2addr v5, v12

    iput-wide v5, v11, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    .line 1784
    iget-wide v5, v11, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraY:D

    iget-wide v12, v7, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraY:D

    iget-wide v7, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraY:D

    sub-double/2addr v12, v7

    mul-double v12, v12, v9

    add-double/2addr v5, v12

    iput-wide v5, v11, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraY:D

    .line 1786
    iget-object v5, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mIntersections:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v5, v11}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->add(Ljava/lang/Object;)V

    goto :goto_1

    :cond_0
    move/from16 v16, v6

    :goto_1
    add-int/lit8 v6, v16, 0x1

    const/4 v5, 0x0

    goto/16 :goto_0

    .line 1789
    :cond_1
    iget-object v1, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mIntersections:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    return-object v1
.end method

.method private getNextHighestPO2(I)I
    .locals 1

    add-int/lit8 p1, p1, -0x1

    shr-int/lit8 v0, p1, 0x1

    or-int/2addr p1, v0

    shr-int/lit8 v0, p1, 0x2

    or-int/2addr p1, v0

    shr-int/lit8 v0, p1, 0x4

    or-int/2addr p1, v0

    shr-int/lit8 v0, p1, 0x8

    or-int/2addr p1, v0

    shr-int/lit8 v0, p1, 0x10

    or-int/2addr p1, v0

    shr-int/lit8 v0, p1, 0x20

    or-int/2addr p1, v0

    add-int/lit8 p1, p1, 0x1

    return p1
.end method

.method private declared-synchronized setTexCoords(FFFF)V
    .locals 4

    monitor-enter p0

    .line 1804
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    float-to-double v2, p1

    iput-wide v2, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexX:D

    .line 1805
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    aget-object p1, p1, v1

    float-to-double v0, p2

    iput-wide v0, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexY:D

    .line 1806
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    const/4 p2, 0x1

    aget-object p1, p1, p2

    iput-wide v2, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexX:D

    .line 1807
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    aget-object p1, p1, p2

    float-to-double v2, p4

    iput-wide v2, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexY:D

    .line 1808
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    const/4 p2, 0x2

    aget-object p1, p1, p2

    float-to-double p3, p3

    iput-wide p3, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexX:D

    .line 1809
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    aget-object p1, p1, p2

    iput-wide v0, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexY:D

    .line 1810
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    const/4 p2, 0x3

    aget-object p1, p1, p2

    iput-wide p3, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexX:D

    .line 1811
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    aget-object p1, p1, p2

    iput-wide v2, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexY:D
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1812
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


# virtual methods
.method public declared-synchronized curl(Landroid/graphics/PointF;Landroid/graphics/PointF;D)V
    .locals 31

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move-object/from16 v2, p2

    monitor-enter p0

    .line 1053
    :try_start_0
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVertices:Ljava/nio/FloatBuffer;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1054
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mColors:Ljava/nio/FloatBuffer;

    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1056
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTexCoords:Ljava/nio/FloatBuffer;

    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1059
    iget v3, v2, Landroid/graphics/PointF;->x:F

    float-to-double v5, v3

    invoke-static {v5, v6}, Ljava/lang/Math;->acos(D)D

    move-result-wide v5

    .line 1060
    iget v3, v2, Landroid/graphics/PointF;->y:F

    const/4 v7, 0x0

    cmpl-float v3, v3, v7

    if-lez v3, :cond_0

    neg-double v5, v5

    .line 1062
    :cond_0
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    iget-object v7, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v3, v7}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->addAll(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;)V

    .line 1063
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->clear()V

    const/4 v3, 0x0

    :goto_0
    const/4 v7, 0x4

    if-ge v3, v7, :cond_4

    .line 1065
    iget-object v7, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v7, v4}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->remove(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    .line 1066
    iget-object v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    aget-object v8, v8, v3

    invoke-virtual {v7, v8}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->set(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;)V

    .line 1067
    iget v8, v0, Landroid/graphics/PointF;->x:F

    neg-float v8, v8

    float-to-double v8, v8

    iget v10, v0, Landroid/graphics/PointF;->y:F

    neg-float v10, v10

    float-to-double v10, v10

    invoke-virtual {v7, v8, v9, v10, v11}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->translate(DD)V

    neg-double v8, v5

    .line 1068
    invoke-virtual {v7, v8, v9}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->rotateZ(D)V

    const/4 v8, 0x0

    .line 1070
    :goto_1
    iget-object v9, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v9}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->size()I

    move-result v9

    if-ge v8, v9, :cond_3

    .line 1071
    iget-object v9, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v9, v8}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    .line 1072
    iget-wide v10, v7, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    iget-wide v12, v9, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    cmpl-double v14, v10, v12

    if-lez v14, :cond_1

    goto :goto_2

    .line 1075
    :cond_1
    iget-wide v10, v7, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    iget-wide v12, v9, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    cmpl-double v14, v10, v12

    if-nez v14, :cond_2

    iget-wide v10, v7, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    iget-wide v12, v9, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    cmpl-double v9, v10, v12

    if-lez v9, :cond_2

    goto :goto_2

    :cond_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 1079
    :cond_3
    :goto_2
    iget-object v9, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v9, v8, v7}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->add(ILjava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    const/4 v3, 0x1

    .line 1082
    filled-new-array {v4, v3}, [I

    move-result-object v8

    const/4 v9, 0x2

    filled-new-array {v4, v9}, [I

    move-result-object v10

    const/4 v11, 0x3

    filled-new-array {v3, v11}, [I

    move-result-object v12

    filled-new-array {v9, v11}, [I

    move-result-object v13

    new-array v14, v7, [[I

    aput-object v8, v14, v4

    aput-object v10, v14, v3

    aput-object v12, v14, v9

    aput-object v13, v14, v11

    .line 1084
    iget-object v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v8, v4}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    .line 1085
    iget-object v10, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v10, v9}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    .line 1086
    iget-object v12, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v12, v11}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    const/4 v15, 0x1

    .line 1087
    iget-wide v3, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    move-object/from16 v16, v14

    iget-wide v13, v10, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    sub-double/2addr v3, v13

    iget-wide v13, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    move-object/from16 v19, v12

    const/16 v18, 0x3

    iget-wide v11, v10, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    sub-double/2addr v13, v11

    mul-double v3, v3, v13

    iget-wide v11, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    iget-wide v13, v10, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    sub-double/2addr v11, v13

    iget-wide v13, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    const/16 v20, 0x2

    iget-wide v9, v10, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    sub-double/2addr v13, v9

    mul-double v11, v11, v13

    add-double/2addr v3, v11

    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    .line 1089
    iget-wide v9, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    move-object/from16 v12, v19

    iget-wide v13, v12, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    sub-double/2addr v9, v13

    iget-wide v13, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    move-object/from16 v19, v8

    iget-wide v7, v12, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    sub-double/2addr v13, v7

    mul-double v9, v9, v13

    move-object/from16 v8, v19

    iget-wide v13, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    move-wide/from16 v21, v3

    iget-wide v3, v12, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    sub-double/2addr v13, v3

    iget-wide v3, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    iget-wide v7, v12, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    sub-double/2addr v3, v7

    mul-double v13, v13, v3

    add-double/2addr v9, v13

    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    cmpl-double v7, v21, v3

    if-lez v7, :cond_5

    .line 1092
    aget-object v3, v16, v15

    aput v18, v3, v15

    .line 1093
    aget-object v3, v16, v20

    aput v20, v3, v15

    :cond_5
    const/4 v13, 0x0

    .line 1097
    iput v13, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountBack:I

    iput v13, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountFront:I

    .line 1100
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mDropShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v3, v4}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->addAll(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;)V

    .line 1101
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mSelfShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v3, v4}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->addAll(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;)V

    .line 1102
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mDropShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->clear()V

    .line 1103
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mSelfShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->clear()V

    const-wide v3, 0x400921fb54442d18L    # Math.PI

    mul-double v7, p3, v3

    .line 1107
    iget-object v9, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mScanLines:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v9}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->clear()V

    .line 1108
    iget v9, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mMaxCurlSplits:I

    const-wide/16 v21, 0x0

    if-lez v9, :cond_6

    .line 1109
    iget-object v9, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mScanLines:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-static/range {v21 .. v22}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->add(Ljava/lang/Object;)V

    :cond_6
    const/4 v9, 0x1

    .line 1111
    :goto_3
    iget v10, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mMaxCurlSplits:I

    if-ge v9, v10, :cond_7

    .line 1112
    iget-object v12, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mScanLines:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    move-wide/from16 v23, v3

    neg-double v3, v7

    int-to-double v13, v9

    mul-double v3, v3, v13

    add-int/lit8 v10, v10, -0x1

    int-to-double v13, v10

    div-double/2addr v3, v13

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-virtual {v12, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->add(Ljava/lang/Object;)V

    add-int/lit8 v9, v9, 0x1

    move-wide/from16 v3, v23

    goto :goto_3

    :cond_7
    move-wide/from16 v23, v3

    .line 1114
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mScanLines:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    const/4 v9, 0x3

    invoke-virtual {v4, v9}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    iget-wide v9, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    const-wide/high16 v18, 0x3ff0000000000000L    # 1.0

    sub-double v9, v9, v18

    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->add(Ljava/lang/Object;)V

    .line 1116
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    const/4 v13, 0x0

    invoke-virtual {v3, v13}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    iget-wide v3, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    add-double v3, v3, v18

    const/4 v9, 0x0

    .line 1117
    :goto_4
    iget-object v10, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mScanLines:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v10}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->size()I

    move-result v10

    if-ge v9, v10, :cond_1b

    .line 1118
    iget-object v10, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mScanLines:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v10, v9}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Double;

    invoke-virtual {v10}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v11

    const/4 v10, 0x0

    .line 1119
    :goto_5
    iget-object v13, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v13}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->size()I

    move-result v13

    if-ge v10, v13, :cond_c

    .line 1120
    iget-object v13, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v13, v10}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    .line 1121
    iget-wide v14, v13, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    cmpl-double v25, v14, v11

    if-ltz v25, :cond_b

    iget-wide v14, v13, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    cmpg-double v25, v14, v3

    if-gtz v25, :cond_b

    .line 1122
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->remove(I)Ljava/lang/Object;

    move-result-object v14

    move-object v15, v13

    check-cast v14, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    .line 1123
    invoke-virtual {v14, v15}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->set(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;)V

    .line 1124
    iget-object v13, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    move-wide/from16 v25, v3

    iget-wide v3, v14, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    move-wide/from16 v27, v7

    move-object/from16 v7, v16

    invoke-direct {v1, v13, v7, v3, v4}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->getIntersections(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;[[ID)Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    move-result-object v3

    .line 1125
    invoke-virtual {v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->size()I

    move-result v4

    const/4 v8, 0x1

    if-ne v4, v8, :cond_9

    move-object v4, v15

    const/4 v13, 0x0

    invoke-virtual {v3, v13}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    move-object/from16 v16, v14

    iget-wide v13, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    move-wide/from16 v29, v13

    iget-wide v13, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    cmpl-double v4, v29, v13

    if-lez v4, :cond_8

    .line 1126
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mOutputVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v4, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->addAll(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;)V

    .line 1127
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mOutputVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    move-object/from16 v14, v16

    invoke-virtual {v3, v14}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->add(Ljava/lang/Object;)V

    goto :goto_6

    :cond_8
    move-object/from16 v14, v16

    .line 1128
    :cond_9
    invoke-virtual {v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->size()I

    move-result v4

    const/4 v15, 0x1

    if-gt v4, v15, :cond_a

    .line 1129
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mOutputVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v4, v14}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->add(Ljava/lang/Object;)V

    .line 1130
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mOutputVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v4, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->addAll(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;)V

    goto :goto_6

    .line 1132
    :cond_a
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v4, v14}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->add(Ljava/lang/Object;)V

    .line 1133
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v4, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->addAll(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;)V

    goto :goto_6

    :cond_b
    move-wide/from16 v25, v3

    move-wide/from16 v27, v7

    move-object/from16 v7, v16

    :goto_6
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v16, v7

    move-wide/from16 v3, v25

    move-wide/from16 v7, v27

    const/4 v15, 0x1

    goto/16 :goto_5

    :cond_c
    move-wide/from16 v27, v7

    move-object/from16 v7, v16

    .line 1138
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRotatedVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-direct {v1, v3, v7, v11, v12}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->getIntersections(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;[[ID)Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    move-result-object v3

    .line 1139
    invoke-virtual {v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->size()I

    move-result v4

    const/4 v8, 0x2

    if-ne v4, v8, :cond_e

    const/4 v13, 0x0

    .line 1140
    invoke-virtual {v3, v13}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    const/4 v15, 0x1

    .line 1141
    invoke-virtual {v3, v15}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    .line 1142
    iget-wide v13, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    move-wide/from16 v25, v11

    iget-wide v10, v8, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    cmpg-double v12, v13, v10

    if-gez v12, :cond_d

    .line 1143
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mOutputVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v3, v8}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->add(Ljava/lang/Object;)V

    .line 1144
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mOutputVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v3, v4}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->add(Ljava/lang/Object;)V

    goto :goto_7

    .line 1146
    :cond_d
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mOutputVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v4, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->addAll(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;)V

    goto :goto_7

    :cond_e
    move-wide/from16 v25, v11

    .line 1148
    invoke-virtual {v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->size()I

    move-result v4

    if-eqz v4, :cond_f

    .line 1149
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v4, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->addAll(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;)V

    .line 1152
    :cond_f
    :goto_7
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mOutputVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->size()I

    move-result v3

    if-lez v3, :cond_1a

    .line 1153
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mOutputVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    const/4 v13, 0x0

    invoke-virtual {v3, v13}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->remove(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    .line 1154
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v4, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->add(Ljava/lang/Object;)V

    if-nez v9, :cond_11

    .line 1157
    iget-boolean v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mFlipTexture:Z

    if-eqz v4, :cond_10

    const-wide/high16 v16, 0x4000000000000000L    # 2.0

    iget-wide v10, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->BACKFACE_ALPHA:D

    goto :goto_8

    :cond_10
    const-wide/high16 v16, 0x4000000000000000L    # 2.0

    move-wide/from16 v10, v18

    :goto_8
    iput-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mAlpha:D

    .line 1158
    iget v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountFront:I

    const/4 v15, 0x1

    add-int/2addr v4, v15

    iput v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountFront:I

    goto/16 :goto_d

    :cond_11
    const-wide/high16 v16, 0x4000000000000000L    # 2.0

    .line 1159
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mScanLines:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v4}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->size()I

    move-result v4

    const/4 v15, 0x1

    sub-int/2addr v4, v15

    if-eq v9, v4, :cond_16

    cmpl-double v4, v27, v21

    if-nez v4, :cond_12

    goto :goto_b

    .line 1167
    :cond_12
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    div-double v10, v10, v27

    mul-double v10, v10, v23

    .line 1168
    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    move-result-wide v29

    mul-double v13, p3, v29

    iput-wide v13, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    .line 1169
    invoke-static {v10, v11}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    mul-double v12, v12, p3

    sub-double v12, p3, v12

    iput-wide v12, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    .line 1170
    iget-wide v12, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    invoke-static {v10, v11}, Ljava/lang/Math;->cos(D)D

    move-result-wide v29

    mul-double v12, v12, v29

    iput-wide v12, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    .line 1174
    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    move-result-wide v10

    const-wide/high16 v12, 0x3ff8000000000000L    # 1.5

    add-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    const-wide v12, 0x3fecccccc0000000L    # 0.8999999761581421

    mul-double v10, v10, v12

    const-wide v12, 0x3fb99999a0000000L    # 0.10000000149011612

    add-double/2addr v10, v12

    iput-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mColor:D

    .line 1176
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    cmpl-double v8, v10, p3

    if-ltz v8, :cond_14

    .line 1177
    iget-boolean v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mFlipTexture:Z

    if-eqz v8, :cond_13

    move-wide/from16 v10, v18

    goto :goto_9

    :cond_13
    iget-wide v10, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->BACKFACE_ALPHA:D

    :goto_9
    iput-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mAlpha:D

    .line 1178
    iget v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountBack:I

    const/4 v15, 0x1

    add-int/2addr v8, v15

    iput v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountBack:I

    goto :goto_d

    .line 1180
    :cond_14
    iget-boolean v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mFlipTexture:Z

    if-eqz v8, :cond_15

    iget-wide v10, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->BACKFACE_ALPHA:D

    goto :goto_a

    :cond_15
    move-wide/from16 v10, v18

    :goto_a
    iput-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mAlpha:D

    .line 1181
    iget v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountFront:I

    const/4 v15, 0x1

    add-int/2addr v8, v15

    iput v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountFront:I

    goto :goto_d

    .line 1160
    :cond_16
    :goto_b
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    add-double v10, v27, v10

    neg-double v10, v10

    iput-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    mul-double v10, p3, v16

    .line 1161
    iput-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    .line 1162
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    neg-double v10, v10

    iput-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    .line 1164
    iget-boolean v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mFlipTexture:Z

    if-eqz v8, :cond_17

    move-wide/from16 v10, v18

    goto :goto_c

    :cond_17
    iget-wide v10, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->BACKFACE_ALPHA:D

    :goto_c
    iput-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mAlpha:D

    .line 1165
    iget v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountBack:I

    const/4 v15, 0x1

    add-int/2addr v8, v15

    iput v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountBack:I

    .line 1185
    :goto_d
    invoke-virtual {v3, v5, v6}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->rotateZ(D)V

    .line 1186
    iget v8, v0, Landroid/graphics/PointF;->x:F

    float-to-double v10, v8

    iget v8, v0, Landroid/graphics/PointF;->y:F

    float-to-double v12, v8

    invoke-virtual {v3, v10, v11, v12, v13}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->translate(DD)V

    .line 1187
    invoke-direct {v1, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->addVertex(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;)V

    .line 1189
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    cmpl-double v8, v10, v21

    if-lez v8, :cond_18

    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    cmpg-double v8, v10, p3

    if-gtz v8, :cond_18

    .line 1190
    iget-object v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    const/4 v13, 0x0

    invoke-virtual {v8, v13}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->remove(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;

    .line 1191
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    iput-wide v10, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosX:D

    .line 1192
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    iput-wide v10, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosY:D

    .line 1193
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    iput-wide v10, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosZ:D

    .line 1194
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    div-double v10, v10, v16

    iget v8, v2, Landroid/graphics/PointF;->x:F

    neg-float v8, v8

    float-to-double v13, v8

    mul-double v10, v10, v13

    iput-wide v10, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPenumbraX:D

    .line 1195
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    div-double v10, v10, v16

    iget v8, v2, Landroid/graphics/PointF;->y:F

    neg-float v8, v8

    float-to-double v13, v8

    mul-double v10, v10, v13

    iput-wide v10, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPenumbraY:D

    .line 1196
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    div-double v10, v10, p3

    iput-wide v10, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPenumbraColor:D

    .line 1197
    iget-object v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mDropShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v8}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->size()I

    move-result v8

    const/4 v15, 0x1

    add-int/2addr v8, v15

    const/16 v20, 0x2

    div-int/lit8 v8, v8, 0x2

    .line 1198
    iget-object v10, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mDropShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v10, v8, v4}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->add(ILjava/lang/Object;)V

    .line 1200
    :cond_18
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    cmpl-double v4, v10, p3

    if-lez v4, :cond_19

    .line 1201
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTempShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    const/4 v13, 0x0

    invoke-virtual {v4, v13}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->remove(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;

    .line 1202
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    iput-wide v10, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosX:D

    .line 1203
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    iput-wide v10, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosY:D

    .line 1204
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    iput-wide v10, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosZ:D

    .line 1205
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    sub-double v10, v10, p3

    const-wide/high16 v29, 0x4008000000000000L    # 3.0

    div-double v10, v10, v29

    iget-wide v13, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    mul-double v10, v10, v13

    iput-wide v10, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPenumbraX:D

    .line 1206
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    sub-double v10, v10, p3

    div-double v10, v10, v29

    iget-wide v13, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraY:D

    mul-double v10, v10, v13

    iput-wide v10, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPenumbraY:D

    .line 1207
    iget-wide v10, v3, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    sub-double v10, v10, p3

    mul-double v13, p3, v16

    div-double/2addr v10, v13

    iput-wide v10, v4, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPenumbraColor:D

    .line 1208
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mSelfShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->size()I

    move-result v3

    const/4 v15, 0x1

    add-int/2addr v3, v15

    const/16 v20, 0x2

    div-int/lit8 v3, v3, 0x2

    .line 1209
    iget-object v8, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mSelfShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v8, v3, v4}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->add(ILjava/lang/Object;)V

    goto/16 :goto_7

    :cond_19
    const/4 v15, 0x1

    goto/16 :goto_7

    :cond_1a
    const/4 v15, 0x1

    add-int/lit8 v9, v9, 0x1

    move-object/from16 v16, v7

    move-wide/from16 v3, v25

    move-wide/from16 v7, v27

    const/16 v20, 0x2

    goto/16 :goto_4

    .line 1215
    :cond_1b
    iget-object v0, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVertices:Ljava/nio/FloatBuffer;

    const/4 v13, 0x0

    invoke-virtual {v0, v13}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1216
    iget-object v0, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mColors:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v13}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1218
    iget-object v0, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTexCoords:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v13}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1222
    iget-object v0, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowColors:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v13}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1223
    iget-object v0, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v13}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1224
    iput v13, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mDropShadowCount:I

    const/4 v0, 0x0

    .line 1226
    :goto_e
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mDropShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v2}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->size()I

    move-result v2

    if-ge v0, v2, :cond_1d

    .line 1227
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mDropShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v2, v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;

    .line 1228
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    iget-wide v4, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosX:D

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1229
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    iget-wide v4, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosY:D

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1230
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    iget-wide v4, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosZ:D

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1231
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    iget-wide v4, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosX:D

    iget-wide v6, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPenumbraX:D

    add-double/2addr v4, v6

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1232
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    iget-wide v4, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosY:D

    iget-wide v6, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPenumbraY:D

    add-double/2addr v4, v6

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1233
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    iget-wide v4, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosZ:D

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    const/4 v3, 0x0

    :goto_f
    const/4 v11, 0x4

    if-ge v3, v11, :cond_1c

    .line 1235
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->SHADOW_OUTER_COLOR:[F

    aget v4, v4, v3

    float-to-double v5, v4

    iget-object v7, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->SHADOW_INNER_COLOR:[F

    aget v7, v7, v3

    sub-float/2addr v7, v4

    float-to-double v7, v7

    iget-wide v9, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPenumbraColor:D

    mul-double v7, v7, v9

    add-double/2addr v5, v7

    .line 1237
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowColors:Ljava/nio/FloatBuffer;

    double-to-float v5, v5

    invoke-virtual {v4, v5}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 1239
    :cond_1c
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowColors:Ljava/nio/FloatBuffer;

    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->SHADOW_OUTER_COLOR:[F

    invoke-virtual {v2, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 1240
    iget v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mDropShadowCount:I

    const/16 v20, 0x2

    add-int/lit8 v2, v2, 0x2

    iput v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mDropShadowCount:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    :cond_1d
    const/4 v13, 0x0

    .line 1242
    iput v13, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mSelfShadowCount:I

    const/4 v0, 0x0

    .line 1243
    :goto_10
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mSelfShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v2}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->size()I

    move-result v2

    if-ge v0, v2, :cond_1f

    .line 1244
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mSelfShadowVertices:Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;

    invoke-virtual {v2, v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;

    .line 1245
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    iget-wide v4, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosX:D

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1246
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    iget-wide v4, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosY:D

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1247
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    iget-wide v4, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosZ:D

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1248
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    iget-wide v4, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosX:D

    iget-wide v6, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPenumbraX:D

    add-double/2addr v4, v6

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1249
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    iget-wide v4, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosY:D

    iget-wide v6, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPenumbraY:D

    add-double/2addr v4, v6

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1250
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    iget-wide v4, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPosZ:D

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    const/4 v3, 0x0

    const/4 v11, 0x4

    :goto_11
    if-ge v3, v11, :cond_1e

    .line 1252
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->SHADOW_OUTER_COLOR:[F

    aget v4, v4, v3

    float-to-double v5, v4

    iget-object v7, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->SHADOW_INNER_COLOR:[F

    aget v7, v7, v3

    sub-float/2addr v7, v4

    float-to-double v7, v7

    iget-wide v9, v2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->mPenumbraColor:D

    mul-double v7, v7, v9

    add-double/2addr v5, v7

    .line 1254
    iget-object v4, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowColors:Ljava/nio/FloatBuffer;

    double-to-float v5, v5

    invoke-virtual {v4, v5}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 1256
    :cond_1e
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowColors:Ljava/nio/FloatBuffer;

    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->SHADOW_OUTER_COLOR:[F

    invoke-virtual {v2, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 1257
    iget v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mSelfShadowCount:I

    const/16 v20, 0x2

    add-int/lit8 v2, v2, 0x2

    iput v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mSelfShadowCount:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 1259
    :cond_1f
    iget-object v0, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowColors:Ljava/nio/FloatBuffer;

    const/4 v13, 0x0

    invoke-virtual {v0, v13}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1260
    iget-object v0, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v13}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1262
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public declared-synchronized drawiBook(Ljavax/microedition/khronos/opengles/GL10;Z)V
    .locals 21

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    monitor-enter p0

    .line 1295
    :try_start_0
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    const/16 v4, 0xde1

    invoke-interface {v0, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    const v2, 0x8074

    .line 1298
    invoke-interface {v0, v2}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    const/16 v5, 0xbe2

    .line 1301
    invoke-interface {v0, v5}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    const/16 v6, 0x303

    const/16 v7, 0x302

    .line 1302
    invoke-interface {v0, v7, v6}, Ljavax/microedition/khronos/opengles/GL10;->glBlendFunc(II)V

    const v8, 0x8076

    .line 1303
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    .line 1304
    iget-object v9, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowColors:Ljava/nio/FloatBuffer;

    const/4 v10, 0x4

    const/16 v11, 0x1406

    invoke-interface {v0, v10, v11, v3, v9}, Ljavax/microedition/khronos/opengles/GL10;->glColorPointer(IIILjava/nio/Buffer;)V

    .line 1305
    iget-object v9, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    const/4 v12, 0x3

    invoke-interface {v0, v12, v11, v3, v9}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 1306
    iget v9, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mDropShadowCount:I

    const/4 v13, 0x5

    invoke-interface {v0, v13, v3, v9}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 1307
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V

    .line 1308
    invoke-interface {v0, v5}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    const v9, 0x8078

    .line 1311
    invoke-interface {v0, v9}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    .line 1312
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTexCoords:Ljava/nio/FloatBuffer;

    const/4 v15, 0x2

    invoke-interface {v0, v15, v11, v3, v14}, Ljavax/microedition/khronos/opengles/GL10;->glTexCoordPointer(IIILjava/nio/Buffer;)V

    .line 1314
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVertices:Ljava/nio/FloatBuffer;

    invoke-interface {v0, v12, v11, v3, v14}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 1315
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    .line 1316
    iget-object v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mColors:Ljava/nio/FloatBuffer;

    invoke-interface {v0, v10, v11, v3, v14}, Ljavax/microedition/khronos/opengles/GL10;->glColorPointer(IIILjava/nio/Buffer;)V

    .line 1318
    invoke-interface {v0, v4}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 1319
    iget v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountFront:I

    invoke-interface {v0, v13, v3, v14}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 1321
    invoke-interface {v0, v5}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 1322
    invoke-interface {v0, v4}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 1323
    invoke-interface {v0, v7, v6}, Ljavax/microedition/khronos/opengles/GL10;->glBlendFunc(II)V

    .line 1324
    iget v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountFront:I

    invoke-interface {v0, v13, v3, v14}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 1325
    invoke-interface {v0, v4}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 1326
    invoke-interface {v0, v5}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 1329
    iget v14, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountFront:I

    sub-int/2addr v14, v15

    invoke-static {v3, v14}, Ljava/lang/Math;->max(II)I

    move-result v14

    const/16 v16, 0x2

    .line 1330
    iget v15, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountFront:I

    iget v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountBack:I

    add-int/2addr v15, v2

    sub-int/2addr v15, v14

    if-eqz p2, :cond_2

    .line 1332
    iget-boolean v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->isLeftBackShow:Z

    const/16 v17, 0x0

    const/16 v18, 0x1

    if-eqz v2, :cond_0

    .line 1333
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object v2, v2, v16

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1334
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I

    aget v2, v2, v18

    invoke-interface {v0, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 1335
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object v2, v2, v16

    invoke-static {v4, v3, v2, v3}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 1337
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aput-object v17, v2, v16

    goto :goto_0

    .line 1340
    :cond_0
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object v2, v2, v18

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1341
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I

    aget v2, v2, v18

    invoke-interface {v0, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 1342
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object v2, v2, v18

    invoke-static {v4, v3, v2, v3}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 1344
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aput-object v17, v2, v18

    .line 1347
    :cond_1
    :goto_0
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I

    aget v2, v2, v18

    invoke-interface {v0, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 1350
    :cond_2
    invoke-interface {v0, v13, v14, v15}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    if-nez p2, :cond_7

    .line 1351
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v2, v2, Lcom/flyersoft/views/NewCurl3D;->aboutColor:I

    if-eqz v2, :cond_7

    .line 1352
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v2, v2, Lcom/flyersoft/views/NewCurl3D;->aboutColor:I

    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v2

    int-to-float v2, v2

    const/high16 v16, 0x437f0000    # 255.0f

    div-float v2, v2, v16

    .line 1353
    iget-object v12, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v12, v12, Lcom/flyersoft/views/NewCurl3D;->aboutColor:I

    invoke-static {v12}, Landroid/graphics/Color;->green(I)I

    move-result v12

    int-to-float v12, v12

    div-float v12, v12, v16

    .line 1354
    iget-object v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v3, v3, Lcom/flyersoft/views/NewCurl3D;->aboutColor:I

    invoke-static {v3}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    int-to-float v3, v3

    div-float v3, v3, v16

    .line 1355
    iget-object v10, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v10, v10, Lcom/flyersoft/views/NewCurl3D;->aboutColor:I

    invoke-static {v10}, Lcom/flyersoft/tools/T;->getColorValue(I)I

    move-result v10

    int-to-float v10, v10

    const/high16 v19, 0x43480000    # 200.0f

    cmpl-float v19, v10, v19

    if-lez v19, :cond_3

    const v19, 0x3ecccccd    # 0.4f

    goto :goto_1

    :cond_3
    const/high16 v19, 0x3f000000    # 0.5f

    :goto_1
    const v20, 0x3f666666    # 0.9f

    sub-float v20, v20, v19

    sub-float v10, v16, v10

    mul-float v20, v20, v10

    div-float v20, v20, v16

    add-float v10, v19, v20

    const v16, 0x3dcccccd    # 0.1f

    cmpg-float v19, v2, v16

    if-gez v19, :cond_4

    const v2, 0x3dcccccd    # 0.1f

    :cond_4
    cmpg-float v19, v12, v16

    if-gez v19, :cond_5

    const v12, 0x3dcccccd    # 0.1f

    :cond_5
    cmpg-float v19, v3, v16

    if-gez v19, :cond_6

    const v3, 0x3dcccccd    # 0.1f

    .line 1364
    :cond_6
    invoke-interface {v0, v5}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 1365
    invoke-interface {v0, v7, v6}, Ljavax/microedition/khronos/opengles/GL10;->glBlendFunc(II)V

    .line 1366
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    .line 1367
    invoke-interface {v0, v2, v12, v3, v10}, Ljavax/microedition/khronos/opengles/GL10;->glColor4f(FFFF)V

    .line 1368
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V

    .line 1369
    invoke-interface {v0, v5}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 1373
    :cond_7
    invoke-interface {v0, v5}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 1374
    invoke-interface {v0, v4}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 1375
    invoke-interface {v0, v7, v6}, Ljavax/microedition/khronos/opengles/GL10;->glBlendFunc(II)V

    .line 1376
    invoke-interface {v0, v13, v14, v15}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 1377
    invoke-interface {v0, v4}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 1378
    invoke-interface {v0, v5}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 1381
    invoke-interface {v0, v9}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V

    .line 1382
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V

    .line 1405
    invoke-interface {v0, v5}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 1406
    invoke-interface {v0, v7, v6}, Ljavax/microedition/khronos/opengles/GL10;->glBlendFunc(II)V

    .line 1407
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    .line 1408
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowColors:Ljava/nio/FloatBuffer;

    const/4 v3, 0x4

    const/4 v4, 0x0

    invoke-interface {v0, v3, v11, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glColorPointer(IIILjava/nio/Buffer;)V

    .line 1409
    iget-object v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mShadowVertices:Ljava/nio/FloatBuffer;

    const/4 v3, 0x3

    invoke-interface {v0, v3, v11, v4, v2}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 1410
    iget v2, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mDropShadowCount:I

    iget v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mSelfShadowCount:I

    invoke-interface {v0, v13, v2, v3}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 1411
    invoke-interface {v0, v8}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V

    .line 1412
    invoke-interface {v0, v5}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    const v2, 0x8074

    .line 1415
    invoke-interface {v0, v2}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1416
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public declared-synchronized gb(F)V
    .locals 2

    monitor-enter p0

    .line 1032
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-boolean v1, v1, Lcom/flyersoft/views/NewCurl3D;->dualPage:Z

    invoke-virtual {v0, p1, v1}, Lcom/flyersoft/views/GoogleBook3D;->updatePos(FZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1033
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

.method public generateTexture(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 10

    .line 1265
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I

    const/4 v1, 0x0

    const/16 v2, 0xde1

    if-nez v0, :cond_0

    const/4 v0, 0x2

    .line 1266
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I

    const/4 v3, 0x1

    .line 1267
    invoke-interface {p1, v3, v0, v1}, Ljavax/microedition/khronos/opengles/GL10;->glGenTextures(I[II)V

    .line 1268
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I

    aget v0, v0, v1

    invoke-interface {p1, v2, v0}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    const/16 v0, 0x2801

    const v4, 0x46180400    # 9729.0f

    .line 1269
    invoke-interface {p1, v2, v0, v4}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    const/16 v5, 0x2800

    .line 1270
    invoke-interface {p1, v2, v5, v4}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    const/16 v6, 0x2802

    const v7, 0x47012f00    # 33071.0f

    .line 1271
    invoke-interface {p1, v2, v6, v7}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    const/16 v8, 0x2803

    .line 1272
    invoke-interface {p1, v2, v8, v7}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    .line 1273
    iget-object v9, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I

    aget v3, v9, v3

    invoke-interface {p1, v2, v3}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 1274
    invoke-interface {p1, v2, v0, v4}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    .line 1275
    invoke-interface {p1, v2, v5, v4}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    .line 1276
    invoke-interface {p1, v2, v6, v7}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    .line 1277
    invoke-interface {p1, v2, v8, v7}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    .line 1280
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object v0, v0, v1

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1283
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I

    aget v0, v0, v1

    invoke-interface {p1, v2, v0}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 1284
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object p1, p1, v1

    invoke-static {v2, v1, p1, v1}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 1287
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1289
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    const/4 v0, 0x0

    aput-object v0, p1, v1

    :cond_1
    return-void
.end method

.method public declared-synchronized reset()V
    .locals 3

    monitor-enter p0

    .line 1630
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v0, v0, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 1631
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVertices:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1632
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mColors:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1634
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTexCoords:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v0, 0x0

    :goto_0
    const/4 v2, 0x4

    if-ge v0, v2, :cond_0

    .line 1637
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    aget-object v2, v2, v0

    invoke-direct {p0, v2}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->addVertex(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1639
    :cond_0
    iput v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountFront:I

    .line 1640
    iput v1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountBack:I

    .line 1641
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVertices:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1642
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mColors:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1644
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTexCoords:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_1

    .line 1646
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 1647
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/views/GoogleBook3D;->reset()V

    .line 1648
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetmGB(Lcom/flyersoft/views/NewCurl3D;)Lcom/flyersoft/views/GoogleBook3D;

    move-result-object v0

    iget-object v0, v0, Lcom/flyersoft/views/GoogleBook3D;->mPositions:[F

    array-length v0, v0

    div-int/lit8 v0, v0, 0x3

    iput v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mVerticesCountFront:I

    .line 1650
    :cond_2
    :goto_1
    iput v1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mSelfShadowCount:I

    iput v1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mDropShadowCount:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_3

    :catch_0
    move-exception v0

    .line 1652
    :try_start_1
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1654
    :goto_2
    monitor-exit p0

    return-void

    :goto_3
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method public declared-synchronized resetTexture()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    .line 1657
    :try_start_0
    iput-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureIds:[I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1658
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public declared-synchronized setBitmap(II)V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    .line 1661
    :try_start_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setBitmap(IILandroid/graphics/Bitmap;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1662
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

.method public declared-synchronized setBitmap(IILandroid/graphics/Bitmap;)V
    .locals 16

    move-object/from16 v1, p0

    move/from16 v0, p1

    move/from16 v2, p2

    monitor-enter p0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez p3, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    if-eqz p3, :cond_1

    move-object/from16 v6, p3

    goto :goto_1

    .line 1665
    :cond_1
    :try_start_0
    iget-object v6, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v6, v0}, Lcom/flyersoft/views/NewCurl3D;->getShotBitmap(I)Landroid/graphics/Bitmap;

    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    if-nez v6, :cond_2

    .line 1667
    monitor-exit p0

    return-void

    :cond_2
    const/4 v7, 0x2

    if-ne v2, v7, :cond_3

    const/4 v3, 0x1

    .line 1669
    :cond_3
    :try_start_1
    iput-boolean v3, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->isLeftBackShow:Z

    if-nez v2, :cond_4

    .line 1671
    iput v0, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->imageIndex:I

    goto :goto_2

    .line 1673
    :cond_4
    iput v0, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->texIndex:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1677
    :goto_2
    :try_start_2
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 1678
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    .line 1679
    invoke-direct {v1, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->getNextHighestPO2(I)I

    move-result v9

    .line 1680
    invoke-direct {v1, v8}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->getNextHighestPO2(I)I

    move-result v10

    .line 1681
    iget-object v11, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    int-to-float v3, v3

    int-to-float v12, v9

    div-float/2addr v3, v12

    invoke-static {v11, v3}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputmUScale(Lcom/flyersoft/views/NewCurl3D;F)V

    .line 1682
    iget-object v11, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    int-to-float v8, v8

    int-to-float v12, v10

    div-float/2addr v8, v12

    invoke-static {v11, v8}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fputmVScale(Lcom/flyersoft/views/NewCurl3D;F)V

    const/4 v11, 0x0

    if-eqz v5, :cond_5

    .line 1684
    iget-object v12, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-object v12, v12, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    aget-object v12, v12, v0

    iget-object v12, v12, Lcom/flyersoft/views/NewCurl3D$PageShot;->bm_texture:Landroid/graphics/Bitmap;

    invoke-static {v12}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v12

    if-eqz v12, :cond_8

    :cond_5
    if-eqz v5, :cond_6

    .line 1687
    iget-object v12, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-object v12, v12, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    aget-object v12, v12, v0

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v13

    invoke-static {v9, v10, v13}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v9

    iput-object v9, v12, Lcom/flyersoft/views/NewCurl3D$PageShot;->bm_texture:Landroid/graphics/Bitmap;

    .line 1688
    new-instance v9, Landroid/graphics/Canvas;

    iget-object v10, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-object v10, v10, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    aget-object v10, v10, v0

    iget-object v10, v10, Lcom/flyersoft/views/NewCurl3D$PageShot;->bm_texture:Landroid/graphics/Bitmap;

    invoke-direct {v9, v10}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    goto :goto_3

    .line 1690
    :cond_6
    iget-object v12, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v13

    invoke-static {v9, v10, v13}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v9

    aput-object v9, v12, v2

    .line 1691
    new-instance v9, Landroid/graphics/Canvas;

    iget-object v10, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    aget-object v10, v10, v2

    invoke-direct {v9, v10}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    :goto_3
    const/4 v10, 0x0

    if-nez v2, :cond_7

    .line 1694
    invoke-virtual {v9, v6, v11, v11, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_4

    .line 1696
    :cond_7
    new-instance v12, Landroid/graphics/Matrix;

    invoke-direct {v12}, Landroid/graphics/Matrix;-><init>()V

    .line 1697
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v13

    div-int/2addr v13, v7

    int-to-float v13, v13

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v14

    div-int/2addr v14, v7

    int-to-float v14, v14

    const/high16 v15, -0x40800000    # -1.0f

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-virtual {v12, v15, v7, v13, v14}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 1698
    invoke-virtual {v9, v6, v12, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    :cond_8
    :goto_4
    if-eqz v5, :cond_9

    .line 1702
    iget-object v5, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->bitmaps:[Landroid/graphics/Bitmap;

    iget-object v6, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget-object v6, v6, Lcom/flyersoft/views/NewCurl3D;->shots:[Lcom/flyersoft/views/NewCurl3D$PageShot;

    aget-object v0, v6, v0

    iget-object v0, v0, Lcom/flyersoft/views/NewCurl3D$PageShot;->bm_texture:Landroid/graphics/Bitmap;

    aput-object v0, v5, v2

    .line 1706
    :cond_9
    iget-object v0, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v11, v11, v3, v8}, Landroid/graphics/RectF;->set(FFFF)V

    if-eqz v2, :cond_c

    if-eq v2, v4, :cond_b

    const/4 v0, 0x2

    if-eq v2, v0, :cond_a

    goto :goto_5

    .line 1719
    :cond_a
    invoke-direct {v1, v11, v11, v3, v8}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setTexCoords(FFFF)V

    goto :goto_5

    .line 1716
    :cond_b
    invoke-direct {v1, v3, v8, v11, v11}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setTexCoords(FFFF)V

    goto :goto_5

    .line 1710
    :cond_c
    iget-boolean v0, v1, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mFlipTexture:Z

    if-eqz v0, :cond_d

    .line 1711
    invoke-direct {v1, v3, v11, v11, v8}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setTexCoords(FFFF)V

    goto :goto_5

    .line 1713
    :cond_d
    invoke-direct {v1, v11, v11, v3, v8}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setTexCoords(FFFF)V
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_5

    :catch_0
    move-exception v0

    .line 1723
    :try_start_3
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1725
    :goto_5
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0
.end method

.method public declared-synchronized setFlipTexture(ZZ)V
    .locals 4

    monitor-enter p0

    .line 1728
    :try_start_0
    iput-boolean p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mFlipTexture:Z

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    if-nez p2, :cond_0

    const-wide v2, 0x3fecccccc0000000L    # 0.8999999761581421

    goto :goto_0

    :cond_0
    move-wide v2, v0

    .line 1729
    :goto_0
    iput-wide v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->BACKFACE_ALPHA:D

    if-eqz p1, :cond_1

    .line 1731
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureRect:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->right:F

    iget-object p2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureRect:Landroid/graphics/RectF;

    iget p2, p2, Landroid/graphics/RectF;->top:F

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    invoke-direct {p0, p1, p2, v2, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setTexCoords(FFFF)V

    goto :goto_1

    .line 1734
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureRect:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->left:F

    iget-object p2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureRect:Landroid/graphics/RectF;

    iget p2, p2, Landroid/graphics/RectF;->top:F

    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mTextureRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    invoke-direct {p0, p1, p2, v2, v3}, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->setTexCoords(FFFF)V

    :goto_1
    const/4 p1, 0x0

    :goto_2
    const/4 p2, 0x4

    if-ge p1, p2, :cond_3

    .line 1738
    iget-object p2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    aget-object p2, p2, p1

    iget-boolean v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mFlipTexture:Z

    if-eqz v2, :cond_2

    iget-wide v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->BACKFACE_ALPHA:D

    goto :goto_3

    :cond_2
    move-wide v2, v0

    :goto_3
    iput-wide v2, p2, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mAlpha:D
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    .line 1740
    :cond_3
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

.method public setRect(Landroid/graphics/RectF;)V
    .locals 4

    .line 1743
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget v2, p1, Landroid/graphics/RectF;->left:F

    float-to-double v2, v2

    iput-wide v2, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    .line 1744
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    aget-object v0, v0, v1

    iget v1, p1, Landroid/graphics/RectF;->top:F

    float-to-double v1, v1

    iput-wide v1, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    .line 1745
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    iget v2, p1, Landroid/graphics/RectF;->left:F

    float-to-double v2, v2

    iput-wide v2, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    .line 1746
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    aget-object v0, v0, v1

    iget v1, p1, Landroid/graphics/RectF;->bottom:F

    float-to-double v1, v1

    iput-wide v1, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    .line 1747
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    iget v2, p1, Landroid/graphics/RectF;->right:F

    float-to-double v2, v2

    iput-wide v2, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    .line 1748
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    aget-object v0, v0, v1

    iget v1, p1, Landroid/graphics/RectF;->top:F

    float-to-double v1, v1

    iput-wide v1, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    .line 1749
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    const/4 v1, 0x3

    aget-object v0, v0, v1

    iget v2, p1, Landroid/graphics/RectF;->right:F

    float-to-double v2, v2

    iput-wide v2, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    .line 1750
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D;->mRectangle:[Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;

    aget-object v0, v0, v1

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    float-to-double v1, p1

    iput-wide v1, v0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    return-void
.end method
