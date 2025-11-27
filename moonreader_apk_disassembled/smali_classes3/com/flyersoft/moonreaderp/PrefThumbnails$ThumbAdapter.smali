.class Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "PrefThumbnails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefThumbnails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ThumbAdapter"
.end annotation


# instance fields
.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field onItemClick:Landroid/view/View$OnClickListener;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefThumbnails;


# direct methods
.method private constructor <init>(Lcom/flyersoft/moonreaderp/PrefThumbnails;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 227
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefThumbnails;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    .line 240
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 278
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter$2;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    return-void
.end method

.method synthetic constructor <init>(Lcom/flyersoft/moonreaderp/PrefThumbnails;Lcom/flyersoft/moonreaderp/PrefThumbnails-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefThumbnails;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 253
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefThumbnails;

    iget v0, v0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->pageCount:I

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 256
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getItemCount()I
    .locals 1

    .line 249
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;)V
    .locals 5

    .line 263
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->iv:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 264
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 266
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 267
    sget-object v3, Lcom/flyersoft/tools/A;->baseFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v3

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefThumbnails;

    iget v4, v4, Lcom/flyersoft/moonreaderp/PrefThumbnails;->column:I

    div-int/2addr v3, v4

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageHeight()I

    move-result v4

    mul-int v3, v3, v4

    invoke-static {}, Lcom/flyersoft/tools/A;->getPageWidth()I

    move-result v4

    div-int/2addr v3, v4

    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 269
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 270
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefThumbnails;

    invoke-static {v2, v0, p1}, Lcom/flyersoft/moonreaderp/PrefThumbnails;->-$$Nest$mshowPageThumbnail(Lcom/flyersoft/moonreaderp/PrefThumbnails;Landroid/widget/ImageView;I)V

    .line 271
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefThumbnails;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 272
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 274
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 275
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 237
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 231
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefThumbnails;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefThumbnails;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->thumbnails_item:I

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 232
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method
