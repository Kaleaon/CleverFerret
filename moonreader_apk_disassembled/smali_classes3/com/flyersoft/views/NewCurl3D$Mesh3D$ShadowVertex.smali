.class Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;
.super Ljava/lang/Object;
.source "NewCurl3D.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/NewCurl3D$Mesh3D;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ShadowVertex"
.end annotation


# instance fields
.field public mPenumbraColor:D

.field public mPenumbraX:D

.field public mPenumbraY:D

.field public mPosX:D

.field public mPosY:D

.field public mPosZ:D

.field final synthetic this$1:Lcom/flyersoft/views/NewCurl3D$Mesh3D;


# direct methods
.method private constructor <init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 1881
    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;->this$1:Lcom/flyersoft/views/NewCurl3D$Mesh3D;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;Lcom/flyersoft/views/NewCurl3D-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/views/NewCurl3D$Mesh3D$ShadowVertex;-><init>(Lcom/flyersoft/views/NewCurl3D$Mesh3D;)V

    return-void
.end method
