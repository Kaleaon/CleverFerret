.class Lcom/flyersoft/moonreaderp/ActivityMain$104;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->deleteBookFavority(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$books:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/util/ArrayList;)V
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

    .line 9447
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$104;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$104;->val$books:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 9449
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->beginTransition()V

    .line 9450
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$104;->val$books:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 9451
    const-string v0, ""

    iput-object v0, p2, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    const/4 v0, 0x0

    .line 9452
    invoke-static {p2, v0}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    goto :goto_0

    .line 9454
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->endTransition()V

    .line 9455
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$104;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFavRvAdapter()V

    .line 9456
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$104;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf(Ljava/lang/String;)V

    .line 9457
    sget-object p1, Lcom/flyersoft/components/DualFavLay;->selfPref:Lcom/flyersoft/components/DualFavLay;

    if-eqz p1, :cond_1

    .line 9458
    sget-object p1, Lcom/flyersoft/components/DualFavLay;->selfPref:Lcom/flyersoft/components/DualFavLay;

    invoke-virtual {p1}, Lcom/flyersoft/components/DualFavLay;->initLay1()V

    :cond_1
    return-void
.end method
