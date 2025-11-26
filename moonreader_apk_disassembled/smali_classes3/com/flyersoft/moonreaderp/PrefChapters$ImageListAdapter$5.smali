.class Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2373
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 2376
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 2377
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfAnnotList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    .line 2378
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$array;->one_file_bookmark:I

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    .line 2383
    invoke-static {}, Lcom/flyersoft/tools/A;->isCutoutScreen()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2384
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v3

    if-eqz v3, :cond_0

    sget-boolean v3, Lcom/flyersoft/tools/A;->fullscreen:Z

    if-nez v3, :cond_1

    .line 2385
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getSysBarHeight()I

    move-result v3

    neg-int v3, v3

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 2386
    :goto_0
    new-instance v4, Lcom/flyersoft/components/MyMenu;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v4

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;

    invoke-direct {v5, p0, v1, v0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$2;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;Lcom/flyersoft/books/PDFReader$PdfAnnotItem;I)V

    invoke-virtual {v4, v2, v5}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->root:Landroid/view/View;

    .line 2402
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyMenu;->setBuilderAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5$1;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;)V

    .line 2403
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyMenu;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    const/4 v1, 0x0

    .line 2410
    invoke-static {v1}, Lcom/flyersoft/components/MyMenu;->getXoffInDialog(Landroid/view/View;)I

    move-result v1

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    sub-int/2addr v3, v2

    invoke-virtual {v0, p1, v1, v3}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;II)V

    return-void
.end method
