.class Lcom/flyersoft/moonreaderp/ActivityTxt$116;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/tools/A$AfterFlipCurl;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->doFinish()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 12304
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$116;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public Finished(Z)V
    .locals 3

    .line 12307
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityTxt$116$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt$116$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$116;Landroid/os/Looper;)V

    const/4 v0, 0x0

    const-wide/16 v1, 0x3c

    .line 12312
    invoke-virtual {p1, v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt$116$1;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method
