.class public Lcom/flyersoft/moonreaderp/PrefEditBook;
.super Lcom/flyersoft/moonreaderp/PrefOptions;
.source "PrefEditBook.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefEditBook$OnBookEdited;,
        Lcom/flyersoft/moonreaderp/PrefEditBook$OnTagsPick;
    }
.end annotation


# static fields
.field private static favSelectIndex:I = 0x0

.field private static series:Ljava/lang/String; = null

.field private static series_index:F = -1.0f


# instance fields
.field b1:Landroid/widget/Button;

.field b2:Landroid/widget/Button;

.field bi:Lcom/flyersoft/tools/BookDb$BookInfo;

.field bookAuthorEt:Landroid/widget/EditText;

.field bookInShelf:Z

.field bookTitleEt:Landroid/widget/EditText;

.field coverB:Landroid/widget/TextView;

.field coverChanged:Z

.field coverEt:Landroid/widget/EditText;

.field coverFl:Landroid/widget/FrameLayout;

.field coverImage:Landroid/widget/ImageView;

.field coverTv:Landroid/widget/TextView;

.field deleteCoverB:Landroid/widget/TextView;

.field descriptionEt:Landroid/widget/EditText;

.field downloadCoverB:Landroid/widget/TextView;

.field favCheck:Landroid/widget/CheckBox;

.field favEt:Landroid/widget/EditText;

.field favIb:Landroid/view/View;

.field fileTv:Landroid/widget/TextView;

.field filterPref:Landroid/content/SharedPreferences;

.field filterSp:Landroid/widget/Spinner;

.field filterState:I

.field filterTv:Landroid/widget/TextView;

.field isEdit:Z

.field onChangeChapter:Lcom/flyersoft/moonreaderp/PrefEditBook$OnBookEdited;

.field preRating:I

.field ratingBar:Landroid/widget/RatingBar;

.field sEt1:Landroid/widget/EditText;

.field sEt2:Landroid/widget/EditText;

.field searchAuthor:Landroid/widget/ImageView;

.field selectedInnerCover:Ljava/lang/String;

.field seriesTv:Landroid/widget/TextView;

.field sv:Landroid/widget/ScrollView;

.field tagsEt:Landroid/widget/EditText;

.field tagsIb:Landroid/view/View;


