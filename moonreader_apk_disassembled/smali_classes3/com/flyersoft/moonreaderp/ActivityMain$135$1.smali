.class Lcom/flyersoft/moonreaderp/ActivityMain$135$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$135;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$135;

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$135;Landroid/view/View;)V
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

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 12598
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$135;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1;->val$v:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 7

    .line 12600
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1;->val$v:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 12601
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1;->val$v:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->menuB:I

    invoke-virtual {v1, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 12602
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$135;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$135;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    if-eqz v1, :cond_1

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->bookmarkBooks:Ljava/util/ArrayList;

    goto :goto_1

    :cond_1
    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->annotBooks:Ljava/util/ArrayList;

    :goto_1
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-nez p1, :cond_2

    .line 12604
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$135;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$135;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->openFile(Ljava/lang/String;)V

    return-void

    .line 12606
    :cond_2
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$135;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$135;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p1, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$135;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$135;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->button_bookmarks:I

    .line 12607
    invoke-virtual {v4, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$135;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$135;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v5, Lcom/flyersoft/moonreaderp/R$array;->one_file_bookmark:I

    const/4 v6, 0x2

    invoke-static {v4, v5, v6}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$135;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$135;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 12608
    invoke-static {v2}, Lcom/flyersoft/tools/BookDb;->getBookFromAll(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getBookName2(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v3, Lcom/flyersoft/moonreaderp/ActivityMain$135$1$1;

    invoke-direct {v3, p0, v2, v1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$135$1$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$135$1;Ljava/lang/String;ZI)V

    const v0, 0x1040013

    .line 12609
    invoke-virtual {p1, v0, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const v0, 0x1040009

    const/4 v1, 0x0

    .line 12621
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 12622
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
