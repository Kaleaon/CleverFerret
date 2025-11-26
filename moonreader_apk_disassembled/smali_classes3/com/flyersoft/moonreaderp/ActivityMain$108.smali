.class Lcom/flyersoft/moonreaderp/ActivityMain$108;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->updateBookTags(Ljava/util/ArrayList;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$books:Ljava/util/ArrayList;

.field final synthetic val$edit:Landroid/widget/EditText;

.field final synthetic val$updateTagList:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/EditText;Ljava/util/ArrayList;Z)V
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

    .line 9595
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$108;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$108;->val$edit:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$108;->val$books:Ljava/util/ArrayList;

    iput-boolean p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$108;->val$updateTagList:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 9

    .line 9597
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$108;->val$edit:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 9598
    const-string p2, ""

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    goto/16 :goto_2

    .line 9600
    :cond_0
    const-string p2, "\n"

    invoke-virtual {p1, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 9601
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 9602
    :cond_1
    invoke-static {p1}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    .line 9604
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->beginTransition()V

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 9605
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$108;->val$books:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_5

    .line 9606
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$108;->val$books:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 9608
    iget-object v3, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 9609
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    const/4 v5, 0x0

    :cond_2
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 9610
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v7

    const/4 v8, -0x1

    if-ne v7, v8, :cond_2

    .line 9612
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    const/4 v5, 0x1

    goto :goto_1

    :cond_3
    if-eqz v5, :cond_4

    .line 9615
    invoke-static {v2, v0}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 9617
    :cond_5
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->endTransition()V

    .line 9618
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$108;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_select_state(Z)V

    .line 9619
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$108;->val$updateTagList:Z

    if-eqz p1, :cond_6

    .line 9620
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$108;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf(Ljava/lang/String;)V

    :cond_6
    :goto_2
    return-void
.end method
