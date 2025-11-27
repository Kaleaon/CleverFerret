.class Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 7828
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8

    .line 7830
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookCollection;

    .line 7831
    iget v1, v0, Lcom/flyersoft/tools/BookDb$BookCollection;->topId:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ltz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 7832
    :goto_0
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    if-eqz v1, :cond_1

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->remove_from_top:I

    goto :goto_1

    :cond_1
    sget v5, Lcom/flyersoft/moonreaderp/R$string;->put_on_top:I

    :goto_1
    invoke-virtual {v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 7833
    new-array v5, v3, [Ljava/lang/String;

    aput-object v4, v5, v2

    .line 7834
    sget v6, Lcom/flyersoft/tools/A;->shelf_category:I

    if-eq v6, v3, :cond_2

    sget v6, Lcom/flyersoft/tools/A;->shelf_category:I

    const/4 v7, 0x4

    if-ne v6, v7, :cond_3

    :cond_2
    const/4 v5, 0x3

    .line 7835
    new-array v5, v5, [Ljava/lang/String;

    aput-object v4, v5, v2

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v6, Lcom/flyersoft/moonreaderp/R$array;->operations:I

    .line 7836
    invoke-static {v4, v6, v2}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v5, v3

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$array;->operations:I

    .line 7837
    invoke-static {v2, v4, v3}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v5, v3

    .line 7840
    :cond_3
    new-instance v2, Lcom/flyersoft/components/MyMenu;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v2, v3}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;

    invoke-direct {v3, p0, v1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;ZLcom/flyersoft/tools/BookDb$BookCollection;)V

    invoke-virtual {v2, v5, v3}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    .line 7864
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;)V

    return-void
.end method
