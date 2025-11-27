.class Lcom/flyersoft/moonreaderp/ActivityTxt$146;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->statusHandlerSendMessage(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/os/Looper;)V
    .locals 0
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

    .line 14887
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 14890
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 14893
    :cond_0
    :try_start_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 14894
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showReadProgress(I)V

    .line 14895
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetebook_inLoading(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPaused:Z

    if-nez v0, :cond_1

    iget v0, p1, Landroid/os/Message;->arg1:I

    if-lez v0, :cond_1

    .line 14896
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->saveLastPostion(ZZ)V

    .line 14898
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v3, 0x64

    if-ne v0, v3, :cond_3

    .line 14899
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getRealHeight()I

    move-result v0

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->baseFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v3

    mul-int/lit8 v3, v3, 0x3

    if-ge v0, v3, :cond_2

    .line 14900
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpreNextChapter(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 14901
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showReadProgress(I)V

    .line 14903
    :cond_3
    iget p1, p1, Landroid/os/Message;->what:I

    if-ne p1, v1, :cond_4

    .line 14904
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->setTxtScrollPadding(Landroid/widget/ScrollView;)V

    .line 14905
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$146;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcheckStatusBar(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 14908
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_4
    :goto_0
    return-void
.end method
