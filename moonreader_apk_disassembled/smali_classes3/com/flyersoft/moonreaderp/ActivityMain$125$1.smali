.class Lcom/flyersoft/moonreaderp/ActivityMain$125$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$125;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

.field final synthetic val$filename:Ljava/lang/String;

.field final synthetic val$fromFavRv:Z

.field final synthetic val$items:[Ljava/lang/String;

.field final synthetic val$showShortcut:Z

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$125;Ljava/lang/String;ZLandroid/view/View;Z[Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
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

    .line 11314
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$filename:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$fromFavRv:Z

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$v:Landroid/view/View;

    iput-boolean p5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$showShortcut:Z

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$items:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 9

    .line 11316
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11317
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$filename:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x0

    if-nez p1, :cond_2

    .line 11319
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 11320
    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$fromFavRv:Z

    if-eqz v2, :cond_0

    .line 11321
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$v:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 11322
    new-instance v3, Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object v4, v2, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v5, Lcom/flyersoft/moonreaderp/ActivityMain$125$1$1;

    invoke-direct {v5, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$125$1$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$125$1;)V

    const/4 v6, 0x1

    const/4 v8, 0x0

    invoke-direct/range {v3 .. v8}, Lcom/flyersoft/moonreaderp/PrefEditBook;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefEditBook$OnBookEdited;ZLcom/flyersoft/tools/BookDb$BookInfo;I)V

    .line 11327
    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefEditBook;->show()V

    goto :goto_0

    .line 11329
    :cond_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->filename:I

    .line 11330
    invoke-virtual {v5, v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$filename:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\" "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->not_exists:I

    invoke-virtual {v5, v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 11329
    invoke-static {v2, v3, v4}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 11332
    :cond_1
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$filename:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->importSingleBook(Ljava/lang/String;Z)V

    :cond_2
    :goto_0
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne p1, v3, :cond_3

    .line 11335
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$filename:Ljava/lang/String;

    invoke-virtual {v4, v5, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->download_cover(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)V

    .line 11336
    :cond_3
    iget-boolean v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$showShortcut:Z

    const/4 v5, 0x2

    if-eqz v4, :cond_4

    if-ne p1, v5, :cond_4

    .line 11337
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$filename:Ljava/lang/String;

    invoke-static {v4, v6, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->do_add_desktop(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 11338
    :cond_4
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$items:[Ljava/lang/String;

    array-length v2, v2

    sub-int/2addr v2, v5

    if-ne p1, v2, :cond_5

    .line 11339
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$filename:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/compress/BaseCompressor;->getZRCacheFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/flyersoft/tools/A;->sendFile(Landroid/content/Context;Ljava/lang/String;)V

    .line 11340
    :cond_5
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$items:[Ljava/lang/String;

    array-length v2, v2

    sub-int/2addr v2, v3

    if-ne p1, v2, :cond_7

    .line 11341
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$fromFavRv:Z

    if-eqz p1, :cond_6

    .line 11342
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->val$v:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 11343
    const-string v0, ""

    iput-object v0, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    .line 11344
    invoke-static {p1, v1}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    .line 11345
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFavRvAdapter()V

    .line 11346
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    if-eqz p1, :cond_7

    sget p1, Lcom/flyersoft/tools/A;->shelf_category:I

    if-ne p1, v3, :cond_7

    .line 11347
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    return-void

    .line 11349
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$125$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$125;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$125;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mremoveBooksFromHistory(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/util/ArrayList;)V

    :cond_7
    return-void
.end method
