.class Lcom/flyersoft/moonreaderp/ActivityMain$106;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->renameBookTags(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$edit:Landroid/widget/EditText;

.field final synthetic val$tag:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/EditText;Ljava/lang/String;)V
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

    .line 9494
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$106;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$106;->val$edit:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$106;->val$tag:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6

    .line 9496
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$106;->val$edit:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 9497
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$106;->val$tag:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    .line 9499
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$106;->val$tag:Ljava/lang/String;

    const/4 v0, 0x1

    const-string v1, "category"

    const/4 v2, 0x0

    invoke-static {v1, p2, v2, v0}, Lcom/flyersoft/tools/BookDb;->getBooks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object p2

    .line 9500
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->beginTransition()V

    .line 9501
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 9502
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 9503
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$106;->val$tag:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 9504
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    const/4 v4, -0x1

    const/4 v5, 0x0

    if-ne v3, v4, :cond_0

    .line 9505
    invoke-virtual {v1, v5, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 9506
    :cond_0
    invoke-static {v1}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    .line 9507
    invoke-static {v0, v5}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    goto :goto_0

    .line 9509
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->endTransition()V

    .line 9510
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$106;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf(Ljava/lang/String;)V

    .line 9511
    sget-object p1, Lcom/flyersoft/components/DualFavLay;->selfPref:Lcom/flyersoft/components/DualFavLay;

    if-eqz p1, :cond_2

    .line 9512
    sget-object p1, Lcom/flyersoft/components/DualFavLay;->selfPref:Lcom/flyersoft/components/DualFavLay;

    invoke-virtual {p1}, Lcom/flyersoft/components/DualFavLay;->initLay1()V

    :cond_2
    return-void
.end method
