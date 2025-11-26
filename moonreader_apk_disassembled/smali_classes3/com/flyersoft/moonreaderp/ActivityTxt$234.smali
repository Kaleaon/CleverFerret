.class Lcom/flyersoft/moonreaderp/ActivityTxt$234;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->isWebImage(Ljava/lang/String;Ljava/lang/String;)Z
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

    .line 21304
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$234;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 21307
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$234;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_0

    .line 21309
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    if-nez v0, :cond_1

    .line 21310
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$234;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$234;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->download_url_image:I

    invoke-virtual {v2, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$234;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetimgDownload_start_size(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v2

    .line 21311
    invoke-static {}, Lcom/flyersoft/tools/A;->getUnloadedImages()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$234;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetimgDownload_start_size(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    .line 21310
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showImageDownloadDialog(Ljava/lang/String;Ljava/lang/String;)V

    .line 21315
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 21316
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$234;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetimgDownload_start_size(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v0

    invoke-static {}, Lcom/flyersoft/tools/A;->getUnloadedImages()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-eq v0, v2, :cond_2

    .line 21317
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$234;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const/16 v2, 0x3ce

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 21319
    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_4

    .line 21320
    invoke-static {}, Lcom/flyersoft/tools/A;->getUnloadedImages()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_3

    .line 21321
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$234;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hideProgressDlg()V

    .line 21322
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$234;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p1, v1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    :cond_4
    :goto_0
    return-void
.end method
