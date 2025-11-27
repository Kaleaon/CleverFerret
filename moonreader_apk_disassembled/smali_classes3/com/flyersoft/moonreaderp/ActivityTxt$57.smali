.class Lcom/flyersoft/moonreaderp/ActivityTxt$57;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->get_flip_handler()Landroid/os/Handler;
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

    .line 5632
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$57;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 5635
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$57;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v1, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showPageAnimation(Z)V

    .line 5636
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$57;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetforceDelayFlipAnimation(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/tools/A;->hori_fling_animation:I

    const/4 v1, 0x3

    if-ge v0, v1, :cond_2

    .line 5637
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$57;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputtmpHorizaontalScroll(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 5638
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$57;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshowSeekBarProgress(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 5639
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$57;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {}, Lcom/flyersoft/tools/A;->isFlipCurl()Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$57;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$misValueFlip(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_1

    :cond_3
    iget p1, p1, Landroid/os/Message;->what:I

    if-ne p1, v3, :cond_4

    const/4 v2, 0x1

    goto :goto_1

    :cond_4
    const/4 v2, -0x1

    :cond_5
    :goto_1
    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showReadProgress(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 5641
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method
