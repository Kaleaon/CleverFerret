.class Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;
.super Ljava/lang/Object;
.source "NewCurl3D.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/NewCurl3D$Mesh3D;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Vertex"
.end annotation


# instance fields
.field public mAlpha:D

.field public mColor:D

.field public mPenumbraX:D

.field public mPenumbraY:D

.field public mPosX:D

.field public mPosY:D

.field public mPosZ:D

.field public mTexX:D

.field public mTexY:D

.field final synthetic this$1:Lcom/flyersoft/views/NewCurl3D$Mesh3D;


# direct methods
.method public constructor <init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 1901
    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->this$1:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 1902
    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexY:D

    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexX:D

    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 1903
    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mAlpha:D

    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mColor:D

    return-void
.end method


# virtual methods
.method public rotateZ(D)V
    .locals 10

    .line 1907
    invoke-static {p1, p2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    .line 1908
    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    move-result-wide p1

    .line 1909
    iget-wide v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    mul-double v4, v2, v0

    iget-wide v6, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    mul-double v8, v6, p1

    add-double/2addr v4, v8

    neg-double v8, p1

    mul-double v2, v2, v8

    mul-double v6, v6, v0

    add-double/2addr v2, v6

    .line 1911
    iput-wide v4, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    .line 1912
    iput-wide v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    .line 1913
    iget-wide v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    mul-double v4, v2, v0

    iget-wide v6, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraY:D

    mul-double p1, p1, v6

    add-double/2addr v4, p1

    mul-double v2, v2, v8

    mul-double v6, v6, v0

    add-double/2addr v2, v6

    .line 1915
    iput-wide v4, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    .line 1916
    iput-wide v2, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraY:D

    return-void
.end method

.method public set(Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;)V
    .locals 2

    .line 1920
    iget-wide v0, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    .line 1921
    iget-wide v0, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    .line 1922
    iget-wide v0, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosZ:D

    .line 1923
    iget-wide v0, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexX:D

    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexX:D

    .line 1924
    iget-wide v0, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexY:D

    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mTexY:D

    .line 1925
    iget-wide v0, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraX:D

    .line 1926
    iget-wide v0, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraY:D

    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPenumbraY:D

    .line 1927
    iget-wide v0, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mColor:D

    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mColor:D

    .line 1928
    iget-wide v0, p1, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mAlpha:D

    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mAlpha:D

    return-void
.end method

.method public translate(DD)V
    .locals 2

    .line 1932
    iget-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    add-double/2addr v0, p1

    iput-wide v0, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosX:D

    .line 1933
    iget-wide p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    add-double/2addr p1, p3

    iput-wide p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$Vertex;->mPosY:D

    return-void
.end method
