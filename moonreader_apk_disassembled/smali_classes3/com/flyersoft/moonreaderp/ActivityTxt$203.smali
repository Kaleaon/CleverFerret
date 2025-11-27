.class Lcom/flyersoft/moonreaderp/ActivityTxt$203;
.super Ljava/lang/Thread;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfOpen(Ljava/lang/String;)V
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

    .line 19235
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 19237
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v1, Lorg/djvu/DDocument;

    invoke-direct {v1}, Lorg/djvu/DDocument;-><init>()V

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->djvu_doc:Lorg/djvu/DDocument;

    .line 19238
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->djvu_doc:Lorg/djvu/DDocument;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf_filename:Ljava/lang/String;

    .line 19239
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetprogressDlg(Lcom/flyersoft/moonreaderp/ActivityTxt;)Landroid/app/Dialog;

    move-result-object v2

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    :goto_0
    const/16 v3, 0x3d8

    .line 19238
    invoke-virtual {v0, v1, v2, v3}, Lorg/djvu/DDocument;->Open(Ljava/lang/String;Landroid/os/Handler;I)Ljava/lang/String;

    move-result-object v0

    .line 19240
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    new-instance v2, Lcom/flyersoft/moonreaderp/ActivityTxt$203$1;

    invoke-direct {v2, p0, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt$203$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$203;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
