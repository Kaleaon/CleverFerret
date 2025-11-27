.class Lcom/flyersoft/moonreaderp/ActivityTxt$59;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/tools/A$AfterFlipCurl;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showPageAnimation_step2(ZI)V
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

    .line 5731
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$59;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public Finished(Z)V
    .locals 3

    .line 5733
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$59;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setTiltPaused(Z)V

    .line 5734
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$59;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    iput v1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->forceTiltSpeed:F

    .line 5735
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$59;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-wide/16 v1, 0x0

    iput-wide v1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->flippingAnimationTime:J

    .line 5736
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$59;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mupdateForFitHardwareAccelerate(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 5737
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$59;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->contentLay:Lcom/flyersoft/views/ContentLay;

    invoke-virtual {p1}, Lcom/flyersoft/views/ContentLay;->postInvalidate()V

    .line 5738
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$59;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showReadProgress(I)V

    return-void
.end method
