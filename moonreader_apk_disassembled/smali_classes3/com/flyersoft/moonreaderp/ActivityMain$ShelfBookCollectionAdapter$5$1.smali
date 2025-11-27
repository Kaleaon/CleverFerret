.class Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;

.field final synthetic val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

.field final synthetic val$onTop:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;ZLcom/flyersoft/tools/BookDb$BookCollection;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 7840
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->val$onTop:Z

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 8

    .line 7842
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msaveLastSub(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    if-nez p1, :cond_1

    .line 7844
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->val$onTop:Z

    if-eqz v0, :cond_0

    .line 7845
    sget v0, Lcom/flyersoft/tools/A;->shelf_category:I

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/components/DualFavLay;->removeFromLastFavTop(ILjava/lang/String;)V

    goto :goto_0

    .line 7847
    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->shelf_category:I

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/components/DualFavLay;->addToLastFavTop(ILjava/lang/String;)V

    .line 7848
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->-$$Nest$msortItems(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;)V

    .line 7849
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->notifyDataSetChanged()V

    :cond_1
    const/4 v0, 0x0

    const/4 v1, 0x4

    const/4 v2, 0x1

    if-ne p1, v2, :cond_3

    .line 7852
    sget v3, Lcom/flyersoft/tools/A;->shelf_category:I

    if-ne v3, v2, :cond_2

    .line 7853
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldName:Ljava/lang/String;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v6, v6, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-boolean v7, v7, Lcom/flyersoft/tools/BookDb$BookCollection;->multiType:Z

    invoke-static {v5, v6, v0, v7}, Lcom/flyersoft/tools/BookDb;->getBooks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v3, v4, v5, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateBookFavorites(Landroid/content/Context;Ljava/util/ArrayList;Z)V

    .line 7854
    :cond_2
    sget v3, Lcom/flyersoft/tools/A;->shelf_category:I

    if-ne v3, v1, :cond_3

    .line 7855
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->renameBookTags(Landroid/content/Context;Ljava/lang/String;)V

    :cond_3
    const/4 v3, 0x2

    if-ne p1, v3, :cond_5

    .line 7858
    sget p1, Lcom/flyersoft/tools/A;->shelf_category:I

    if-ne p1, v2, :cond_4

    .line 7859
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v4, v4, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldName:Ljava/lang/String;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-boolean v6, v6, Lcom/flyersoft/tools/BookDb$BookCollection;->multiType:Z

    invoke-static {v4, v5, v0, v6}, Lcom/flyersoft/tools/BookDb;->getBooks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p1, v2, v3, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->deleteBookFavority(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 7860
    :cond_4
    sget p1, Lcom/flyersoft/tools/A;->shelf_category:I

    if-ne p1, v1, :cond_5

    .line 7861
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfBookCollectionAdapter$5$1;->val$bc:Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->deleteBookTag(Landroid/content/Context;Ljava/lang/String;)V

    :cond_5
    return-void
.end method
