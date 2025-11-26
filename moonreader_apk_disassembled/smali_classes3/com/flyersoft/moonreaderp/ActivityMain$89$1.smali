.class Lcom/flyersoft/moonreaderp/ActivityMain$89$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$89;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$89;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$89;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 8919
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$89$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$89;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFolder(Ljava/lang/String;)V
    .locals 6

    .line 8921
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$89$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$89;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$89;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 8922
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 8923
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefGroupBooks;->dismissNull()V

    .line 8924
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$89$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$89;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$89;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/flyersoft/tools/BookDb;->moveBooksToNewPath(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    .line 8925
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$89$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$89;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$89;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowMyShelf(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    .line 8926
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8927
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 8928
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 8929
    :cond_0
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$89$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$89;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$89;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->book_link_to_new_path:I

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v1, v5

    invoke-virtual {v3, v4, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, p1, v0}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void

    .line 8931
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$89$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$89;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$89;->val$con:Landroid/content/Context;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$89$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$89;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$89;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->no_same_book_found:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method
