.class Lcom/flyersoft/moonreaderp/ActivityTxt$214;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfTextReflowSwitch(Z)V
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

    .line 19923
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$214;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 19925
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$214;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$214;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-wide v1, Lcom/flyersoft/tools/A;->lastPosition:J

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfCreateReflowTextBionic(J)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/staticlayout/MRTextView;->setText(Ljava/lang/CharSequence;)V

    .line 19926
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$214;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollByDelay(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    return-void
.end method
