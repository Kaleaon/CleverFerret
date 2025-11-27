.class Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "PrefGroupPick.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefGroupPick;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MergedAdapter"
.end annotation


# instance fields
.field bookCount:Ljava/lang/Integer;

.field itemCount:Ljava/lang/Integer;

.field measureNameLayHeight:Ljava/lang/Integer;

.field onBookClick:Landroid/view/View$OnClickListener;

.field onGroupRemove:Landroid/view/View$OnClickListener;

.field onLongClick:Landroid/view/View$OnLongClickListener;

.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 119
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    .line 217
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->onGroupRemove:Landroid/view/View$OnClickListener;

    .line 241
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$2;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$2;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->onLongClick:Landroid/view/View$OnLongClickListener;

    .line 253
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$3;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$3;-><init>(Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->onBookClick:Landroid/view/View$OnClickListener;

    return-void
.end method

.method private checkCoverHeightAndSetBackground(ILandroid/view/View;)V
    .locals 5

    .line 266
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 267
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->isCoverHeightError(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 268
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->coverWidth:I

    sget-boolean v1, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v1, :cond_0

    const/16 v1, 0x5e

    goto :goto_0

    :cond_0
    const/16 v1, 0x64

    :goto_0
    mul-int v0, v0, v1

    div-int/lit8 v0, v0, 0x46

    .line 269
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 270
    sget-boolean p1, Lcom/flyersoft/tools/A;->woody:Z

    if-nez p1, :cond_3

    .line 271
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->nameLay:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 272
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->measureNameLayHeight:Ljava/lang/Integer;

    if-nez v1, :cond_1

    .line 273
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->myBookName:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 274
    sget v3, Lcom/flyersoft/tools/A;->shelfFontSize:I

    add-int/lit8 v3, v3, -0x4

    int-to-float v3, v3

    const v4, 0x3dcccccd    # 0.1f

    add-float/2addr v3, v4

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v1, 0x0

    .line 275
    invoke-virtual {p1, v1, v1}, Landroid/view/View;->measure(II)V

    .line 276
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    const/4 v3, 0x0

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    add-int/2addr v1, v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->measureNameLayHeight:Ljava/lang/Integer;

    .line 278
    :cond_1
    sget v1, Lcom/flyersoft/tools/A;->shelfFontSize:I

    mul-int/lit8 v1, v1, 0x20

    mul-int v0, v0, v1

    div-int/lit16 v0, v0, 0x640

    .line 279
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->measureNameLayHeight:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 280
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->measureNameLayHeight:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 281
    :cond_2
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v2, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 284
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->getContext()Landroid/content/Context;

    move-result-object p1

    sget v0, Lcom/flyersoft/material/components/icons/R$drawable;->my_list_selector:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 285
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_4

    .line 286
    invoke-static {p2, p1}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 288
    :cond_4
    invoke-virtual {p2, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public fillItemData(ILandroid/view/View;)V
    .locals 10

    .line 170
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->groups:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x4

    if-lt p1, v0, :cond_0

    .line 171
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->checkCoverHeightAndSetBackground(ILandroid/view/View;)V

    .line 172
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 175
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 177
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->myBookImage:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/views/ShelfImageView;

    const/4 v3, 0x1

    .line 178
    iput-boolean v3, v2, Lcom/flyersoft/views/ShelfImageView;->isShelfCover:Z

    .line 179
    invoke-virtual {v2}, Lcom/flyersoft/views/ShelfImageView;->initPadding()V

    .line 181
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->myBookName:I

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 182
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->delete:I

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 183
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget-boolean v6, v6, Lcom/flyersoft/moonreaderp/PrefGroupPick;->mShowRemoveButton:Z

    const/16 v7, 0x8

    if-eqz v6, :cond_1

    const/4 v6, 0x0

    goto :goto_0

    :cond_1
    const/16 v6, 0x8

    :goto_0
    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 185
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefGroupPick;->groups:Ljava/util/ArrayList;

    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 186
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefGroupPick;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v9, 0x0

    invoke-virtual {v8, v6, v9}, Lcom/flyersoft/moonreaderp/ActivityMain;->getGroupCovers(Lcom/flyersoft/tools/BookDb$BookInfo;Landroid/view/View;)Ljava/util/ArrayList;

    move-result-object v8

    iput-object v8, v2, Lcom/flyersoft/views/ShelfImageView;->gridCovers:Ljava/util/ArrayList;

    .line 189
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->progressLay:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    .line 190
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->myAuthor:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    .line 191
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->gauge:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    .line 192
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->myBookName2:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    .line 193
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    .line 195
    sget-boolean v2, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v2, :cond_2

    sget-boolean v2, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v2, :cond_4

    :cond_2
    sget-boolean v2, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v2, :cond_4

    .line 196
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/cardview/widget/CardView;

    .line 197
    sget-boolean v7, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-nez v7, :cond_3

    invoke-static {}, Lcom/flyersoft/tools/C;->getOtherFrameColor()I

    move-result v7

    goto :goto_1

    :cond_3
    invoke-static {}, Lcom/flyersoft/tools/C;->getBookCardColor()I

    move-result v7

    .line 196
    :goto_1
    invoke-virtual {v2, v7}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    .line 198
    invoke-static {}, Lcom/flyersoft/tools/C;->getBookTitleColor()I

    move-result v2

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 201
    :cond_4
    sget-boolean v2, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz v2, :cond_5

    .line 202
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/cardview/widget/CardView;

    invoke-virtual {v1, v0}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    goto :goto_2

    .line 204
    :cond_5
    sget v0, Lcom/flyersoft/tools/A;->shelfFontSize:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 205
    invoke-virtual {v6, v3}, Lcom/flyersoft/tools/BookDb$BookInfo;->getGroupName(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 208
    :goto_2
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->checkCoverHeightAndSetBackground(ILandroid/view/View;)V

    .line 210
    invoke-virtual {v5, v6}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 211
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->onGroupRemove:Landroid/view/View$OnClickListener;

    invoke-virtual {v5, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 212
    invoke-virtual {p2, v6}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 213
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->onBookClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 214
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->onLongClick:Landroid/view/View$OnLongClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public getItemCount()I
    .locals 4

    .line 160
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->groups:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 161
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->itemCount:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->bookCount:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 162
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->itemCount:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    .line 163
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->bookCount:Ljava/lang/Integer;

    .line 164
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/PrefGroupPick;)I

    move-result v1

    div-int v1, v0, v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/PrefGroupPick;)I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/PrefGroupPick;)I

    move-result v2

    rem-int/2addr v0, v2

    if-lez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    add-int/2addr v1, v3

    .line 165
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->-$$Nest$fgetshelfColumn(Lcom/flyersoft/moonreaderp/PrefGroupPick;)I

    move-result v0

    mul-int v1, v1, v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->itemCount:Ljava/lang/Integer;

    .line 166
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 4

    .line 145
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 146
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->coverWidth:I

    if-nez v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->gridWidth:I

    iput v1, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick;->coverWidth:I

    .line 148
    sget-boolean v0, Lcom/flyersoft/tools/A;->woody:Z

    if-nez v0, :cond_0

    .line 149
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 150
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget v2, v1, Lcom/flyersoft/moonreaderp/PrefGroupPick;->gridWidth:I

    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr v2, v3

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr v2, v0

    const/high16 v0, 0x40800000    # 4.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    div-int/lit8 v0, v0, 0x3

    sub-int/2addr v2, v0

    iput v2, v1, Lcom/flyersoft/moonreaderp/PrefGroupPick;->coverWidth:I

    .line 153
    :cond_0
    invoke-virtual {p0, p2, p1}, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->fillItemData(ILandroid/view/View;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 7

    .line 122
    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->shelf_grid_item:I

    .line 123
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 124
    sget-boolean p2, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-nez p2, :cond_0

    sget-boolean p2, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz p2, :cond_2

    .line 125
    :cond_0
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/cardview/widget/CardView;

    .line 126
    invoke-virtual {p2}, Landroidx/cardview/widget/CardView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v2, 0x0

    .line 127
    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iput v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 128
    invoke-virtual {p2, v1, v1, v1, v1}, Landroidx/cardview/widget/CardView;->setPadding(IIII)V

    .line 129
    invoke-virtual {p2, v2}, Landroidx/cardview/widget/CardView;->setElevation(F)V

    .line 130
    invoke-virtual {p2, v2}, Landroidx/cardview/widget/CardView;->setCardElevation(F)V

    .line 131
    invoke-virtual {p2, v2}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    .line 133
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->nameLay:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const/high16 v0, 0x40800000    # 4.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-virtual {p2, v0, v1, v2, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 134
    sget-boolean p2, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz p2, :cond_2

    .line 135
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->nameLay:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 136
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->overflow1:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const/high16 v0, 0x41700000    # 15.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    const/high16 v3, 0x41a80000    # 21.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v4

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v5

    const/high16 v6, 0x40400000    # 3.0f

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    invoke-virtual {p2, v2, v4, v5, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 137
    sget-boolean p2, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz p2, :cond_1

    const/high16 v0, 0x41a80000    # 21.0f

    :cond_1
    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    const/high16 v0, 0x41400000    # 12.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    invoke-virtual {p1, v1, p2, v1, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 140
    :cond_2
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method
