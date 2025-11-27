.class Lcom/flyersoft/moonreaderp/ActivityMain$105;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->deleteBookTag(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$tag:Ljava/lang/String;


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

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 9467
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$105;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$105;->val$tag:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 9469
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$105;->val$tag:Ljava/lang/String;

    const/4 p2, 0x1

    const-string v0, "category"

    const/4 v1, 0x0

    invoke-static {v0, p1, v1, p2}, Lcom/flyersoft/tools/BookDb;->getBooks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object p1

    .line 9470
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->beginTransition()V

    .line 9471
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 9472
    iget-object v0, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 9473
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$105;->val$tag:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 9474
    invoke-static {v0}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    const/4 v0, 0x0

    .line 9475
    invoke-static {p2, v0}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    goto :goto_0

    .line 9477
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->endTransition()V

    .line 9478
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$105;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFavRvAdapter()V

    .line 9479
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$105;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf(Ljava/lang/String;)V

    .line 9480
    sget-object p1, Lcom/flyersoft/components/DualFavLay;->selfPref:Lcom/flyersoft/components/DualFavLay;

    if-eqz p1, :cond_1

    .line 9481
    sget-object p1, Lcom/flyersoft/components/DualFavLay;->selfPref:Lcom/flyersoft/components/DualFavLay;

    invoke-virtual {p1}, Lcom/flyersoft/components/DualFavLay;->initLay1()V

    :cond_1
    return-void
.end method
