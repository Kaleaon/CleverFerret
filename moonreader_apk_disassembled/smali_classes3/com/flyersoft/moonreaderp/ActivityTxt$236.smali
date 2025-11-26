.class Lcom/flyersoft/moonreaderp/ActivityTxt$236;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showImageDownloadDialog(Ljava/lang/String;Ljava/lang/String;)V
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

    .line 21379
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$236;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 21381
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$236;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputimgDownload_stop(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 21382
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$236;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputimgDownloadDlg(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/app/ProgressDialog;)V

    .line 21383
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$236;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetimgDownload_start_size(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result p1

    invoke-static {}, Lcom/flyersoft/tools/A;->getUnloadedImages()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-eq p1, p2, :cond_0

    .line 21384
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$236;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->handler:Landroid/os/Handler;

    const/16 p2, 0x3ce

    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_0
    return-void
.end method
