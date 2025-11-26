.class Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;
.super Ljava/lang/Object;
.source "DualFavLay.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;


# direct methods
.method static bridge synthetic -$$Nest$msupportSearch(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;)Z
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;->supportSearch()Z

    move-result p0

    return p0
.end method

.method constructor <init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 466
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private supportSearch()Z
    .locals 2

    .line 548
    sget v0, Lcom/flyersoft/tools/A;->dualFavType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    sget v0, Lcom/flyersoft/tools/A;->dualFavType:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    sget v0, Lcom/flyersoft/tools/A;->dualFavType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8

    .line 468
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookCollection;

    .line 469
    iget v1, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->topId:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ltz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 470
    :goto_0
    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v4

    if-eqz v1, :cond_1

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->remove_from_top:I

    goto :goto_1

    :cond_1
    sget v5, Lcom/flyersoft/moonreaderp/R$string;->put_on_top:I

    :goto_1
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 471
    new-array v5, v3, [Ljava/lang/String;

    aput-object v4, v5, v2

    .line 472
    sget v6, Lcom/flyersoft/tools/A;->dualFavType:I

    if-eq v6, v3, :cond_2

    sget v6, Lcom/flyersoft/tools/A;->dualFavType:I

    const/4 v7, 0x4

    if-ne v6, v7, :cond_3

    :cond_2
    const/4 v5, 0x3

    .line 473
    new-array v5, v5, [Ljava/lang/String;

    aput-object v4, v5, v2

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v4

    sget v6, Lcom/flyersoft/moonreaderp/R$array;->operations:I

    .line 474
    invoke-static {v4, v6, v2}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v5, v3

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v4

    sget v6, Lcom/flyersoft/moonreaderp/R$array;->operations:I

    .line 475
    invoke-static {v4, v6, v3}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x2

    aput-object v4, v5, v6

    .line 479
    :cond_3
    invoke-direct {p0}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;->supportSearch()Z

    move-result v4

    const/4 v6, 0x5

    if-nez v4, :cond_4

    sget v4, Lcom/flyersoft/tools/A;->dualFavType:I

    if-ne v4, v6, :cond_7

    .line 480
    :cond_4
    array-length v4, v5

    add-int/2addr v4, v3

    new-array v3, v4, [Ljava/lang/String;

    .line 481
    :goto_2
    array-length v4, v5

    if-ge v2, v4, :cond_5

    .line 482
    aget-object v4, v5, v2

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 483
    :cond_5
    array-length v2, v5

    sget v4, Lcom/flyersoft/tools/A;->dualFavType:I

    if-ne v4, v6, :cond_6

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->open_folder:I

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_3

    .line 484
    :cond_6
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "["

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->search:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_3
    aput-object v4, v3, v2

    move-object v5, v3

    .line 487
    :cond_7
    array-length v2, v5

    .line 489
    new-instance v3, Lcom/flyersoft/components/MyMenu;

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;

    invoke-direct {v4, p0, v1, v0, v2}, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7$1;-><init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$7;ZLcom/flyersoft/tools/BookDb$BookCollection;I)V

    invoke-virtual {v3, v5, v4}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    .line 544
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;)V

    return-void
.end method
