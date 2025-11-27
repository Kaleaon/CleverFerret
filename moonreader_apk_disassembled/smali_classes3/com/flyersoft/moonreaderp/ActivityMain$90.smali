.class Lcom/flyersoft/moonreaderp/ActivityMain$90;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->verifyShelfBook(Landroid/content/Context;Lcom/flyersoft/tools/BookDb$BookInfo;Ljava/util/ArrayList;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

.field final synthetic val$books:Ljava/util/ArrayList;

.field final synthetic val$cb:Landroid/widget/CheckBox;

.field final synthetic val$con:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/CheckBox;Ljava/util/ArrayList;Landroid/content/Context;Lcom/flyersoft/tools/BookDb$BookInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
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
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 8896
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->val$cb:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->val$books:Ljava/util/ArrayList;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->val$con:Landroid/content/Context;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5

    .line 8898
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 8899
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getBookCount()I

    move-result p1

    .line 8900
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->val$books:Ljava/util/ArrayList;

    const/4 v0, 0x1

    invoke-static {p2, v0}, Lcom/flyersoft/tools/BookDb;->checkBooksAvailable(Ljava/util/ArrayList;Z)V

    .line 8901
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllBooks()Ljava/util/ArrayList;

    move-result-object p2

    const/4 v1, 0x0

    invoke-static {p2, v1}, Lcom/flyersoft/tools/BookDb;->checkBooksAvailable(Ljava/util/ArrayList;Z)V

    .line 8902
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getBookCount()I

    move-result p2

    .line 8903
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->val$con:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->remove_all_invalidated_books:I

    invoke-virtual {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ":\n\n "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sub-int/2addr p1, p2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 8904
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowMyShelf(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    goto :goto_0

    .line 8906
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {p1, p2}, Lcom/flyersoft/tools/BookDb;->deleteBook(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)I

    .line 8907
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->val$books:Ljava/util/ArrayList;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 8908
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfLv:Lcom/flyersoft/views/BookShelfView;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 8909
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$90;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFavRvAdapter()V

    .line 8910
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->updateGroupShelf()Z

    .line 8912
    :goto_0
    invoke-static {}, Lcom/flyersoft/tools/A;->saveAllShelfSorts()V

    return-void
.end method