# direct methods
.method static bridge synthetic -$$Nest$mshowSetDefaultCoverTip(Lcom/flyersoft/moonreaderp/PrefEditBook;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->showSetDefaultCoverTip()V

    return-void
.end method

.method static bridge synthetic -$$Nest$sfgetfavSelectIndex()I
    .locals 1

    sget v0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favSelectIndex:I

    return v0
.end method

.method static bridge synthetic -$$Nest$sfputfavSelectIndex(I)V
    .locals 0

    sput p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favSelectIndex:I

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefEditBook$OnBookEdited;ZLcom/flyersoft/tools/BookDb$BookInfo;I)V
    .locals 1

    .line 65
    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->pref_edit_book:I

    invoke-direct {p0, p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;-><init>(Landroid/content/Context;I)V

    const/4 p1, 0x0

    .line 269
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterState:I

    .line 66
    iput-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverChanged:Z

    .line 67
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->onChangeChapter:Lcom/flyersoft/moonreaderp/PrefEditBook$OnBookEdited;

    .line 68
    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->isEdit:Z

    .line 69
    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 70
    iput p5, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->preRating:I

    return-void
.end method

.method private getEditCoverFilename()Ljava/lang/String;
    .locals 3

    .line 687
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->downloadUrl:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/components/cloud/Cloud;->getCloudType(Ljava/lang/String;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/flyersoft/components/cloud/Sync;->fixWebDavFilename(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 688
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "_3.png"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getEditorTags()Ljava/lang/String;
    .locals 5

    .line 597
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefEditBook;->series:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "\n"

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->sEt1:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 598
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->sEt1:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefEditBook;->series:Ljava/lang/String;

    .line 599
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->sEt2:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->string2Float(Ljava/lang/String;)F

    move-result v0

    sput v0, Lcom/flyersoft/moonreaderp/PrefEditBook;->series_index:F

    const/4 v2, 0x0

    cmpg-float v0, v0, v2

    if-gez v0, :cond_1

    .line 601
    sput v2, Lcom/flyersoft/moonreaderp/PrefEditBook;->series_index:F

    .line 604
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->tagsEt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 605
    const-string v2, "\n\n"

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 606
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_3

    .line 607
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 608
    :cond_3
    :goto_0
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefEditBook;->series:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    sget v3, Lcom/flyersoft/moonreaderp/PrefEditBook;->series_index:F

    const/high16 v4, -0x40800000    # -1.0f

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_4

    goto :goto_1

    :cond_4
    const/4 v2, 0x0

    :goto_1
    and-int/2addr v1, v2

    if-eqz v1, :cond_5

    .line 609
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "<"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/flyersoft/moonreaderp/PrefEditBook;->series:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ">\n#"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Lcom/flyersoft/moonreaderp/PrefEditBook;->series_index:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, "#\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_5
    return-object v0
.end method

.method public static getSeriesIndex(Ljava/lang/String;)F
    .locals 2

    .line 614
    const-string v0, "\n#.*?#\n"

    invoke-static {v0, p0}, Lcom/flyersoft/tools/T;->getMatcherText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 615
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 617
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    sub-int/2addr v0, v1

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    :cond_0
    const/high16 p0, -0x40800000    # -1.0f

    return p0
.end method

.method private initFilterOption()V
    .locals 7

    .line 273
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->auto:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 274
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$array;->shelf_filter_options:I

    const/4 v3, 0x2

    invoke-static {v1, v2, v3}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    .line 275
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$array;->shelf_filter_options:I

    const/4 v4, 0x3

    invoke-static {v2, v3, v4}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v2

    .line 276
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v5, Lcom/flyersoft/moonreaderp/R$array;->shelf_filter_options:I

    const/4 v6, 0x4

    invoke-static {v3, v5, v6}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    .line 278
    new-instance v1, Landroid/widget/ArrayAdapter;

    .line 279
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x1090008

    invoke-direct {v1, v2, v3, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const v0, 0x1090009

    .line 280
    invoke-virtual {v1, v0}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 281
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterSp:Landroid/widget/Spinner;

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 283
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "state_filter"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterPref:Landroid/content/SharedPreferences;

    .line 284
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 285
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterPref:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterState:I

    .line 286
    :cond_0
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterState:I

    if-le v0, v4, :cond_1

    .line 287
    iput v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterState:I

    .line 288
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterSp:Landroid/widget/Spinner;

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterState:I

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setSelection(I)V

    return-void
.end method

.method private initView()V
    .locals 12

    .line 110
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->okB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->b1:Landroid/widget/Button;

    .line 111
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cancelB:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->b2:Landroid/widget/Button;

    .line 112
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->b1:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->b2:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/BookDb;->getBook(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bookInShelf:Z

    .line 116
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->b1:Landroid/widget/Button;

    if-eqz v0, :cond_1

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->save_page:I

    goto :goto_1

    :cond_1
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->save_to_shelf:I

    :goto_1
    invoke-virtual {v3, v0}, Landroid/widget/Button;->setText(I)V

    .line 118
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->sv:Landroid/widget/ScrollView;

    .line 119
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->coverButton:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverB:Landroid/widget/TextView;

    .line 120
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->downloadcover:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->downloadCoverB:Landroid/widget/TextView;

    .line 121
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->deleteButton:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->deleteCoverB:Landroid/widget/TextView;

    .line 129
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->preRating:I

    if-lez v0, :cond_2

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {v0}, Lcom/flyersoft/tools/BookDb;->getRating(Lcom/flyersoft/tools/BookDb$BookInfo;)I

    move-result v0

    .line 130
    :goto_2
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v4, Lcom/flyersoft/moonreaderp/R$id;->ratingBar:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/RatingBar;

    iput-object v3, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->ratingBar:Landroid/widget/RatingBar;

    int-to-float v0, v0

    .line 131
    invoke-virtual {v3, v0}, Landroid/widget/RatingBar;->setRating(F)V

    .line 132
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->ratingBar:Landroid/widget/RatingBar;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/RatingBar;->setTag(Ljava/lang/Object;)V

    .line 133
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->ratingBar:Landroid/widget/RatingBar;

    new-instance v3, Lcom/flyersoft/moonreaderp/PrefEditBook$1;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/PrefEditBook$1;-><init>(Lcom/flyersoft/moonreaderp/PrefEditBook;)V

    invoke-virtual {v0, v3}, Landroid/widget/RatingBar;->setOnRatingBarChangeListener(Landroid/widget/RatingBar$OnRatingBarChangeListener;)V

    .line 149
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->coverTv:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverTv:Landroid/widget/TextView;

    .line 150
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->filterTv:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterTv:Landroid/widget/TextView;

    .line 151
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->coverLay:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverFl:Landroid/widget/FrameLayout;

    .line 152
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->coverImage:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverImage:Landroid/widget/ImageView;

    .line 153
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->searchAuthor:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->searchAuthor:Landroid/widget/ImageView;

    .line 154
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->favCb:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favCheck:Landroid/widget/CheckBox;

    .line 155
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->coverEt:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverEt:Landroid/widget/EditText;

    .line 156
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->titleEt:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bookTitleEt:Landroid/widget/EditText;

    .line 157
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->authorEt:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bookAuthorEt:Landroid/widget/EditText;

    .line 158
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->tagsEt:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->tagsEt:Landroid/widget/EditText;

    .line 159
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->series:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->seriesTv:Landroid/widget/TextView;

    .line 160
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->sEt1:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->sEt1:Landroid/widget/EditText;

    .line 161
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->sEt2:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->sEt2:Landroid/widget/EditText;

    .line 162
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->favEt:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favEt:Landroid/widget/EditText;

    .line 163
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->descriptionEt:I

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->descriptionEt:Landroid/widget/EditText;

    .line 164
    new-array v2, v2, [Landroid/text/InputFilter;

    new-instance v3, Landroid/text/InputFilter$LengthFilter;

    sget v4, Lcom/flyersoft/tools/BookDb;->MAX_DESCRIPTION_SIZE:I

    invoke-direct {v3, v4}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v3, v2, v1

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 165
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tagsIb:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->tagsIb:Landroid/view/View;

    .line 166
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->favIb:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favIb:Landroid/view/View;

    .line 167
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->filterSp:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterSp:Landroid/widget/Spinner;

    .line 168
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->filenameTv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->fileTv:Landroid/widget/TextView;

    .line 173
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->downloadCoverB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 175
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->deleteCoverB:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 176
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->tagsIb:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 177
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favIb:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 178
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->searchAuthor:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 180
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getEditCoverFilename()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 181
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->deleteCoverB:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 183
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    .line 184
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 185
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    const-string v3, ""

    if-eqz v2, :cond_8

    .line 186
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->dateTimeToStr2(Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "  "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-static {v2, v4, v5}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")<br>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 191
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/BookDb;->getSavedStatistics(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$ReadStatistics;

    move-result-object v1

    .line 192
    iget-wide v4, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTime:J

    const-string v2, ":</b> "

    const-wide/16 v6, 0x0

    const-string v8, "<br><b>"

    cmp-long v9, v4, v6

    if-lez v9, :cond_6

    iget-wide v4, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->readWords:J

    cmp-long v9, v4, v6

    if-lez v9, :cond_6

    .line 194
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/text/DecimalFormat;

    const-string v6, "0.00"

    invoke-direct {v5, v6}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iget-wide v6, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTime:J

    long-to-float v6, v6

    const/high16 v7, 0x42700000    # 60.0f

    div-float/2addr v6, v7

    div-float/2addr v6, v7

    const/high16 v9, 0x447a0000    # 1000.0f

    div-float/2addr v6, v9

    float-to-double v10, v6

    invoke-virtual {v5, v10, v11}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 195
    iget-wide v5, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTime:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    long-to-float v5, v5

    div-float/2addr v5, v7

    div-float/2addr v5, v9

    const/4 v6, 0x0

    .line 196
    const-string v7, "0"

    cmpl-float v6, v5, v6

    if-lez v6, :cond_4

    .line 197
    :try_start_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v9, Ljava/text/DecimalFormat;

    invoke-direct {v9, v7}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iget-wide v10, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->readWords:J

    long-to-float v1, v10

    div-float/2addr v1, v5

    float-to-double v10, v1

    invoke-virtual {v9, v10, v11}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 198
    :cond_4
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {v1, v5}, Lcom/flyersoft/tools/BookDb;->getReadDateDetail(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$ReadStatistics;)Ljava/lang/String;

    move-result-object v1

    .line 199
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->read_hour:I

    invoke-static {v6}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ": </b>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->read_speed:I

    invoke-static {v4}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v1, :cond_5

    .line 201
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->date_read_history:I

    invoke-static {v6}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "</b><br>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    :cond_5
    move-object v1, v3

    :goto_3
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4

    :catch_0
    move-exception v1

    .line 203
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 205
    :cond_6
    :goto_4
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->addTime:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 206
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v4, Lcom/flyersoft/moonreaderp/R$array;->shelf_sort_by:I

    const/4 v5, 0x2

    invoke-static {v0, v4, v5}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->addTime:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 208
    :cond_7
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->fileTv:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 209
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    goto :goto_5

    .line 210
    :cond_8
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->downloadUrl:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/components/cloud/Cloud;->getCloudType(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_9

    .line 211
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->downloadUrl:Ljava/lang/String;

    .line 212
    :cond_9
    :goto_5
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->fileTv:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 214
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->showThumbnail()V

    .line 215
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bookTitleEt:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 216
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bookAuthorEt:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 217
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->descriptionEt:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 218
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->setTagsEt()V

    .line 220
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v1, v0, 0x1

    .line 221
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favCheck:Landroid/widget/CheckBox;

    invoke-virtual {v2, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 222
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favEt:Landroid/widget/EditText;

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 223
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favEt:Landroid/widget/EditText;

    if-nez v0, :cond_b

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    const-string v2, "default_fav"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    goto :goto_6

    .line 224
    :cond_a
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v3, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    .line 223
    :cond_b
    :goto_6
    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 225
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favCheck:Landroid/widget/CheckBox;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefEditBook$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefEditBook$2;-><init>(Lcom/flyersoft/moonreaderp/PrefEditBook;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 232
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverEt:Landroid/widget/EditText;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefEditBook$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefEditBook$3;-><init>(Lcom/flyersoft/moonreaderp/PrefEditBook;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 244
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getBookCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 245
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverTv:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 247
    :cond_c
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->setSelectCoverVisible()V

    .line 248
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->initFilterOption()V

    .line 249
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->base:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    sget-boolean v1, Lcom/flyersoft/tools/A;->isLargeTablet:Z

    if-eqz v1, :cond_d

    const/high16 v1, 0x40400000    # 3.0f

    goto :goto_7

    :cond_d
    const/high16 v1, 0x40000000    # 2.0f

    :goto_7
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->enlargeTabletTextSize(Landroid/view/ViewGroup;I)V

    .line 251
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->isEdit:Z

    if-nez v0, :cond_e

    .line 252
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favCheck:Landroid/widget/CheckBox;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefEditBook$4;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefEditBook$4;-><init>(Lcom/flyersoft/moonreaderp/PrefEditBook;)V

    const-wide/16 v2, 0x32

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/CheckBox;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_e
    return-void
.end method

.method private saveThumbImage()V
    .locals 5

    const/4 v0, 0x0

    .line 659
    :try_start_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getEditCoverFilename()Ljava/lang/String;

    move-result-object v1

    .line 660
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverEt:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-gtz v2, :cond_1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverImage:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 669
    :cond_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverImage:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/flyersoft/tools/T;->drawableToFile(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)Z

    goto :goto_1

    .line 661
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverFl:Landroid/widget/FrameLayout;

    const/4 v3, 0x1

    .line 662
    invoke-virtual {v2, v3}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 663
    invoke-virtual {v2}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v3

    const/4 v4, 0x0

    .line 664
    invoke-virtual {v2, v4}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 665
    invoke-static {v1}, Lcom/flyersoft/tools/T;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v0

    .line 666
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-virtual {v3, v2, v4, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 667
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 670
    :goto_1
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iput-object v1, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->thumbFile:Ljava/lang/String;

    .line 671
    invoke-static {v1}, Lcom/flyersoft/tools/A;->deleteShelfImageCache(Ljava/lang/String;)V

    .line 672
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {v1}, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookCover(Lcom/flyersoft/tools/BookDb$BookInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_2

    .line 679
    :try_start_1
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-void

    :catchall_0
    move-exception v1

    goto :goto_3

    :catch_0
    move-exception v1

    .line 675
    :try_start_2
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v0, :cond_2

    .line 679
    :try_start_3
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    .line 681
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_2
    :goto_2
    return-void

    :goto_3
    if-eqz v0, :cond_3

    .line 679
    :try_start_4
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_4

    :catch_2
    move-exception v0

    .line 681
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 683
    :cond_3
    :goto_4
    throw v1
.end method

.method public static selectFavoriteName(Landroid/content/Context;Landroid/widget/EditText;Landroid/widget/CheckBox;)V
    .locals 7

    .line 543
    const-string v0, "favorite"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/flyersoft/tools/BookDb;->getDistinctValues(Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v2, 0x0

    .line 544
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 545
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->default_favorite_name:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 546
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 550
    :cond_1
    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_4

    .line 551
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 552
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, -0x1

    const/4 v5, -0x1

    .line 554
    :goto_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v1, v6, :cond_3

    .line 555
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v6, v6, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    .line 556
    aput-object v6, v3, v1

    .line 557
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    move v5, v1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 560
    :cond_3
    sput v4, Lcom/flyersoft/moonreaderp/PrefEditBook;->favSelectIndex:I

    .line 561
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v0, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->book_favorite:I

    .line 562
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefEditBook$14;

    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefEditBook$14;-><init>()V

    .line 563
    invoke-virtual {p0, v3, v5, v0}, Lcom/flyersoft/components/MyDialog;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefEditBook$13;

    invoke-direct {v0, p1, v3, p2}, Lcom/flyersoft/moonreaderp/PrefEditBook$13;-><init>(Landroid/widget/EditText;[Ljava/lang/String;Landroid/widget/CheckBox;)V

    const p1, 0x104000a

    .line 568
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 p2, 0x0

    .line 580
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    .line 581
    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 584
    :cond_4
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->no_favorite_type:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    const/4 p0, 0x1

    if-eqz p1, :cond_5

    .line 586
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setEnabled(Z)V

    :cond_5
    if-eqz p2, :cond_6

    .line 588
    invoke-virtual {p2, p0}, Landroid/widget/CheckBox;->setChecked(Z)V

    :cond_6
    return-void
.end method

.method public static selectTagName(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefEditBook$OnTagsPick;)V
    .locals 9

    .line 499
    const-string v0, "category"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flyersoft/tools/BookDb;->getDistinctValues(Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object v0

    .line 500
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefEditBook$10;

    invoke-direct {v2}, Lcom/flyersoft/moonreaderp/PrefEditBook$10;-><init>()V

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 506
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 507
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    .line 508
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Z

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 509
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_2

    .line 510
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v6, v6, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    .line 511
    aput-object v6, v2, v5

    .line 512
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_0

    goto :goto_1

    :cond_0
    const/4 v6, 0x0

    goto :goto_2

    :cond_1
    :goto_1
    const/4 v6, 0x1

    :goto_2
    aput-boolean v6, v3, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 515
    :cond_2
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    invoke-direct {p1, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->book_tags:I

    .line 516
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance p1, Lcom/flyersoft/moonreaderp/PrefEditBook$12;

    invoke-direct {p1, v3}, Lcom/flyersoft/moonreaderp/PrefEditBook$12;-><init>([Z)V

    .line 517
    invoke-virtual {p0, v2, v3, p1}, Lcom/flyersoft/components/MyDialog;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    new-instance p1, Lcom/flyersoft/moonreaderp/PrefEditBook$11;

    invoke-direct {p1, v3, v2, p2}, Lcom/flyersoft/moonreaderp/PrefEditBook$11;-><init>([Z[Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefEditBook$OnTagsPick;)V

    const p2, 0x104000a

    .line 523
    invoke-virtual {p0, p2, p1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/high16 p1, 0x1040000

    const/4 p2, 0x0

    .line 534
    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    .line 535
    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 537
    :cond_3
    sget p1, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$string;->no_tags_type:I

    .line 538
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    .line 537
    invoke-static {p0, p1, p2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void
.end method

.method private setSelectCoverVisible()V
    .locals 4

    .line 264
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverB:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->res:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->change_cover:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->deleteEndQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 265
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->downloadCoverB:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->res:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->download:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private setTagsEt()V
    .locals 6

    .line 623
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    .line 625
    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getSeriesIndex(Ljava/lang/String;)F

    move-result v1

    sput v1, Lcom/flyersoft/moonreaderp/PrefEditBook;->series_index:F

    const/high16 v2, -0x40800000    # -1.0f

    const/4 v3, 0x0

    const/4 v4, 0x1

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_0

    .line 627
    const-string v1, "\n#.*?#\n"

    invoke-static {v1, v0}, Lcom/flyersoft/tools/T;->getMatcherText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 628
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 629
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v2

    .line 630
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sub-int/2addr v1, v4

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_0
    const/4 v1, 0x0

    .line 633
    sput-object v1, Lcom/flyersoft/moonreaderp/PrefEditBook;->series:Ljava/lang/String;

    .line 634
    const-string v1, ">\n"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 636
    const-string v5, "<"

    invoke-virtual {v0, v5, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v5

    if-eq v5, v2, :cond_1

    sub-int v2, v1, v5

    if-le v2, v4, :cond_1

    add-int/lit8 v2, v5, 0x1

    .line 638
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/flyersoft/moonreaderp/PrefEditBook;->series:Ljava/lang/String;

    .line 639
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x2

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 643
    :cond_1
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefEditBook;->series:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 646
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->sEt1:Landroid/widget/EditText;

    sget-object v2, Lcom/flyersoft/moonreaderp/PrefEditBook;->series:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 647
    sget v1, Lcom/flyersoft/moonreaderp/PrefEditBook;->series_index:F

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gez v1, :cond_2

    .line 648
    sput v2, Lcom/flyersoft/moonreaderp/PrefEditBook;->series_index:F

    .line 649
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->sEt2:Landroid/widget/EditText;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v3, Lcom/flyersoft/moonreaderp/PrefEditBook;->series_index:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 652
    :cond_3
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->tagsEt:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private showSetDefaultCoverTip()V
    .locals 5

    .line 470
    sget v0, Lcom/flyersoft/tools/A;->defaultCoverTip:I

    const/4 v1, 0x5

    if-le v0, v1, :cond_0

    return-void

    .line 472
    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->defaultCoverTip:I

    if-nez v0, :cond_1

    .line 473
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->tip:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 474
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->change_default_cover_tip:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 473
    invoke-static {v0, v1, v2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 476
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->do_event_confirm:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    .line 477
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ofTextView:I

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 478
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->ofNeverAskAgain:I

    invoke-virtual {v0, v2}, Landroid/widget/ScrollView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    .line 479
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->change_default_cover_tip:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 480
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 481
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->tip:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    .line 482
    invoke-virtual {v1, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefEditBook$9;

    invoke-direct {v1, p0, v2}, Lcom/flyersoft/moonreaderp/PrefEditBook$9;-><init>(Lcom/flyersoft/moonreaderp/PrefEditBook;Landroid/widget/CheckBox;)V

    const v2, 0x104000a

    .line 483
    invoke-virtual {v0, v2, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 488
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 490
    :goto_0
    sget v0, Lcom/flyersoft/tools/A;->defaultCoverTip:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/flyersoft/tools/A;->defaultCoverTip:I

    return-void
.end method

.method private showThumbnail()V
    .locals 4

    .line 293
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getShelfCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 294
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/components/cloud/Sync;->fixWebDavThumbFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 297
    :try_start_0
    const-string v3, "/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 298
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v3, v1, v1}, Lcom/flyersoft/tools/A;->getFileDrawable(Ljava/io/File;II)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-nez v2, :cond_1

    .line 300
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->getBookCover(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    goto :goto_0

    .line 301
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1

    .line 302
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 304
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 307
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverTv:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    if-eqz v2, :cond_2

    .line 316
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 14

    .line 325
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->searchAuthor:Landroid/widget/ImageView;

    if-ne p1, v0, :cond_1

    .line 326
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bookAuthorEt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 327
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 328
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->dismissNull()V

    .line 329
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->showShelfForAuthor(Ljava/lang/String;)V

    .line 330
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 331
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->finish()V

    .line 332
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->cancel()V

    .line 335
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->b1:Landroid/widget/Button;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, ""

    if-ne p1, v0, :cond_a

    .line 336
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v4, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v4, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 337
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bookAuthorEt:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    .line 338
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->descriptionEt:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->description:Ljava/lang/String;

    .line 339
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getEditorTags()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    .line 340
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favEt:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 341
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favCheck:Landroid/widget/CheckBox;

    invoke-virtual {v6}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v6

    if-nez v6, :cond_2

    move-object v4, v3

    goto :goto_0

    :cond_2
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    const-string v4, "default_fav"

    :cond_3
    :goto_0
    iput-object v4, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    .line 343
    iget-boolean v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverChanged:Z

    if-nez v4, :cond_4

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverEt:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_5

    .line 344
    :cond_4
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->saveThumbImage()V

    .line 345
    :cond_5
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->selectedInnerCover:Ljava/lang/String;

    if-eqz v4, :cond_6

    .line 346
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v4, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->selectedInnerCover:Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/flyersoft/tools/BookDb;->setBookCover(Ljava/lang/String;Ljava/lang/String;)J

    .line 348
    :cond_6
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->ratingBar:Landroid/widget/RatingBar;

    invoke-virtual {v6}, Landroid/widget/RatingBar;->getRating()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->rate:Ljava/lang/String;

    .line 350
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v6, v6, Lcom/flyersoft/tools/BookDb$BookInfo;->book_arb:Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/BookDb;->getSortTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bookTitleEt:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    .line 351
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {v4, v2}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    .line 352
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bookTitleEt:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    .line 353
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->onChangeChapter:Lcom/flyersoft/moonreaderp/PrefEditBook$OnBookEdited;

    invoke-interface {v4}, Lcom/flyersoft/moonreaderp/PrefEditBook$OnBookEdited;->onSaveBookInfo()V

    .line 355
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterSp:Landroid/widget/Spinner;

    invoke-virtual {v4}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v4

    iput v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterState:I

    if-nez v4, :cond_7

    .line 357
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterPref:Landroid/content/SharedPreferences;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-interface {v4, v5}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 358
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterPref:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-interface {v4, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_1

    .line 360
    :cond_7
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterPref:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget v6, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->filterState:I

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 362
    :cond_8
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 363
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 364
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget-object v4, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget-object v5, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object v1, v5, Lcom/flyersoft/moonreaderp/ActivityMain;->tagsBC:Ljava/util/ArrayList;

    iput-object v1, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->seriesBC:Ljava/util/ArrayList;

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->authorsBC:Ljava/util/ArrayList;

    .line 365
    :cond_9
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/flyersoft/tools/A;->updateWidget(Landroid/content/Context;Z)V

    .line 367
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->cancel()V

    .line 370
    :cond_a
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->b2:Landroid/widget/Button;

    if-ne p1, v0, :cond_b

    .line 371
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->cancel()V

    .line 374
    :cond_b
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->deleteCoverB:Landroid/widget/TextView;

    if-ne p1, v0, :cond_d

    const/16 v4, 0x8

    .line 375
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 376
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getEditCoverFilename()Ljava/lang/String;

    move-result-object v0

    .line 377
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 378
    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 379
    :cond_c
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->showThumbnail()V

    .line 380
    iput-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverChanged:Z

    .line 381
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->setSelectCoverVisible()V

    .line 382
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookCover(Lcom/flyersoft/tools/BookDb$BookInfo;)V

    .line 385
    :cond_d
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->downloadCoverB:Landroid/widget/TextView;

    if-ne p1, v0, :cond_e

    .line 386
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x5f

    const/16 v4, 0x20

    .line 387
    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x2d

    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    const-string v2, "(TXT)"

    .line 388
    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "(HTM)"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "(HTML)"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "(PDF)"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 389
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefEditBook$5;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefEditBook$5;-><init>(Lcom/flyersoft/moonreaderp/PrefEditBook;)V

    .line 398
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getEditCoverFilename()Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-direct/range {v2 .. v8}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;Ljava/lang/String;Ljava/lang/String;IZ)V

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->show()V

    .line 401
    :cond_e
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverB:Landroid/widget/TextView;

    const/4 v2, 0x1

    if-ne p1, v0, :cond_f

    .line 402
    new-instance v3, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->res:Landroid/content/Context;

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefEditBook$6;

    invoke-direct {v5, p0}, Lcom/flyersoft/moonreaderp/PrefEditBook$6;-><init>(Lcom/flyersoft/moonreaderp/PrefEditBook;)V

    .line 418
    invoke-static {v2}, Lcom/flyersoft/tools/A;->getCoverImages(Z)Ljava/util/ArrayList;

    move-result-object v6

    sget-object v8, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    const/high16 v0, 0x428c0000    # 70.0f

    .line 419
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v10

    const/high16 v0, 0x42c80000    # 100.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v11

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->book_cover:I

    invoke-virtual {v0, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v3 .. v13}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;Ljava/util/ArrayList;ZLjava/lang/String;IIILjava/lang/String;Ljava/lang/String;)V

    .line 420
    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->show()V

    .line 423
    :cond_f
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->tagsIb:Landroid/view/View;

    if-ne p1, v0, :cond_10

    .line 424
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->res:Landroid/content/Context;

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getEditorTags()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefEditBook$7;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefEditBook$7;-><init>(Lcom/flyersoft/moonreaderp/PrefEditBook;)V

    invoke-static {v0, v3, v4}, Lcom/flyersoft/moonreaderp/PrefEditBook;->selectTagName(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefEditBook$OnTagsPick;)V

    .line 431
    :cond_10
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favIb:Landroid/view/View;

    if-ne p1, v0, :cond_11

    .line 432
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favEt:Landroid/widget/EditText;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->favCheck:Landroid/widget/CheckBox;

    invoke-static {v0, v3, v4}, Lcom/flyersoft/moonreaderp/PrefEditBook;->selectFavoriteName(Landroid/content/Context;Landroid/widget/EditText;Landroid/widget/CheckBox;)V

    .line 435
    :cond_11
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverTv:Landroid/widget/TextView;

    if-ne p1, v0, :cond_13

    .line 436
    new-instance v0, Landroid/content/Intent;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->res:Landroid/content/Context;

    const-class v4, Lcom/flyersoft/moonreaderp/PicGalleryShow;

    invoke-direct {v0, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 437
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/A;->getBookCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "imageFile"

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 438
    const-string v3, "singPicOnly"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 439
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz v2, :cond_12

    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    goto :goto_2

    :cond_12
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    :goto_2
    if-eqz v2, :cond_13

    .line 441
    invoke-virtual {v2, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 444
    :cond_13
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->fileTv:Landroid/widget/TextView;

    if-ne p1, v0, :cond_14

    .line 445
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 446
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->open_folder:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\"?"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefEditBook$8;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefEditBook$8;-><init>(Lcom/flyersoft/moonreaderp/PrefEditBook;)V

    const v2, 0x104000a

    .line 447
    invoke-virtual {p1, v2, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    .line 465
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_14
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 75
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onCreate(Landroid/os/Bundle;)V

    .line 76
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->initView()V

    .line 77
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->initParams()Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const v0, 0x3f4ccccd    # 0.8f

    .line 78
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDim(F)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v0, -0x1

    .line 79
    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefOptions;->setHeight(I)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    const/4 v1, 0x1

    .line 80
    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setFullscreen(Z)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 81
    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->isEdit:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->res:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->book_information:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 82
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->res:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->add_to_favorites:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 81
    :goto_0
    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/PrefOptions;->setDialogTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/moonreaderp/PrefOptions;

    move-result-object p1

    .line 83
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->done()V

    .line 85
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result p1

    if-nez p1, :cond_1

    sget-boolean p1, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-eqz p1, :cond_3

    .line 86
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->topLay:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 87
    invoke-static {}, Lcom/flyersoft/tools/C;->footerMainColor()I

    move-result v1

    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v2

    if-eqz v2, :cond_2

    const/16 v2, 0x14

    goto :goto_1

    :cond_2
    const/16 v2, -0x14

    :goto_1
    invoke-static {v1, v2}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v1

    .line 86
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 89
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverTv:Landroid/widget/TextView;

    const/high16 v1, -0x1000000

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 90
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->coverTv:Landroid/widget/TextView;

    const/high16 v1, 0x40a00000    # 5.0f

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, v2, v0}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 92
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 93
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefEditBook;->bookTitleEt:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->clearFocus()V

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 321
    invoke-super {p0, p1}, Lcom/flyersoft/moonreaderp/PrefOptions;->onWindowFocusChanged(Z)V

    return-void
.end method
