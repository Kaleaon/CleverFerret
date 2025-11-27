.class Lcom/flyersoft/moonreaderp/ActivityMain$92$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$92;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

.field final synthetic val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

.field final synthetic val$count:I

.field final synthetic val$showShortcut:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$92;Lcom/flyersoft/tools/BookDb$BookInfo;ZI)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 8994
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$showShortcut:Z

    iput p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$count:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private renameGroup(Lcom/flyersoft/tools/BookDb$BookInfo;)V
    .locals 4

    .line 9045
    new-instance v0, Lcom/flyersoft/views/ClearableEditText;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v0, v1}, Lcom/flyersoft/views/ClearableEditText;-><init>(Landroid/content/Context;)V

    .line 9046
    invoke-virtual {v0}, Lcom/flyersoft/views/ClearableEditText;->setSingleLine()V

    const/4 v1, 0x0

    .line 9047
    invoke-virtual {p1, v1}, Lcom/flyersoft/tools/BookDb$BookInfo;->getGroupName(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/ClearableEditText;->setText(Ljava/lang/CharSequence;)V

    .line 9048
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->rename_file:I

    .line 9049
    invoke-virtual {v1, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    .line 9050
    invoke-virtual {v1, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 9051
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x104000a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/flyersoft/moonreaderp/ActivityMain$92$1$2;

    invoke-direct {v3, p0, v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$92$1$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$92$1;Lcom/flyersoft/views/ClearableEditText;Lcom/flyersoft/tools/BookDb$BookInfo;)V

    invoke-virtual {v1, v2, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 9064
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 11

    .line 8996
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8997
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    if-nez p1, :cond_2

    .line 9000
    invoke-static {}, Lcom/flyersoft/tools/A;->getShelfTopBooks()Ljava/util/ArrayList;

    move-result-object v2

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 9001
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->removeFromShelfTop(Ljava/lang/String;)V

    .line 9002
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    const/4 v3, -0x1

    invoke-static {v2, v1, v3}, Lcom/flyersoft/tools/A;->updateShelfSortAfterTopChanged(Lcom/flyersoft/tools/BookDb$BookInfo;ZI)V

    .line 9003
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iput v3, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->topId:I

    const/4 v4, 0x1

    goto :goto_0

    .line 9006
    :cond_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/A;->addToShelfTop(Ljava/lang/String;)V

    .line 9007
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget v3, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->index:I

    const/4 v4, 0x0

    invoke-static {v2, v4, v3}, Lcom/flyersoft/tools/A;->updateShelfSortAfterTopChanged(Lcom/flyersoft/tools/BookDb$BookInfo;ZI)V

    .line 9009
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceHideSelectState(Lcom/flyersoft/moonreaderp/ActivityMain;)Z

    if-eqz v4, :cond_1

    .line 9011
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iput-object v3, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->forceShelfScrollToBookFile:Ljava/lang/String;

    .line 9012
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    goto :goto_1

    .line 9014
    :cond_1
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    invoke-static {v2, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$smupdateBooksByTopId(Ljava/util/ArrayList;Z)V

    .line 9015
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetshelfBookSearchKey(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowShelfBookList(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    .line 9018
    :cond_2
    :goto_1
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-virtual {v2}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v2

    const/4 v3, 0x3

    const/4 v4, 0x2

    if-eqz v2, :cond_4

    if-ne p1, v4, :cond_3

    .line 9020
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-direct {p0, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->renameGroup(Lcom/flyersoft/tools/BookDb$BookInfo;)V

    :cond_3
    if-ne p1, v3, :cond_9

    .line 9022
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mclearGroup(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/tools/BookDb$BookInfo;)V

    return-void

    :cond_4
    if-ne p1, v4, :cond_5

    .line 9026
    new-instance v5, Lcom/flyersoft/moonreaderp/PrefEditBook;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object v6, v2, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v7, Lcom/flyersoft/moonreaderp/ActivityMain$92$1$1;

    invoke-direct {v7, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$92$1$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$92$1;)V

    iget-object v9, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    const/4 v10, 0x0

    const/4 v8, 0x1

    invoke-direct/range {v5 .. v10}, Lcom/flyersoft/moonreaderp/PrefEditBook;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefEditBook$OnBookEdited;ZLcom/flyersoft/tools/BookDb$BookInfo;I)V

    .line 9031
    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/PrefEditBook;->show()V

    :cond_5
    if-ne p1, v3, :cond_6

    .line 9034
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-virtual {v2, v3, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->download_cover(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)V

    .line 9035
    :cond_6
    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$showShortcut:Z

    if-eqz v2, :cond_7

    const/4 v2, 0x4

    if-ne p1, v2, :cond_7

    .line 9036
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-static {v2, v3, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->do_add_desktop(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 9037
    :cond_7
    iget v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$count:I

    sub-int/2addr v2, v4

    if-ne p1, v2, :cond_8

    .line 9038
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/flyersoft/tools/A;->sendFile(Landroid/content/Context;Ljava/lang/String;)V

    .line 9039
    :cond_8
    iget v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->val$count:I

    sub-int/2addr v2, v1

    if-ne p1, v2, :cond_9

    .line 9040
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$92$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$92;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$92;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mremoveBooksFromShelf(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/util/ArrayList;)V

    :cond_9
    return-void
.end method
