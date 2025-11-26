.class Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "DualFavLay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/DualFavLay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SubItemsAdapter"
.end annotation


# instance fields
.field items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookCollection;",
            ">;"
        }
    .end annotation
.end field

.field onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

.field onItemClick:Landroid/view/View$OnClickListener;

.field onItemLongClick:Landroid/view/View$OnLongClickListener;

.field onOverflowClick:Landroid/view/View$OnClickListener;

.field onTopClick:Landroid/view/View$OnClickListener;

.field shelf_category:I

.field subName:Ljava/lang/String;

.field final synthetic this$0:Lcom/flyersoft/components/DualFavLay;


# direct methods
.method public constructor <init>(Lcom/flyersoft/components/DualFavLay;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 295
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->this$0:Lcom/flyersoft/components/DualFavLay;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    .line 323
    new-instance p1, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$1;-><init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    .line 438
    new-instance p1, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$4;

    invoke-direct {p1, p0}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$4;-><init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->onItemLongClick:Landroid/view/View$OnLongClickListener;

    .line 446
    new-instance p1, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$5;

    invoke-direct {p1, p0}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$5;-><init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->onTopClick:Landroid/view/View$OnClickListener;

    .line 456
    new-instance p1, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$6;

    invoke-direct {p1, p0}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$6;-><init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    .line 466
    new-instance p1, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;

    invoke-direct {p1, p0}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;-><init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;)V

    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    .line 296
    sget p1, Lcom/flyersoft/tools/A;->dualFavType:I

    const/4 v0, 0x3

    const/4 v1, 0x2

    if-ne p1, v0, :cond_0

    sget p1, Lcom/flyersoft/tools/A;->shelf_category:I

    if-ne p1, v1, :cond_0

    sget-object p1, Lcom/flyersoft/tools/A;->shelf_sub_author:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 297
    sget-object p1, Lcom/flyersoft/tools/A;->shelf_sub_author:Ljava/lang/String;

    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->subName:Ljava/lang/String;

    .line 298
    sget p1, Lcom/flyersoft/tools/A;->dualFavType:I

    iput p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->shelf_category:I

    goto :goto_0

    .line 300
    :cond_0
    sget-object p1, Lcom/flyersoft/tools/A;->shelf_sub_collection:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->decodeCollection(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookCollection;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 302
    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->subName:Ljava/lang/String;

    .line 303
    sget p1, Lcom/flyersoft/tools/A;->shelf_category:I

    iput p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->shelf_category:I

    .line 304
    sget p1, Lcom/flyersoft/tools/A;->shelf_category:I

    if-ne p1, v1, :cond_1

    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->subName:Ljava/lang/String;

    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->subName:Ljava/lang/String;

    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 305
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->subName:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->subName:Ljava/lang/String;

    .line 308
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->sortItems()V

    return-void
.end method

.method private addBookCount(Landroid/widget/TextView;)V
    .locals 1

    .line 555
    new-instance v0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$8;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$8;-><init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;Landroid/widget/TextView;)V

    const/4 p1, 0x1

    .line 573
    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setPriority(I)V

    .line 574
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private getCount()I
    .locals 1

    .line 336
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->items:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 332
    invoke-direct {p0}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getView(ILandroid/view/View;)V
    .locals 9

    const/4 v0, 0x0

    .line 383
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 384
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 385
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->tv2:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 386
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->putontop:I

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 387
    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmTextColor()I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 388
    const-string v4, ""

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 390
    iget-object v4, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->items:Ljava/util/ArrayList;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v4

    const-string v5, ")"

    const/4 v6, 0x0

    const/16 v7, 0x8

    if-eqz v4, :cond_1

    .line 391
    invoke-virtual {v3, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 392
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-boolean p1, p1, Lcom/flyersoft/components/DualFavLay;->collectionThreadWorking:Z

    if-nez p1, :cond_0

    .line 393
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "("

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$array;->flip_animation_list:I

    invoke-static {p2, v0, v6}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 394
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget p2, Lcom/flyersoft/moonreaderp/R$string;->loading:I

    invoke-static {p2}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "..."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 392
    :goto_0
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 398
    :cond_1
    iget-object v4, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookCollection;

    .line 399
    iget-object v4, p1, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    .line 401
    iget v8, p1, Lcom/flyersoft/tools/BookDb$BookCollection;->topId:I

    if-ltz v8, :cond_2

    .line 402
    sget v7, Lcom/flyersoft/moonreaderp/R$drawable;->putontop:I

    invoke-virtual {v3, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 403
    iget-object v7, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->onTopClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v7}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 404
    invoke-virtual {v3, p1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 405
    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1

    .line 407
    :cond_2
    invoke-virtual {v3, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 409
    :goto_1
    sget v3, Lcom/flyersoft/tools/A;->dualFavType:I

    const/4 v6, 0x2

    if-ne v3, v6, :cond_4

    const-string v3, "<"

    invoke-virtual {v4, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    const-string v3, ">"

    invoke-virtual {v4, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_3

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    :cond_3
    const/4 v5, 0x1

    .line 410
    invoke-virtual {v4, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v4, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 412
    :cond_4
    sget v3, Lcom/flyersoft/tools/A;->dualFavType:I

    const/4 v5, 0x6

    if-ne v3, v5, :cond_5

    .line 413
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v6, "<big>"

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Lcom/flyersoft/tools/BookDb;->getRatingText(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "</big>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 414
    :cond_5
    sget v3, Lcom/flyersoft/tools/A;->dualFavType:I

    const/4 v6, 0x5

    const-string v7, "</b>"

    if-ne v3, v6, :cond_7

    .line 415
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 416
    iget-object v6, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->subName:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    const-string v8, "<small><font color=\"#888888\">"

    if-eqz v6, :cond_6

    .line 417
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "</font></small><br><b>"

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 419
    :cond_6
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "</font></small><br>"

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 421
    :cond_7
    iget v3, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->shelf_category:I

    sget v6, Lcom/flyersoft/tools/A;->dualFavType:I

    if-ne v3, v6, :cond_8

    iget-object v3, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->subName:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 422
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v6, "<b>"

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 424
    :cond_8
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 427
    :goto_2
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 428
    invoke-direct {p0, v2}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->addBookCount(Landroid/widget/TextView;)V

    .line 429
    invoke-virtual {p2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 430
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->onItemClick:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 431
    sget p1, Lcom/flyersoft/tools/A;->dualFavType:I

    if-eq p1, v5, :cond_9

    .line 432
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->onItemLongClick:Landroid/view/View$OnLongClickListener;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 433
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    .line 435
    :cond_9
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 320
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->onFillData:Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;

    invoke-super {p0, p2, p1, v0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;->fillData(ILandroid/view/View;Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 2

    .line 314
    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->dual_fav_item:I

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 315
    new-instance p2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {p2, p0, p1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public sortItems()V
    .locals 4

    .line 340
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay;->collections:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->items:Ljava/util/ArrayList;

    if-eqz v0, :cond_4

    .line 341
    sget v0, Lcom/flyersoft/tools/A;->dualFavType:I

    const/4 v1, 0x6

    if-eq v0, v1, :cond_4

    .line 343
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay;->key:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 344
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->items:Ljava/util/ArrayList;

    .line 345
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay;->key:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 346
    iget-object v1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v1, v1, Lcom/flyersoft/components/DualFavLay;->collections:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$BookCollection;

    .line 347
    iget-object v3, v2, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 348
    iget-object v3, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 351
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->items:Ljava/util/ArrayList;

    new-instance v1, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$2;-><init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 363
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$BookCollection;

    const/4 v2, -0x2

    .line 364
    iput v2, v1, Lcom/flyersoft/tools/BookDb$BookCollection;->topId:I

    goto :goto_1

    .line 365
    :cond_2
    sget v0, Lcom/flyersoft/tools/A;->dualFavType:I

    invoke-static {v0}, Lcom/flyersoft/components/DualFavLay;->getLastFavTop(I)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 366
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$BookCollection;

    .line 367
    sget v2, Lcom/flyersoft/tools/A;->dualFavType:I

    invoke-static {v2}, Lcom/flyersoft/components/DualFavLay;->getLastFavTop(I)Ljava/util/ArrayList;

    move-result-object v2

    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    iput v2, v1, Lcom/flyersoft/tools/BookDb$BookCollection;->topId:I

    goto :goto_2

    .line 368
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->items:Ljava/util/ArrayList;

    new-instance v1, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$3;-><init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 377
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_4
    return-void
.end method
