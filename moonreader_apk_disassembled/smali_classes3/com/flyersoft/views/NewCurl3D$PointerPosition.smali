.class Lcom/flyersoft/views/NewCurl3D$PointerPosition;
.super Ljava/lang/Object;
.source "NewCurl3D.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/NewCurl3D;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PointerPosition"
.end annotation


# instance fields
.field mPos:Landroid/graphics/PointF;

.field mPressure:F

.field final synthetic this$0:Lcom/flyersoft/views/NewCurl3D;


# direct methods
.method private constructor <init>(Lcom/flyersoft/views/NewCurl3D;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 673
    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 674
    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$PointerPosition;->mPos:Landroid/graphics/PointF;

    return-void
.end method

.method synthetic constructor <init>(Lcom/flyersoft/views/NewCurl3D;Lcom/flyersoft/views/NewCurl3D-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/views/NewCurl3D$PointerPosition;-><init>(Lcom/flyersoft/views/NewCurl3D;)V

    return-void
.end method
