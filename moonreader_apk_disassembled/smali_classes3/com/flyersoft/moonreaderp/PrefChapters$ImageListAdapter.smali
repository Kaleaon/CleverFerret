.class public Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "PrefChapters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ImageListAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;
    }
.end annotation


# instance fields
.field handler:Landroid/os/Handler;

.field imagesLoading:[Z

.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field onItemClick:Landroid/view/View$OnClickListener;

.field onItemLongClick:Landroid/view/View$OnLongClickListener;

.field onOverflowClick:Landroid/view/View$OnClickListener;

.field pdfAnnotLoading:Z

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;


# direct methods
.method static bridge synthetic -$$Nest$minitList(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->initList()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mloadPdfAnnotShot(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;Landroid/widget/ImageView;II)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->loadPdfAnnotShot(Landroid/widget/ImageView;II)V

    return-void
.end method

.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2232
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    .line 2283
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 2342
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$3;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$3;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    .line 2355
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$4;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$4;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->onItemLongClick:Landroid/view/View$OnLongClickListener;

    .line 2373
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$5;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    .line 2418
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$6;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$6;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->handler:Landroid/os/Handler;

    .line 2233
    iget-boolean v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->isPdf:Z

    if-eqz v0, :cond_0

    .line 2235
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfAnnotList:Ljava/util/ArrayList;

    const/4 v0, 0x1

    .line 2236
    iput-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->pdfAnnotLoading:Z

    .line 2237
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;Lcom/flyersoft/moonreaderp/PrefChapters;)V

    .line 2259
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;->start()V

    .line 2261
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->initList()V

    return-void
.end method

.method private initList()V
    .locals 3

    .line 2266
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->getCount()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->imagesLoading:[Z

    .line 2267
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageList:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 2268
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 2269
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->imageList:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private loadPdfAnnotShot(Landroid/widget/ImageView;II)V
    .locals 2

    .line 2469
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->imagesLoading:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p2

    .line 2470
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;Landroid/widget/ImageView;II)V

    .line 2483
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->start()V

    return-void
.end method

.method private setDrawable(Landroid/widget/ImageView;I)V
    .locals 3

    .line 2451
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->imageList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/Reference;

    if-eqz v0, :cond_0

    .line 2453
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_2

    .line 2455
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->isPdf:Z

    if-eqz v1, :cond_1

    .line 2456
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->imagesLoading:[Z

    aget-boolean v1, v1, p2

    if-nez v1, :cond_2

    const/4 v1, 0x0

    .line 2457
    invoke-direct {p0, p1, p2, v1}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->loadPdfAnnotShot(Landroid/widget/ImageView;II)V

    goto :goto_1

    .line 2459
    :cond_1
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->getImageFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2460
    sget-object v1, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lcom/flyersoft/books/BaseEBook;->getDrawableFromSource(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 2461
    new-instance v1, Ljava/lang/ref/SoftReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    .line 2462
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters;->imageList:Ljava/util/ArrayList;

    invoke-virtual {v2, p2, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 2465
    :cond_2
    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 2297
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->isPdf:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->pdfAnnotLoading:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfAnnotList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0

    .line 2298
    :cond_1
    sget-object v0, Lcom/flyersoft/tools/A;->ebook:Lcom/flyersoft/books/BaseEBook;

    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->getImageFileList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemCount()I
    .locals 1

    .line 2293
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getView(ILandroid/view/View;)V
    .locals 5

    .line 2303
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->iv:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 2304
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->titleTv:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 2305
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 2307
    iget-boolean v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->pdfAnnotLoading:Z

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfAnnotList:Ljava/util/ArrayList;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2308
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->loading:I

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "..."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    if-nez p2, :cond_1

    .line 2312
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean v3, v3, Lcom/flyersoft/moonreaderp/PrefChapters;->isPdf:Z

    if-eqz v3, :cond_1

    .line 2313
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    const-string v4, "number.ttf"

    invoke-static {v3, v4}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 2315
    :cond_1
    sget-boolean v3, Lcom/flyersoft/tools/A;->chapterReversed:Z

    if-eqz v3, :cond_2

    .line 2316
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->getCount()I

    move-result v3

    sub-int/2addr v3, p1

    add-int/lit8 p1, v3, -0x1

    .line 2317
    :cond_2
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefChapters;->imageList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt p1, v3, :cond_3

    return-void

    .line 2320
    :cond_3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 2321
    invoke-direct {p0, v0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->setDrawable(Landroid/widget/ImageView;I)V

    .line 2323
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->isPdf:Z

    const/16 v3, 0x8

    if-eqz v0, :cond_5

    .line 2324
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfAnnotList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;

    .line 2325
    iget v4, v0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->annotIndexInPage:I

    if-nez v4, :cond_4

    .line 2326
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, ""

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, v0, Lcom/flyersoft/books/PDFReader$PdfAnnotItem;->pageno:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    .line 2327
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 2329
    :cond_4
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2330
    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 2331
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_1

    .line 2333
    :cond_5
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2334
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2337
    :goto_1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 2338
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2339
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->onItemLongClick:Landroid/view/View$OnLongClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 2280
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 2274
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->bookmarks_pdf_annot:I

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 2275
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method
