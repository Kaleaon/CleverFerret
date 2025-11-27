.class public Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "PrefChapters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AnnotsAdapter"
.end annotation


# instance fields
.field checked:[Z

.field onBookClick:Landroid/view/View$OnClickListener;

.field onBookLongClick:Landroid/view/View$OnLongClickListener;

.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field onOverflowClick:Landroid/view/View$OnClickListener;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;


# direct methods
.method static bridge synthetic -$$Nest$mdeleteFinal(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->deleteFinal()V

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1402
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    .line 1347
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 1473
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->onBookLongClick:Landroid/view/View$OnLongClickListener;

    .line 1488
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$3;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$3;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->onBookClick:Landroid/view/View$OnClickListener;

    .line 1503
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    .line 1403
    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Z

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    return-void
.end method

.method private deleteFinal()V
    .locals 7

    .line 1698
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    array-length v0, v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_0
    if-ltz v0, :cond_4

    .line 1699
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    aget-boolean v2, v2, v0

    if-eqz v2, :cond_3

    .line 1701
    sget-boolean v2, Lcom/flyersoft/tools/A;->chapterReversed:Z

    if-eqz v2, :cond_0

    .line 1702
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->getItemCount()I

    move-result v2

    sub-int/2addr v2, v0

    sub-int/2addr v2, v1

    goto :goto_1

    :cond_0
    move v2, v0

    .line 1703
    :goto_1
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    .line 1704
    iget-object v4, v3, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    if-eqz v4, :cond_1

    .line 1705
    iget-object v4, v3, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    invoke-static {v4}, Lcom/flyersoft/tools/A;->removeBookmark(Lcom/flyersoft/tools/A$Bookmark;)V

    goto :goto_2

    .line 1707
    :cond_1
    iget-object v4, v3, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {v4}, Lcom/flyersoft/tools/A;->removeNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    .line 1708
    iget-object v4, v3, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v4, v4, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/A;->getHighlightAllItem(Ljava/lang/String;)Lcom/flyersoft/tools/A$HighlightAll;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcom/flyersoft/tools/A;->deleteHighlightAllItem(Lcom/flyersoft/tools/A$HighlightAll;Z)V

    .line 1710
    :goto_2
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean v4, v4, Lcom/flyersoft/moonreaderp/PrefChapters;->isPdf:Z

    if-eqz v4, :cond_2

    iget-object v4, v3, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    if-nez v4, :cond_2

    iget v4, v3, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->splitIndex:I

    const/4 v5, -0x1

    if-eq v4, v5, :cond_2

    .line 1711
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v5, v3, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-virtual {v4, v5}, Lcom/flyersoft/books/PDFReader;->pdfRemoveAnnotFromNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1712
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfUpatedPages:Ljava/util/ArrayList;

    iget-wide v5, v3, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 1713
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfUpatedPages:Ljava/util/ArrayList;

    iget-wide v5, v3, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1714
    :cond_2
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_3
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1717
    :cond_4
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->clearChecked()V

    .line 1718
    sput-boolean v1, Lcom/flyersoft/tools/A;->hasNewNoteForUpload:Z

    .line 1719
    sput-boolean v1, Lcom/flyersoft/tools/A;->lastFileAnnotUpdated:Z

    .line 1720
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mbookmarkTipVisible(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    .line 1721
    sget-object v0, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 1722
    sget-object v0, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    return-void
.end method


# virtual methods
.method public clearChecked()V
    .locals 1

    .line 1370
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    .line 1371
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$msetNoteDeleteVisble(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    .line 1372
    invoke-super {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method deleteSelectedAnnots()V
    .locals 5

    .line 1664
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->getSelectedCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 1665
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->confirmation:I

    .line 1666
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    .line 1667
    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$array;->one_file_bookmark:I

    invoke-static {v3, v4, v1}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ("

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1668
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->getSelectedCount()I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ") ?"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1667
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$6;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$6;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;)V

    const v2, 0x1040013

    .line 1669
    invoke-virtual {v0, v2, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    .line 1683
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$5;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$5;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;)V

    .line 1684
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 1690
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 1692
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->deleteFinal()V

    .line 1693
    invoke-static {}, Lcom/flyersoft/tools/A;->loadHighlightAllItems()V

    return-void
.end method

.method public doSelectChange(IIZ)V
    .locals 1

    if-ltz p1, :cond_2

    .line 1393
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    if-le p2, v0, :cond_0

    goto :goto_1

    :cond_0
    :goto_0
    if-gt p1, p2, :cond_1

    .line 1396
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    aput-boolean p3, v0, p1

    const/4 v0, 0x0

    .line 1397
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 1399
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$msetNoteDeleteVisble(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public getItemCount()I
    .locals 1

    .line 1356
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getSelectedCount()I
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1363
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 1364
    aget-boolean v2, v2, v0

    if-eqz v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public getView(ILandroid/view/View;)V
    .locals 11

    .line 1408
    sget-boolean v0, Lcom/flyersoft/tools/A;->chapterReversed:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1409
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->getItemCount()I

    move-result v0

    sub-int/2addr v0, p1

    sub-int/2addr v0, v1

    goto :goto_0

    :cond_0
    move v0, p1

    .line 1411
    :goto_0
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->line:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget v3, v3, Lcom/flyersoft/moonreaderp/PrefChapters;->annotColumn:I

    const/4 v4, 0x0

    if-ge v0, v3, :cond_1

    const/4 v3, 0x4

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1412
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->tv1:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/BookmarkItem;

    .line 1413
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->ImageView01:I

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 1414
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->noteTv:I

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 1415
    sget v6, Lcom/flyersoft/moonreaderp/R$id;->timeTv:I

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 1417
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1419
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v7}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Lcom/flyersoft/material/components/icons/R$color;->material_grey_200:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    move-result v7

    invoke-virtual {v2, v7}, Lcom/flyersoft/staticlayout/BookmarkItem;->setTextColor(I)V

    .line 1420
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v7}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Lcom/flyersoft/material/components/icons/R$color;->material_grey_300:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    move-result v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1421
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v7}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Lcom/flyersoft/material/components/icons/R$color;->material_grey_400:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1423
    :cond_2
    sget-boolean v7, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v7, :cond_3

    const/high16 v7, 0x41700000    # 15.0f

    .line 1424
    invoke-virtual {v2, v7}, Lcom/flyersoft/staticlayout/BookmarkItem;->setTextSize(F)V

    .line 1425
    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 v7, 0x41500000    # 13.0f

    .line 1426
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1429
    :cond_3
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    .line 1430
    iget-object v8, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v8, :cond_5

    iget-object v8, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v8, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_5

    .line 1431
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1432
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefChapters;->annotKey:Ljava/lang/String;

    if-nez v8, :cond_4

    iget-object v8, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v8, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    goto :goto_2

    :cond_4
    iget-object v8, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v8, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    iget-object v9, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v9, v9, Lcom/flyersoft/moonreaderp/PrefChapters;->annotKey:Ljava/lang/String;

    invoke-static {v8, v9}, Lcom/flyersoft/moonreaderp/PrefChapters;->boldKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v8

    :goto_2
    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3

    :cond_5
    const/16 v8, 0x8

    .line 1434
    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1436
    :goto_3
    iget v5, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    .line 1437
    sget v8, Lcom/flyersoft/moonreaderp/R$drawable;->bmtag:I

    if-ne v5, v8, :cond_7

    .line 1438
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v8, Lcom/flyersoft/moonreaderp/R$drawable;->bookmark_tag:I

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 1439
    iget-object v8, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    iget v8, v8, Lcom/flyersoft/tools/A$Bookmark;->color:I

    if-eqz v8, :cond_6

    .line 1440
    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    new-instance v9, Landroid/graphics/LightingColorFilter;

    iget-object v10, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    iget v10, v10, Lcom/flyersoft/tools/A$Bookmark;->color:I

    invoke-direct {v9, v4, v10}, Landroid/graphics/LightingColorFilter;-><init>(II)V

    invoke-virtual {v8, v9}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_4

    .line 1442
    :cond_6
    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 1443
    :goto_4
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_5

    .line 1445
    :cond_7
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1447
    :goto_5
    iget-object v3, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    if-nez v3, :cond_8

    iget-object v3, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget v5, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->number:I

    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefChapters;->annotKey:Ljava/lang/String;

    invoke-static {v3, v5, v8}, Lcom/flyersoft/moonreaderp/PrefChapters;->createSp(Lcom/flyersoft/tools/BookDb$NoteInfo;ILjava/lang/String;)Landroid/text/Spannable;

    move-result-object v3

    goto :goto_6

    .line 1448
    :cond_8
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefChapters;->annotKey:Ljava/lang/String;

    if-nez v3, :cond_9

    iget-object v3, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->name:Ljava/lang/String;

    goto :goto_6

    :cond_9
    iget-object v3, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->name:Ljava/lang/String;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/PrefChapters;->annotKey:Ljava/lang/String;

    invoke-static {v3, v5}, Lcom/flyersoft/moonreaderp/PrefChapters;->boldKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    .line 1449
    :goto_6
    invoke-virtual {v2, v3}, Lcom/flyersoft/staticlayout/BookmarkItem;->setText(Ljava/lang/CharSequence;)V

    .line 1451
    iget-object v5, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iput-object v5, v2, Lcom/flyersoft/staticlayout/BookmarkItem;->annot:Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1452
    iget-object v5, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v5, :cond_a

    iget-object v5, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean v5, v5, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    if-nez v5, :cond_b

    iget-object v5, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean v5, v5, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    if-nez v5, :cond_b

    iget-object v5, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean v5, v5, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z

    if-eqz v5, :cond_a

    goto :goto_7

    :cond_a
    const/4 v1, 0x0

    :cond_b
    :goto_7
    if-nez v1, :cond_c

    const/4 v3, 0x0

    goto :goto_8

    .line 1453
    :cond_c
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v5, ". "

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    add-int/lit8 v3, v3, 0x2

    :goto_8
    iput v3, v2, Lcom/flyersoft/staticlayout/BookmarkItem;->s_start:I

    .line 1454
    const-string v3, " "

    if-nez v1, :cond_d

    goto :goto_9

    :cond_d
    iget v1, v2, Lcom/flyersoft/staticlayout/BookmarkItem;->s_start:I

    iget-object v4, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v4, v4, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    const-string v5, "\n"

    invoke-virtual {v4, v5, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v4, v1

    :goto_9
    iput v4, v2, Lcom/flyersoft/staticlayout/BookmarkItem;->s_end:I

    .line 1456
    iget-wide v1, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->time:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->dateTimeToStr2(Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v1

    .line 1457
    sget-boolean v2, Lcom/flyersoft/tools/A;->shareWithChapter:Z

    const-string v4, "   "

    if-eqz v2, :cond_e

    sget-object v2, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v2, :cond_e

    iget v2, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    sget-object v5, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v5}, Lcom/flyersoft/books/BaseEBook;->getChapters()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_e

    .line 1458
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    iget v3, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    invoke-virtual {v1, v3}, Lcom/flyersoft/books/BaseEBook;->get(I)Lcom/flyersoft/books/BaseEBook$Chapter;

    move-result-object v1

    iget-object v1, v1, Lcom/flyersoft/books/BaseEBook$Chapter;->name:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_a

    .line 1459
    :cond_e
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v2

    const/4 v5, 0x7

    if-ne v2, v5, :cond_f

    .line 1460
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->page:I

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v3, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    const-wide/16 v7, 0x1

    add-long/2addr v3, v7

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1461
    :cond_f
    :goto_a
    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1463
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    array-length v2, v1

    if-ge p1, v2, :cond_10

    aget-boolean p1, v1, p1

    if-eqz p1, :cond_10

    sget p1, Lcom/flyersoft/material/components/icons/R$drawable;->list_selector_background_transition_holo_dark:I

    goto :goto_b

    .line 1464
    :cond_10
    sget p1, Lcom/flyersoft/material/components/icons/R$drawable;->my_list_selector:I

    .line 1463
    :goto_b
    invoke-virtual {p2, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 1465
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1466
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->onBookClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1467
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->onBookLongClick:Landroid/view/View$OnLongClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1468
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 1469
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1470
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public inverseChecked(I)V
    .locals 2

    .line 1376
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->validIndex(I[Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 1378
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    aget-boolean v1, v0, p1

    xor-int/lit8 v1, v1, 0x1

    aput-boolean v1, v0, p1

    .line 1379
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->getSelectedCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 1380
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->clearChecked()V

    :cond_1
    const/4 v0, 0x0

    .line 1381
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 1344
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 1

    .line 1338
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->bookmarks_annot_item:I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 1339
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method refreshList(I)V
    .locals 3

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 1653
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    .line 1654
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->isPdf:Z

    if-eqz v1, :cond_0

    if-eqz p1, :cond_0

    iget-object v1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    if-nez v1, :cond_0

    iget v1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->splitIndex:I

    if-eq v1, v0, :cond_0

    .line 1655
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-virtual {v0, v1}, Lcom/flyersoft/books/PDFReader;->pdfRemoveAnnotFromNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1656
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfUpatedPages:Ljava/util/ArrayList;

    iget-wide v1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1657
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfUpatedPages:Ljava/util/ArrayList;

    iget-wide v1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1659
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->clearChecked()V

    .line 1660
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mbookmarkTipVisible(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    return-void
.end method

.method public setChecked(I)V
    .locals 2

    .line 1385
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->validIndex(I[Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 1387
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p1

    .line 1388
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$msetNoteDeleteVisble(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    const/4 v0, 0x0

    .line 1389
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method
