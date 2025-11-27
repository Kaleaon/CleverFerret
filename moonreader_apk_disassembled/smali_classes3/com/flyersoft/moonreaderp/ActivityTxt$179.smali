.class Lcom/flyersoft/moonreaderp/ActivityTxt$179;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->restoreAppendedBottomHandler(Z)V
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

    .line 17951
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$179;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 17954
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$179;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 17956
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$179;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->restoreH:I

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$179;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v1

    if-gt v0, v1, :cond_2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$179;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->restoreY:I

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$179;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-virtual {v1}, Lcom/flyersoft/views/ScrollView2;->getScrollY()I

    move-result v1

    if-eq v0, v1, :cond_1

    goto :goto_1

    :cond_1
    :goto_0
    return-void

    .line 17957
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$179;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$179;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->restoreH:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "height:"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object v0, v2, v3

    const-string v0, "should be:"

    const/4 v3, 0x2

    aput-object v0, v2, v3

    const/4 v0, 0x3

    aput-object v1, v2, v0

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 17958
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$179;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$179;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->restoreH:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->setForceHeight(I)V

    .line 17959
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$179;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$179;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->restoreH:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MRTextView;->setForceHeight(I)V

    .line 17960
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$179;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->restoreY:I

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollTo(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    return-void
.end method
