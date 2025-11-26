.class public Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LibraryAdapter"
.end annotation


# instance fields
.field column:I

.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field onItemClick:Landroid/view/View$OnClickListener;

.field onOverflowClick:Landroid/view/View$OnClickListener;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 6145
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    .line 6146
    sget-boolean p1, Lcom/flyersoft/tools/A;->libraryUseGrid:Z

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x3

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    :goto_0
    iput p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->column:I

    .line 6170
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 6246
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$2;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    .line 6258
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$3;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    return-void
.end method

.method private fillItemData(ILandroid/view/View;)V
    .locals 9

    if-nez p2, :cond_0

    return-void

    .line 6206
    :cond_0
    invoke-static {}, Lcom/flyersoft/opds/N;->getLibraries()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, 0x4

    if-le p1, v0, :cond_1

    .line 6207
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_1
    const/4 v0, 0x0

    .line 6211
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6214
    :try_start_0
    invoke-static {}, Lcom/flyersoft/opds/N;->getLibraries()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/opds/OpdsSite;

    .line 6215
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->nameLay:I

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 6216
    sget v5, Lcom/flyersoft/tools/C;->amoledBlack2:I

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/C;->getBookCardColor()I

    move-result v5

    .line 6215
    :goto_0
    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundColor(I)V

    .line 6217
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->siteName:I

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 6218
    invoke-static {}, Lcom/flyersoft/tools/C;->getFileTitleColor()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 6219
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->siteSummary:I

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 6220
    sget v6, Lcom/flyersoft/moonreaderp/R$id;->sitebookImage:I

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    .line 6221
    invoke-virtual {v4}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v7

    sget-boolean v8, Lcom/flyersoft/tools/A;->shelfBoldFont:Z

    invoke-virtual {v7, v8}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 6222
    sget v7, Lcom/flyersoft/tools/A;->shelfFontSize:I

    add-int/2addr v7, v1

    int-to-float v7, v7

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 6223
    sget v7, Lcom/flyersoft/tools/A;->shelfFontSize:I

    const/16 v8, 0x10

    if-le v7, v8, :cond_3

    sget v7, Lcom/flyersoft/tools/A;->shelfFontSize:I

    sub-int/2addr v7, v2

    int-to-float v2, v7

    goto :goto_1

    :cond_3
    const/high16 v2, 0x41400000    # 12.0f

    :goto_1
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 6224
    iget-object v2, v3, Lcom/flyersoft/opds/OpdsSite;->title:Ljava/lang/String;

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6225
    iget-object v2, v3, Lcom/flyersoft/opds/OpdsSite;->summary:Ljava/lang/String;

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6226
    iget v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->column:I

    if-le v2, v1, :cond_4

    .line 6227
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->leftLine:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 6228
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->rightLine:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 6229
    invoke-virtual {v4}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/16 v1, 0x11

    .line 6230
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v1, 0x42300000    # 44.0f

    .line 6231
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-virtual {v4, v0, v0, v1, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    const/high16 v1, 0x41a00000    # 20.0f

    .line 6232
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-virtual {v5, v2, v0, v1, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 6234
    :cond_4
    iget-object v0, v3, Lcom/flyersoft/opds/OpdsSite;->image:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/opds/N;->getLibraryImage(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 6236
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 6237
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 6238
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 6240
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 6242
    :goto_2
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 6243
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 4

    .line 6184
    invoke-static {}, Lcom/flyersoft/opds/N;->getLibraries()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 6185
    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->column:I

    div-int v2, v0, v1

    const/4 v3, 0x1

    if-le v1, v3, :cond_0

    rem-int/2addr v0, v1

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    add-int/2addr v2, v3

    return v2
.end method

.method public getItemCount()I
    .locals 1

    .line 6179
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getView(ILandroid/view/View;)V
    .locals 5

    .line 6191
    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->column:I

    new-array v1, v0, [Landroid/view/View;

    .line 6192
    check-cast p2, Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v3, 0x1

    if-le v0, v3, :cond_1

    const/4 v3, 0x0

    .line 6194
    :goto_0
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    if-ge v3, v4, :cond_1

    if-ge v3, v0, :cond_0

    .line 6196
    invoke-virtual {p2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    aput-object v4, v1, v3

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-ge v2, v0, :cond_2

    .line 6199
    iget p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->column:I

    mul-int p2, p2, p1

    add-int/2addr p2, v2

    aget-object v3, v1, v2

    invoke-direct {p0, p2, v3}, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->fillItemData(ILandroid/view/View;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 6167
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 6

    .line 6151
    iget p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->column:I

    new-array v0, p2, [Landroid/view/View;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-le p2, v1, :cond_0

    .line 6153
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v3, Lcom/flyersoft/moonreaderp/R$layout;->linearlayout:I

    invoke-virtual {v1, v3, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    :goto_0
    if-ge v2, p2, :cond_1

    .line 6155
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v3, Lcom/flyersoft/moonreaderp/R$layout;->library_big_item:I

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    aput-object v1, v0, v2

    .line 6156
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/high16 v4, 0x40a00000    # 5.0f

    const/4 v5, -0x1

    invoke-direct {v1, v5, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 6157
    aget-object v3, v0, v2

    invoke-virtual {p1, v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 6160
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->library_big_item:I

    invoke-virtual {p2, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    aput-object p1, v0, v2

    .line 6162
    :cond_1
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method
