.class Lcom/flyersoft/moonreaderp/ActivityTxt$52;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/tools/A$AfterFlipCurl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;
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

    .line 4735
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$52;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public Finished(Z)V
    .locals 8

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p1, :cond_2

    .line 4738
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$52;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-wide/16 v2, 0x0

    iput-wide v2, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->flippingAnimationTime:J

    .line 4739
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$52;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$52;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetcurrentPage(Lcom/flyersoft/moonreaderp/ActivityTxt;)J

    move-result-wide v4

    const-wide/16 v6, 0x1

    cmp-long p1, v4, v6

    if-lez p1, :cond_0

    .line 4740
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$52;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetcurrentPage(Lcom/flyersoft/moonreaderp/ActivityTxt;)J

    move-result-wide v4

    sub-long/2addr v4, v6

    invoke-static {p1, v4, v5}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputcurrentPage(Lcom/flyersoft/moonreaderp/ActivityTxt;J)V

    .line 4741
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$52;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pageDirection:I

    if-ne p1, v1, :cond_1

    .line 4742
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$52;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->flipView:Lcom/flyersoft/views/FlipImageView;

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/FlipImageView;->setTag(Ljava/lang/Object;)V

    .line 4743
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$52;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iput-wide v4, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->curlBackTime:J

    .line 4744
    sget p1, Lcom/flyersoft/tools/A;->lastChapter:I

    .line 4745
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$52;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v5, v4, Lcom/flyersoft/moonreaderp/ActivityTxt;->pageDirection:I

    neg-int v5, v5

    const/4 v6, 0x0

    invoke-static {v4, v5, v1, v6}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpageScroll(Lcom/flyersoft/moonreaderp/ActivityTxt;IZZ)V

    .line 4746
    sget v4, Lcom/flyersoft/tools/A;->lastChapter:I

    if-ne p1, v4, :cond_2

    .line 4747
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$52;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-wide v2, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->curlBackTime:J

    .line 4749
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$52;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcreateCurlMsg(Lcom/flyersoft/moonreaderp/ActivityTxt;ILandroid/view/MotionEvent;)Landroid/os/Message;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mhandleCurlMessage(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/os/Message;)V

    return-void
.end method
