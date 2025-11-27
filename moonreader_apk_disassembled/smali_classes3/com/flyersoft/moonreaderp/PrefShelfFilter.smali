.class public Lcom/flyersoft/moonreaderp/PrefShelfFilter;
.super Landroid/app/Dialog;
.source "PrefShelfFilter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static selfPref:Lcom/flyersoft/moonreaderp/PrefShelfFilter;


# instance fields
.field allType:Landroid/widget/CheckBox;

.field clearArbitraryTv:Landroid/widget/TextView;

.field closeIv:Landroid/widget/ImageView;

.field finishedCb:Landroid/widget/CheckBox;

.field moreLay:Landroid/view/View;

.field onFilterChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field optionIv:Landroid/widget/ImageView;

.field readingCb:Landroid/widget/CheckBox;

.field res:Landroid/content/Context;

.field public root:Landroid/view/View;

.field sortRG:Landroid/widget/RadioGroup;

.field styleGroup:Lcom/google/android/material/button/MaterialButtonToggleGroup;

.field unReadCb:Landroid/widget/CheckBox;


# direct methods
.method static bridge synthetic -$$Nest$mclearCurrentArbitrarySortRecords(Lcom/flyersoft/moonreaderp/PrefShelfFilter;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->clearCurrentArbitrarySortRecords()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetClearArbitrayTvVisible(Lcom/flyersoft/moonreaderp/PrefShelfFilter;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->setClearArbitrayTvVisible()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateBookType(Lcom/flyersoft/moonreaderp/PrefShelfFilter;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->updateBookType(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 36
    invoke-static {}, Lcom/flyersoft/tools/A;->getAlertDialogTheme()I

    move-result v0

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 209
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$5;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter$5;-><init>(Lcom/flyersoft/moonreaderp/PrefShelfFilter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->onFilterChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 37
    sput-object p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->selfPref:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    .line 38
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->res:Landroid/content/Context;

    .line 39
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->shelf_filter:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    .line 40
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method private clearCurrentArbitrarySortRecords()V
    .locals 5

    const/4 v0, 0x0

    .line 301
    new-array v1, v0, [I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getShelfSort([I)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 302
    new-array v1, v0, [I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->saveShelfSort([I)V

    .line 304
    sget v1, Lcom/flyersoft/tools/A;->shelf_sort_by:I

    if-nez v1, :cond_1

    .line 305
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 306
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    .line 307
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 308
    iget-object v3, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->book_arb:Ljava/lang/String;

    const-string v4, "#@#"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_0

    .line 309
    iget-object v3, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/BookDb;->removeSortTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->book_arb:Ljava/lang/String;

    iput-object v3, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    .line 310
    invoke-static {v2, v0}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    goto :goto_0

    .line 316
    :cond_1
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 317
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    .line 318
    :cond_2
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->setClearArbitrayTvVisible()V

    return-void
.end method

.method private getArbitrarySubTitle()Ljava/lang/String;
    .locals 6

    .line 280
    sget v0, Lcom/flyersoft/tools/A;->shelf_category:I

    const-string v1, "<b>"

    if-nez v0, :cond_0

    .line 281
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->shelf_all:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "</b>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 282
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->shelf_sub_collection:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 283
    sget-object v0, Lcom/flyersoft/tools/A;->shelf_sub_collection:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/BookDb;->decodeCollection(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookCollection;

    move-result-object v0

    .line 284
    sget v2, Lcom/flyersoft/tools/A;->shelf_category:I

    const/4 v3, 0x1

    const-string v4, "</b>: "

    if-ne v2, v3, :cond_1

    .line 285
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->shelf_favorites:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 286
    :cond_1
    sget v2, Lcom/flyersoft/tools/A;->shelf_category:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->isAllBooksForOneAuthor(Lcom/flyersoft/tools/BookDb$BookCollection;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 287
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/flyersoft/tools/A;->shelf_sub_author:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 288
    :cond_2
    sget v2, Lcom/flyersoft/tools/A;->shelf_category:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_3

    .line 289
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->shelf_authors:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 290
    :cond_3
    sget v2, Lcom/flyersoft/tools/A;->shelf_category:I

    const/4 v5, 0x4

    if-ne v2, v5, :cond_4

    .line 291
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->shelf_tags:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 292
    :cond_4
    sget v2, Lcom/flyersoft/tools/A;->shelf_category:I

    const/4 v5, 0x5

    if-ne v2, v5, :cond_5

    .line 293
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v5, Lcom/flyersoft/moonreaderp/R$array;->shelf_sort_by:I

    invoke-static {v1, v5, v3}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 294
    :cond_5
    sget v2, Lcom/flyersoft/tools/A;->shelf_category:I

    const/4 v3, 0x6

    if-ne v2, v3, :cond_6

    .line 295
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->my_ratings:I

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lcom/flyersoft/tools/BookDb;->getRatingText(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 297
    :cond_6
    const-string v0, ""

    return-object v0
.end method

.method private setClearArbitrayTvVisible()V
    .locals 5

    .line 181
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->clearArbitraryTv:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 182
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 183
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfAllowDrag()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollectionVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 187
    new-array v1, v0, [I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getShelfSort([I)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 188
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->clearArbitraryTv:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 201
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->clearArbitraryTv:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_2

    .line 202
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getArbitrarySubTitle()Ljava/lang/String;

    move-result-object v0

    .line 203
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 204
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->clearArbitraryTv:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->clear_arbitrary_sort:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private updateBookType(Z)V
    .locals 2

    .line 221
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->epub:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->filterEpub:Z

    .line 222
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pdf:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->filterPdf:Z

    .line 223
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->mobi:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->filterMobi:Z

    .line 224
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fb2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->filterFb2:Z

    .line 225
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->chm:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->filterChmUmd:Z

    .line 226
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->umd:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->filterDocRtf:Z

    .line 227
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->txt:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->filterTxt:Z

    .line 228
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->html:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->filterHtml:Z

    .line 229
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cbz:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    sput-boolean v0, Lcom/flyersoft/tools/A;->filterCbz:Z

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    .line 232
    sput-boolean v0, Lcom/flyersoft/tools/A;->filterAll:Z

    goto :goto_1

    .line 234
    :cond_0
    sget-boolean p1, Lcom/flyersoft/tools/A;->filterEpub:Z

    if-nez p1, :cond_1

    sget-boolean p1, Lcom/flyersoft/tools/A;->filterPdf:Z

    if-nez p1, :cond_1

    sget-boolean p1, Lcom/flyersoft/tools/A;->filterMobi:Z

    if-nez p1, :cond_1

    sget-boolean p1, Lcom/flyersoft/tools/A;->filterFb2:Z

    if-nez p1, :cond_1

    sget-boolean p1, Lcom/flyersoft/tools/A;->filterChmUmd:Z

    if-nez p1, :cond_1

    sget-boolean p1, Lcom/flyersoft/tools/A;->filterDocRtf:Z

    if-nez p1, :cond_1

    sget-boolean p1, Lcom/flyersoft/tools/A;->filterTxt:Z

    if-nez p1, :cond_1

    sget-boolean p1, Lcom/flyersoft/tools/A;->filterHtml:Z

    if-nez p1, :cond_1

    sget-boolean p1, Lcom/flyersoft/tools/A;->filterCbz:Z

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/flyersoft/tools/A;->filterAll:Z

    .line 236
    :goto_1
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 237
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    :cond_2
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .line 242
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    const/4 v0, 0x0

    .line 243
    sput-object v0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->selfPref:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    .line 244
    sget-boolean v0, Lcom/flyersoft/tools/A;->filterUnread:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/flyersoft/tools/A;->filterReading:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/flyersoft/tools/A;->filterFinished:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 245
    sput-boolean v0, Lcom/flyersoft/tools/A;->filterFinished:Z

    sput-boolean v0, Lcom/flyersoft/tools/A;->filterReading:Z

    sput-boolean v0, Lcom/flyersoft/tools/A;->filterUnread:Z

    .line 246
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 247
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    :cond_0
    return-void
.end method

.method public initView()V
    .locals 6

    .line 71
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->closeIv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->closeIv:Landroid/widget/ImageView;

    .line 72
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->optionIv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->optionIv:Landroid/widget/ImageView;

    .line 73
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radioGroup2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioGroup;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->sortRG:Landroid/widget/RadioGroup;

    .line 75
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->unread:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->unReadCb:Landroid/widget/CheckBox;

    .line 76
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->reading:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->readingCb:Landroid/widget/CheckBox;

    .line 77
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->finished:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->finishedCb:Landroid/widget/CheckBox;

    .line 78
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->unReadCb:Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->filterUnread:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 79
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->readingCb:Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->filterReading:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 80
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->finishedCb:Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->filterFinished:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 81
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->unReadCb:Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->onFilterChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 82
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->readingCb:Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->onFilterChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 83
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->finishedCb:Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->onFilterChanged:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 84
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->unReadCb:Landroid/widget/CheckBox;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->shelf_filter_options:I

    const/4 v3, 0x2

    invoke-static {v1, v2, v3}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 85
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->readingCb:Landroid/widget/CheckBox;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->shelf_filter_options:I

    const/4 v4, 0x3

    invoke-static {v1, v2, v4}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 86
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->finishedCb:Landroid/widget/CheckBox;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->shelf_filter_options:I

    const/4 v5, 0x4

    invoke-static {v1, v2, v5}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 88
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radio20:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->shelf_sort_by:I

    const/4 v5, 0x0

    invoke-static {v1, v2, v5}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 89
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radio21:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->shelf_sort_by:I

    const/4 v5, 0x1

    invoke-static {v1, v2, v5}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 90
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radio22:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->shelf_sort_by:I

    invoke-static {v1, v2, v3}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 91
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radio23:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->shelf_sort_by:I

    invoke-static {v1, v2, v4}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 92
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->radio24:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->res:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->recent_list:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 94
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->epub:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->filterEpub:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 95
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->pdf:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->filterPdf:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 96
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->mobi:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->filterMobi:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 97
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->fb2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->filterFb2:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 98
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->chm:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->filterChmUmd:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 99
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->umd:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->filterDocRtf:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 100
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->txt:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->filterTxt:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 101
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->html:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->filterHtml:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 102
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cbz:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->filterCbz:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 103
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter$1;-><init>(Lcom/flyersoft/moonreaderp/PrefShelfFilter;)V

    .line 108
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->epub:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 109
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->pdf:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 110
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->mobi:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 111
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->fb2:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 112
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->chm:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 113
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->umd:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 114
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->txt:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 115
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->html:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 116
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->cbz:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 118
    sget v0, Lcom/flyersoft/tools/A;->shelf_sort_by:I

    .line 119
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->sortRG:Landroid/widget/RadioGroup;

    if-nez v0, :cond_0

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->radio20:I

    goto :goto_0

    :cond_0
    if-ne v0, v5, :cond_1

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->radio21:I

    goto :goto_0

    :cond_1
    if-ne v0, v3, :cond_2

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->radio22:I

    goto :goto_0

    :cond_2
    if-ne v0, v4, :cond_3

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->radio23:I

    goto :goto_0

    :cond_3
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->radio24:I

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/RadioGroup;->check(I)V

    .line 121
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->sortRG:Landroid/widget/RadioGroup;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefShelfFilter$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter$2;-><init>(Lcom/flyersoft/moonreaderp/PrefShelfFilter;)V

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->setOnCheckedChangeListener(Landroid/widget/RadioGroup$OnCheckedChangeListener;)V

    .line 135
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->closeIv:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->optionIv:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->all:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->allType:Landroid/widget/CheckBox;

    .line 139
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->moreLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->moreLay:Landroid/view/View;

    .line 140
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->allType:Landroid/widget/CheckBox;

    sget-boolean v1, Lcom/flyersoft/tools/A;->filterAll:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 141
    sget-boolean v0, Lcom/flyersoft/tools/A;->filterAll:Z

    if-eqz v0, :cond_4

    .line 142
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->moreLay:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 143
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->allType:Landroid/widget/CheckBox;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefShelfFilter$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter$3;-><init>(Lcom/flyersoft/moonreaderp/PrefShelfFilter;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 157
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->shelfStyleGroup:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/button/MaterialButtonToggleGroup;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->styleGroup:Lcom/google/android/material/button/MaterialButtonToggleGroup;

    .line 158
    invoke-static {v0}, Lcom/flyersoft/tools/C;->setToggleButtonColorState(Landroid/view/View;)V

    .line 160
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->styleGroup:Lcom/google/android/material/button/MaterialButtonToggleGroup;

    sget v1, Lcom/flyersoft/tools/A;->shelfStyle:I

    if-nez v1, :cond_5

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->style0:I

    goto :goto_1

    :cond_5
    sget v1, Lcom/flyersoft/tools/A;->shelfStyle:I

    if-ne v1, v5, :cond_6

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->style1:I

    goto :goto_1

    :cond_6
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->style2:I

    :goto_1
    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->check(I)V

    .line 161
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->styleGroup:Lcom/google/android/material/button/MaterialButtonToggleGroup;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefShelfFilter$4;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter$4;-><init>(Lcom/flyersoft/moonreaderp/PrefShelfFilter;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButtonToggleGroup;->addOnButtonCheckedListener(Lcom/google/android/material/button/MaterialButtonToggleGroup$OnButtonCheckedListener;)V

    .line 175
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->clearArbitrary:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->clearArbitraryTv:Landroid/widget/TextView;

    .line 176
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 177
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->setClearArbitrayTvVisible()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 252
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->closeIv:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_0

    .line 253
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->cancel()V

    .line 256
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->optionIv:Landroid/widget/ImageView;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_1

    .line 257
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 258
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->showOptionsWindow(Ljava/lang/String;)V

    .line 261
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->clearArbitraryTv:Landroid/widget/TextView;

    if-ne p1, v0, :cond_3

    .line 262
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->clear_arbitrary_sort:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "?"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 263
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getArbitrarySubTitle()Ljava/lang/String;

    move-result-object v0

    .line 264
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 265
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "<br><br>"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v3, "("

    invoke-direct {p1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 267
    :cond_2
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->shelf_sort:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " > "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->sortRG:Landroid/widget/RadioGroup;

    .line 268
    invoke-virtual {v4}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 267
    invoke-virtual {v0, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 269
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$6;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter$6;-><init>(Lcom/flyersoft/moonreaderp/PrefShelfFilter;)V

    const v2, 0x104000a

    .line 270
    invoke-virtual {p1, v2, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    .line 275
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_3
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 45
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 46
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    .line 47
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenWidth()I

    move-result v0

    .line 48
    invoke-static {}, Lcom/flyersoft/tools/A;->getScreenHeight()I

    move-result v1

    if-le v0, v1, :cond_0

    move v0, v1

    .line 51
    :cond_0
    sget-boolean v1, Lcom/flyersoft/tools/A;->isLargeTablet:Z

    if-eqz v1, :cond_1

    const/16 v1, 0x3c

    goto :goto_0

    :cond_1
    const/16 v1, 0x50

    :goto_0
    mul-int v1, v1, v0

    div-int/lit8 v1, v1, 0x64

    .line 52
    sget-boolean v2, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v2, :cond_2

    move v0, v1

    :cond_2
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 53
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 55
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->initView()V

    .line 56
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 57
    sget-boolean p1, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz p1, :cond_3

    .line 58
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {}, Lcom/flyersoft/tools/C;->dialogColor()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_3
    return-void
.end method
