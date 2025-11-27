.class Lcom/flyersoft/views/NewCurl3D$PageShot;
.super Ljava/lang/Object;
.source "NewCurl3D.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/NewCurl3D;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PageShot"
.end annotation


# instance fields
.field bm:Landroid/graphics/Bitmap;

.field bm_texture:Landroid/graphics/Bitmap;

.field index:I

.field final synthetic this$0:Lcom/flyersoft/views/NewCurl3D;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/NewCurl3D;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 111
    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$PageShot;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
