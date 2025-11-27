.class Lcom/flyersoft/moonreaderp/ActivityMain$81;
.super Ljava/lang/Thread;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$searchKey:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 7382
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81;->val$searchKey:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 7385
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    .line 7386
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfBooks:Ljava/util/ArrayList;

    .line 7388
    sget v0, Lcom/flyersoft/tools/A;->shelf_category:I

    if-lez v0, :cond_1

    .line 7389
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v2, Lcom/flyersoft/tools/A;->shelf_category:I

    const/4 v3, 0x1

    invoke-static {v2, v3, v3}, Lcom/flyersoft/tools/BookDb;->getBookCollection(IZZ)Ljava/util/ArrayList;

    move-result-object v2

    iput-object v2, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    .line 7390
    sget v0, Lcom/flyersoft/tools/A;->shelf_category:I

    const/4 v2, 0x0

    if-ne v0, v3, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 7391
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const-string v3, "favorite"

    const-string v4, "default_fav"

    invoke-static {v3, v4, v1, v2}, Lcom/flyersoft/tools/BookDb;->getBooks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v3

    iput-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfBooks:Ljava/util/ArrayList;

    .line 7392
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 7393
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    .line 7395
    :cond_0
    sget v0, Lcom/flyersoft/tools/A;->shelf_category:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_2

    sget-object v0, Lcom/flyersoft/tools/A;->shelf_sub_author:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 7396
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const-string v3, "author"

    sget-object v4, Lcom/flyersoft/tools/A;->shelf_sub_author:Ljava/lang/String;

    invoke-static {v3, v4, v1, v2}, Lcom/flyersoft/tools/BookDb;->getBooks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfBooks:Ljava/util/ArrayList;

    .line 7397
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfBooks:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/flyersoft/tools/BookDb;->getCategoriesFromBooks(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfCollections:Ljava/util/ArrayList;

    goto :goto_0

    .line 7400
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllBooks()Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfBooks:Ljava/util/ArrayList;

    .line 7402
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityMain$81$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$81$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$81;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
