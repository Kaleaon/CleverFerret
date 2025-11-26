.class public Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;
.super Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "OneBookAnnotsAdapter"
.end annotation


# instance fields
.field public checked:[Z

.field public filename:Ljava/lang/String;

.field onBookClick:Landroid/view/View$OnClickListener;

.field onBookLongClick:Landroid/view/View$OnLongClickListener;

.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field onOverflowClick:Landroid/view/View$OnClickListener;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method static bridge synthetic -$$Nest$mdeleteFinal(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->deleteFinal()V

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V
    .locals 1
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

    .line 12781
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 12711
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 12852
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->onBookLongClick:Landroid/view/View$OnLongClickListener;

    .line 12866
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->onBookClick:Landroid/view/View$OnClickListener;

    .line 12899
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    .line 12782
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->filename:Ljava/lang/String;

    .line 12783
    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->annotKey:Ljava/lang/String;

    invoke-static {p1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mcreateAnnotList(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p2

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    .line 12784
    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Z

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    return-void
.end method

.method private deleteFinal()V
    .locals 4

    .line 13019
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    array-length v0, v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_0
    if-ltz v0, :cond_2

    .line 13020
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    aget-boolean v2, v2, v0

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 13021
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    .line 13022
    iget-object v3, v2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    if-eqz v3, :cond_0

    .line 13023
    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    invoke-static {v2}, Lcom/flyersoft/tools/BookDb;->removeBookmark(Lcom/flyersoft/tools/A$Bookmark;)Z

    goto :goto_1

    .line 13025
    :cond_0
    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {v2}, Lcom/flyersoft/tools/BookDb;->removeNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    .line 13027
    :goto_1
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 13030
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    .line 13031
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->notifyDataSetChanged()V

    .line 13032
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 13033
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->filename:Ljava/lang/String;

    sget-object v2, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 13034
    sput-boolean v1, Lcom/flyersoft/tools/A;->hasNewNoteForUpload:Z

    .line 13035
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annotUpdated:Z

    return-void
.end method


# virtual methods
.method public clearChecked()V
    .locals 1

    .line 12741
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    .line 12742
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method deleteSelectedAnnots()V
    .locals 5

    .line 12998
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->getSelectedCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 12999
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v0, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->confirmation:I

    .line 13000
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$array;->one_file_bookmark:I

    .line 13001
    invoke-static {v3, v4, v1}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ("

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13002
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->getSelectedCount()I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ") ?"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 13001
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$5;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$5;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;)V

    const v2, 0x1040013

    .line 13003
    invoke-virtual {v0, v2, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    .line 13012
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 13013
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 13015
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->deleteFinal()V

    return-void
.end method

.method public doSelectChange(IIZ)V
    .locals 1

    if-ltz p1, :cond_2

    .line 12766
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    if-le p2, v0, :cond_0

    goto :goto_1

    :cond_0
    :goto_0
    if-gt p1, p2, :cond_1

    .line 12769
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    aput-boolean p3, v0, p1

    const/4 v0, 0x0

    .line 12770
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 12772
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionItemsVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 12773
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->getSelectedCount()I

    move-result p1

    .line 12774
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, ""

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    if-nez p1, :cond_2

    .line 12776
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceHideSelectState(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    :cond_2
    :goto_1
    return-void
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 12788
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getItemCount()I
    .locals 1

    .line 12720
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getSelectedCount()I
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 12727
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 12728
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
    .locals 9

    .line 12797
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->line:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    if-nez p1, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 12798
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->tv1:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/staticlayout/BookmarkItem;

    .line 12799
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->ImageView01:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 12800
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->noteTv:I

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 12801
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->timeTv:I

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 12803
    sget-boolean v5, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v5, :cond_1

    .line 12804
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/flyersoft/material/components/icons/R$color;->material_grey_200:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v0, v5}, Lcom/flyersoft/staticlayout/BookmarkItem;->setTextColor(I)V

    .line 12805
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/flyersoft/material/components/icons/R$color;->material_grey_300:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12806
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/flyersoft/material/components/icons/R$color;->material_grey_400:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12808
    :cond_1
    sget-boolean v5, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v5, :cond_2

    const/high16 v5, 0x41700000    # 15.0f

    .line 12809
    invoke-virtual {v0, v5}, Lcom/flyersoft/staticlayout/BookmarkItem;->setTextSize(F)V

    .line 12810
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 v5, 0x41500000    # 13.0f

    .line 12811
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 12814
    :cond_2
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    .line 12815
    iget-object v6, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v6, :cond_4

    iget-object v6, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v6, v6, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_4

    .line 12816
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 12817
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityMain;->annotKey:Ljava/lang/String;

    if-nez v6, :cond_3

    iget-object v6, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v6, v6, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    goto :goto_1

    :cond_3
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v7, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v7, v7, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/ActivityMain;->annotKey:Ljava/lang/String;

    invoke-static {v6, v7, v8}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mboldKey(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v6

    :goto_1
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    :cond_4
    const/16 v6, 0x8

    .line 12819
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 12821
    :goto_2
    iget v3, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    .line 12822
    sget v6, Lcom/flyersoft/moonreaderp/R$drawable;->bmtag:I

    if-ne v3, v6, :cond_6

    .line 12823
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v6, Lcom/flyersoft/moonreaderp/R$drawable;->bookmark_tag:I

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 12824
    iget-object v6, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    iget v6, v6, Lcom/flyersoft/tools/A$Bookmark;->color:I

    if-eqz v6, :cond_5

    .line 12825
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    new-instance v7, Landroid/graphics/LightingColorFilter;

    iget-object v8, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    iget v8, v8, Lcom/flyersoft/tools/A$Bookmark;->color:I

    invoke-direct {v7, v1, v8}, Landroid/graphics/LightingColorFilter;-><init>(II)V

    invoke-virtual {v6, v7}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_3

    .line 12827
    :cond_5
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 12828
    :goto_3
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_4

    .line 12830
    :cond_6
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 12832
    :goto_4
    iget-object v2, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    if-nez v2, :cond_7

    iget-object v2, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget v3, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->number:I

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityMain;->annotKey:Ljava/lang/String;

    invoke-static {v2, v3, v6}, Lcom/flyersoft/moonreaderp/PrefChapters;->createSp(Lcom/flyersoft/tools/BookDb$NoteInfo;ILjava/lang/String;)Landroid/text/Spannable;

    move-result-object v2

    goto :goto_5

    .line 12833
    :cond_7
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->annotKey:Ljava/lang/String;

    if-nez v2, :cond_8

    iget-object v2, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->name:Ljava/lang/String;

    goto :goto_5

    :cond_8
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->name:Ljava/lang/String;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/ActivityMain;->annotKey:Ljava/lang/String;

    invoke-static {v2, v3, v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mboldKey(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    .line 12834
    :goto_5
    invoke-virtual {v0, v2}, Lcom/flyersoft/staticlayout/BookmarkItem;->setText(Ljava/lang/CharSequence;)V

    .line 12835
    iget-object v3, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iput-object v3, v0, Lcom/flyersoft/staticlayout/BookmarkItem;->annot:Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 12836
    iget-object v3, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v3, :cond_a

    iget-object v3, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean v3, v3, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    if-nez v3, :cond_9

    iget-object v3, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean v3, v3, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    if-nez v3, :cond_9

    iget-object v3, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-boolean v3, v3, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z

    if-eqz v3, :cond_a

    :cond_9
    const/4 v3, 0x1

    goto :goto_6

    :cond_a
    const/4 v3, 0x0

    :goto_6
    if-nez v3, :cond_b

    const/4 v2, 0x0

    goto :goto_7

    .line 12837
    :cond_b
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v6, ". "

    invoke-virtual {v2, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x2

    :goto_7
    iput v2, v0, Lcom/flyersoft/staticlayout/BookmarkItem;->s_start:I

    if-nez v3, :cond_c

    goto :goto_8

    .line 12838
    :cond_c
    iget v1, v0, Lcom/flyersoft/staticlayout/BookmarkItem;->s_start:I

    iget-object v2, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    const-string v3, "\n"

    const-string v6, " "

    invoke-virtual {v2, v3, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    :goto_8
    iput v1, v0, Lcom/flyersoft/staticlayout/BookmarkItem;->s_end:I

    .line 12840
    iget-wide v0, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->time:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->dateTimeToStr2(Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12842
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    array-length v1, v0

    if-ge p1, v1, :cond_d

    aget-boolean v0, v0, p1

    if-eqz v0, :cond_d

    sget v0, Lcom/flyersoft/material/components/icons/R$drawable;->list_selector_background_transition_holo_dark:I

    goto :goto_9

    .line 12843
    :cond_d
    sget v0, Lcom/flyersoft/material/components/icons/R$drawable;->my_list_selector:I

    .line 12842
    :goto_9
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12844
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 12845
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->onBookClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 12846
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->onBookLongClick:Landroid/view/View$OnLongClickListener;

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 12847
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    .line 12848
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 12849
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public inverseChecked(I)V
    .locals 3

    .line 12746
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->validIndex(I[Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 12748
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    aget-boolean v1, v0, p1

    xor-int/lit8 v1, v1, 0x1

    aput-boolean v1, v0, p1

    .line 12749
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionItemsVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 12750
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->getSelectedCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 12751
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->getSelectedCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 12752
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceHideSelectState(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    :cond_1
    const/4 v0, 0x0

    .line 12753
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method

.method public myNotifyDataSetChanged()V
    .locals 3

    .line 12694
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->filename:Ljava/lang/String;

    iget-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annotKey:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mcreateAnnotList(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    .line 12697
    invoke-super {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 12708
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelectRvAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 1

    .line 12702
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->bookmarks_annot_item:I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    .line 12703
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method refreshList(I)V
    .locals 1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 12987
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 12988
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->notifyDataSetChanged()V

    .line 12989
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceHideSelectState(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    .line 12990
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->filename:Ljava/lang/String;

    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    .line 12991
    sput-boolean v0, Lcom/flyersoft/tools/A;->hasNewNoteForUpload:Z

    .line 12992
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->annotUpdated:Z

    .line 12993
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-nez p1, :cond_2

    .line 12994
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateBookmarkRvAdapter()V

    :cond_2
    return-void
.end method

.method public selectAll()V
    .locals 3

    const/4 v0, 0x0

    .line 12734
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    array-length v2, v1

    if-ge v0, v2, :cond_0

    const/4 v2, 0x1

    .line 12735
    aput-boolean v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 12736
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    array-length v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 12737
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setChecked(I)V
    .locals 3

    .line 12757
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->validIndex(I[Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 12759
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p1

    .line 12760
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetActionItemsVisible(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 12761
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->actionbar:Landroidx/appcompat/app/ActionBar;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->getSelectedCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    .line 12762
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method
