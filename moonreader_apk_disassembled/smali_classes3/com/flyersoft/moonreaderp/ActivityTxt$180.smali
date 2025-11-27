.class Lcom/flyersoft/moonreaderp/ActivityTxt$180;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->scrollBackToCurPage(I)V
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

    .line 17984
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$180;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 17986
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$180;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->scrollBackStart:Z

    .line 17987
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$180;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 17989
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$180;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollTo(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 17990
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$180;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$menableTxtViewDraw(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    return-void
.end method
