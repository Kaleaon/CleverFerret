.class Lcom/flyersoft/moonreaderp/ActivityMain$140;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->show_coverflow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 13313
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 13315
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->coverflow:Lcom/flyersoft/views/CoverFlow;

    invoke-virtual {p1}, Lcom/flyersoft/views/CoverFlow;->getSelectedItemPosition()I

    move-result p1

    if-ne p1, p3, :cond_4

    .line 13316
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge p3, p1, :cond_4

    .line 13317
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->isSelectedState:Z

    if-eqz p1, :cond_0

    .line 13318
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getShelfBooksAdapter()Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;

    move-result-object p1

    invoke-interface {p1, p3}, Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;->inverseChecked(I)V

    return-void

    .line 13320
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 13321
    invoke-virtual {p1}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result p4

    if-eqz p4, :cond_1

    .line 13322
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p4, 0x0

    invoke-static {p2, p3, p1, p4}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowGroupBooksDialog(Lcom/flyersoft/moonreaderp/ActivityMain;ILcom/flyersoft/tools/BookDb$BookInfo;Z)V

    return-void

    :cond_1
    const/16 p3, 0x64

    .line 13324
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p2, p4}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p4

    if-eqz p4, :cond_2

    .line 13325
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p2

    sput-object p2, Lcom/flyersoft/moonreaderp/ActivityMain;->openBookView:Landroid/view/View;

    .line 13326
    :cond_2
    iget-object p2, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {p2}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_3

    .line 13327
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->openShelfBookFromCloud(Lcom/flyersoft/tools/BookDb$BookInfo;)Z

    move-result p2

    if-eqz p2, :cond_3

    goto :goto_0

    .line 13329
    :cond_3
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$140;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {p2, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->openFile(Ljava/lang/String;)V

    :cond_4
    :goto_0
    return-void
.end method
