.class public Lcom/flyersoft/moonreaderp/PrefThumbnails;
.super Landroid/app/Dialog;
.source "PrefThumbnails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;
    }
.end annotation


# instance fields
.field act:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field column:I

.field con:Landroid/content/Context;

.field curPage:I

.field lay:Landroid/widget/FrameLayout;

.field layouts:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;",
            ">;"
        }
    .end annotation
.end field

.field mr:Lcom/flyersoft/staticlayout/MRTextView;

.field onResult:Lcom/flyersoft/tools/T$OnResult;

.field pageCount:I

.field rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

.field sv:Lcom/flyersoft/views/ScrollView2;

.field typeface:Landroid/graphics/Typeface;


# direct methods
.method static bridge synthetic -$$Nest$mshowPageThumbnail(Lcom/flyersoft/moonreaderp/PrefThumbnails;Landroid/widget/ImageView;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefThumbnails;->showPageThumbnail(Landroid/widget/ImageView;I)V

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/tools/T$OnResult;)V
    .locals 1

    .line 64
    sget-boolean v0, Lcom/flyersoft/tools/A;->eink:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen_ink:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen:I

    :goto_0
    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 133
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->layouts:Ljava/util/HashMap;

    .line 65
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->con:Landroid/content/Context;

    .line 66
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    .line 67
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->onResult:Lcom/flyersoft/tools/T$OnResult;

    .line 68
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->thumbnails:I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->lay:Landroid/widget/FrameLayout;

    .line 69
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefThumbnails;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method private getChapterSpanned(Lcom/flyersoft/tools/A$Position;)Ljava/lang/CharSequence;
    .locals 6

    .line 163
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    iget v1, p1, Lcom/flyersoft/tools/A$Position;->chapter:I

    iget v2, p1, Lcom/flyersoft/tools/A$Position;->splitIndex:I

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/books/BaseEBook;->getChapterMyHtmlCache(II)Ljava/lang/CharSequence;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_2

    .line 165
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    iget v3, p1, Lcom/flyersoft/tools/A$Position;->chapter:I

    invoke-virtual {v0, v3}, Lcom/flyersoft/books/BaseEBook;->getChapterText(I)Ljava/lang/String;

    move-result-object v0

    .line 166
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 167
    invoke-static {v0, v3}, Lcom/flyersoft/tools/A;->adjustChapterHtml(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    .line 168
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_1

    .line 169
    iget v0, p1, Lcom/flyersoft/tools/A$Position;->splitIndex:I

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v0, v4, :cond_0

    .line 170
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v1

    iput v0, p1, Lcom/flyersoft/tools/A$Position;->splitIndex:I

    .line 171
    :cond_0
    iget v0, p1, Lcom/flyersoft/tools/A$Position;->splitIndex:I

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    .line 173
    :cond_1
    iput v2, p1, Lcom/flyersoft/tools/A$Position;->splitIndex:I

    .line 174
    :goto_0
    invoke-static {v0}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 175
    sget-object v4, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    iget v5, p1, Lcom/flyersoft/tools/A$Position;->chapter:I

    iget p1, p1, Lcom/flyersoft/tools/A$Position;->splitIndex:I

    invoke-virtual {v4, v5, v0, p1, v3}, Lcom/flyersoft/books/BaseEBook;->getChapterMyHtmlAndCacheIt(ILjava/lang/String;ILjava/util/ArrayList;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 177
    :cond_2
    sget-object p1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {p1, v2}, Lcom/flyersoft/books/BaseEBook;->clearMyHtmlCacheIfLowMemory(Z)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 178
    new-array p1, v1, [Ljava/lang/Object;

    const-string v1, "clear MEM after getChapterSpanned"

    aput-object v1, p1, v2

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    :cond_3
    return-object v0
.end method

.method private initView()V
    .locals 7

    .line 87
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->lay:Landroid/widget/FrameLayout;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->rv:I

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    .line 88
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->lay:Landroid/widget/FrameLayout;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sv:I

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/ScrollView2;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->sv:Lcom/flyersoft/views/ScrollView2;

    .line 89
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->lay:Landroid/widget/FrameLayout;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->mr:I

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/staticlayout/MRTextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->mr:Lcom/flyersoft/staticlayout/MRTextView;

    .line 90
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->sv:Lcom/flyersoft/views/ScrollView2;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/ScrollView2;->setLeft(I)V

    .line 91
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->sv:Lcom/flyersoft/views/ScrollView2;

    sget-object v2, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/flyersoft/views/ScrollView2;->setRight(I)V

    .line 93
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->mr:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->setTextFont(Lcom/flyersoft/staticlayout/MRTextView;Z)V

    .line 94
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->mr:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->setTxtViewTypeface(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 95
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->mr:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->setLineSpace(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 96
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->mr:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {v0}, Lcom/flyersoft/tools/A;->setFontSpace(Lcom/flyersoft/staticlayout/MRTextView;)V

    .line 97
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->mr:Lcom/flyersoft/staticlayout/MRTextView;

    sget-object v2, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getTextSize()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/staticlayout/MRTextView;->setTextSize(IF)V

    .line 99
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->lay:Landroid/widget/FrameLayout;

    invoke-static {}, Lcom/flyersoft/tools/C;->mainBackColor()I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 100
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->lay:Landroid/widget/FrameLayout;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->closeIv:I

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefThumbnails$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/PrefThumbnails$1;-><init>(Lcom/flyersoft/moonreaderp/PrefThumbnails;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->getPageCount()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->pageCount:I

    .line 109
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfGetCurrPageNo()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->curPage:I

    goto :goto_0

    .line 110
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getBookType()I

    move-result v0

    const/16 v3, 0x64

    if-ne v0, v3, :cond_1

    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    if-eqz v0, :cond_1

    .line 111
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0, v2}, Lcom/flyersoft/books/BaseEBook;->getTotalPageCount(Lcom/flyersoft/books/BaseEBook$AfterGetUnReadWords;)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->pageCount:I

    .line 112
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->getCurPageInTotal()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->curPage:I

    .line 114
    :cond_1
    :goto_0
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->pageCount:I

    if-gtz v0, :cond_2

    return-void

    .line 117
    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v3, "number.ttf"

    invoke-static {v0, v3}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->typeface:Landroid/graphics/Typeface;

    .line 118
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefThumbnails;->getColumn()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->column:I

    .line 119
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v3, Lcom/flyersoft/views/recyclerview/MyGridLayoutManager;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->con:Landroid/content/Context;

    iget v5, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->column:I

    const/4 v6, 0x1

    invoke-direct {v3, v4, v5, v6, v1}, Lcom/flyersoft/views/recyclerview/MyGridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    invoke-virtual {v0, v3}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 120
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;

    invoke-direct {v1, p0, v2}, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefThumbnails;Lcom/flyersoft/moonreaderp/PrefThumbnails-IA;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    return-void
.end method

.method private showPageThumbnail(Landroid/widget/ImageView;I)V
    .locals 0

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 3

    const/4 v0, 0x1

    .line 290
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "dimiss thumbnails dlg"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 291
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->layouts:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 292
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method getChapterLayout(Lcom/flyersoft/tools/A$Position;)Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;
    .locals 12

    .line 136
    iget v0, p1, Lcom/flyersoft/tools/A$Position;->chapter:I

    .line 137
    iget v1, p1, Lcom/flyersoft/tools/A$Position;->splitIndex:I

    if-nez v1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    mul-int/lit16 v1, v0, 0x3e8

    iget v2, p1, Lcom/flyersoft/tools/A$Position;->splitIndex:I

    add-int/2addr v1, v2

    .line 139
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->layouts:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;

    if-nez v2, :cond_1

    .line 141
    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefThumbnails;->getChapterSpanned(Lcom/flyersoft/tools/A$Position;)Ljava/lang/CharSequence;

    move-result-object v5

    .line 142
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->mr:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-static {p1, v0}, Lcom/flyersoft/books/BaseEBook;->updateMRTextViewForPageCount(Lcom/flyersoft/staticlayout/MRTextView;I)V

    .line 143
    new-instance v3, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->mr:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v4}, Lcom/flyersoft/staticlayout/MRTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v6

    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    .line 144
    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getWidth()I

    move-result v7

    sget-object v8, Lcom/flyersoft/staticlayout/MyLayout$Alignment;->ALIGN_LEFT:Lcom/flyersoft/staticlayout/MyLayout$Alignment;

    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget v9, p1, Lcom/flyersoft/staticlayout/MRTextView;->mSpacingMult:F

    sget-object p1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget v10, p1, Lcom/flyersoft/staticlayout/MRTextView;->mSpacingAdd:F

    const/4 v11, 0x1

    invoke-direct/range {v3 .. v11}, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;-><init>(Lcom/flyersoft/staticlayout/MyTextView;Ljava/lang/CharSequence;Landroid/text/TextPaint;ILcom/flyersoft/staticlayout/MyLayout$Alignment;FFZ)V

    .line 145
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->layouts:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v2, v3

    :cond_1
    const/16 p1, 0x14

    .line 148
    invoke-static {p1}, Lcom/flyersoft/tools/A;->isLowMemory(I)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 149
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->layouts:Ljava/util/HashMap;

    add-int/lit8 v3, v0, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;

    .line 150
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->layouts:Ljava/util/HashMap;

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/staticlayout/SoftHyphenStaticLayout;

    .line 151
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->layouts:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->clear()V

    if-eqz p1, :cond_2

    .line 153
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->layouts:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v5, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    if-eqz v4, :cond_3

    .line 155
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->layouts:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->layouts:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    return-object v2
.end method

.method public getColumn()I
    .locals 3

    .line 124
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v0

    .line 125
    sget-boolean v1, Lcom/flyersoft/tools/A;->isLargeTablet:Z

    const/4 v2, 0x5

    if-eqz v1, :cond_1

    if-eqz v0, :cond_0

    const/4 v0, 0x7

    return v0

    :cond_0
    return v2

    .line 127
    :cond_1
    sget-boolean v1, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v1, :cond_3

    if-eqz v0, :cond_2

    const/4 v0, 0x6

    return v0

    :cond_2
    const/4 v0, 0x4

    return v0

    :cond_3
    if-eqz v0, :cond_4

    return v2

    :cond_4
    const/4 v0, 0x3

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 74
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 75
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefThumbnails;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    const/4 v0, -0x1

    .line 76
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 77
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefThumbnails;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 78
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefThumbnails;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 79
    invoke-static {p0}, Lcom/flyersoft/tools/A;->forceDialogImmersiveMode(Landroid/app/Dialog;)V

    .line 81
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefThumbnails;->initView()V

    return-void
.end method
