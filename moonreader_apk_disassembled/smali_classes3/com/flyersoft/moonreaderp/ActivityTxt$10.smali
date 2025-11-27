.class Lcom/flyersoft/moonreaderp/ActivityTxt$10;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showHintForCloudPositionSync()V
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

    .line 1567
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$10;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 1569
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$10;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputpreNextChapterText(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/CharSequence;)V

    .line 1570
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$10;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputoldPriorChapterText(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/CharSequence;)V

    .line 1571
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$10;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result p1

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    .line 1572
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$10;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-wide v0, Lcom/flyersoft/tools/A;->lastPosition:J

    long-to-int v1, v0

    sget v0, Lcom/radaee/pdf/Global;->def_view:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfGotoPage(IZ)V

    goto :goto_1

    .line 1574
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$10;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mreloadBook(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 1575
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$10;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result p1

    const/16 v0, 0x64

    if-eq p1, v0, :cond_2

    .line 1576
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$10;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->updateProgressStatus()V

    .line 1577
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$10;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p2, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->inCloudSyncing:Z

    return-void
.end method
