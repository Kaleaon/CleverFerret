.class Lcom/flyersoft/moonreaderp/ActivityTxt$233;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->refreshTxtRender()V
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

    .line 21274
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$233;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 21277
    :try_start_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$233;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->saveLastPostion(Z)V

    .line 21278
    invoke-static {}, Lcom/flyersoft/tools/A;->clearTxts()Z

    .line 21279
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$233;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mclearTxtView(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 21280
    invoke-static {}, Lcom/flyersoft/tools/A;->checkTextViewProperties()V

    .line 21281
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$233;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v0, Lcom/flyersoft/tools/A;->fontSize:F

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtViewSetTextSize(Lcom/flyersoft/moonreaderp/ActivityTxt;F)V

    .line 21282
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$233;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-string v0, ""

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->htmlText:Ljava/lang/String;

    .line 21283
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$233;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mreloadBook(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 21285
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method
