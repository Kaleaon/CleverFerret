.class Lcom/flyersoft/moonreaderp/ActivityTxt$111;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->resetPositionFrom2PageModeBeforeAutoScroll()Z
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

    .line 11873
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$111;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 11875
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$111;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->assumeLayout()V

    .line 11876
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$111;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollNoDelay(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 11877
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$111;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mstartAutoScrollEvent(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void
.end method
