.class Lcom/flyersoft/moonreaderp/ActivityMain$131;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefSelectImportBooks$OnFinish;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->shelfImportSelectBooksToAdd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 11735
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$131;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinish(I)V
    .locals 3

    if-nez p1, :cond_0

    .line 11739
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$131;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mhideProgressDialog(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 11741
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$131;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mhideProgressDialog(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 11742
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$131;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->doShelfImport(Z)V

    return-void

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_5

    .line 11744
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 11746
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$131;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->import_items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;

    .line 11747
    iget-boolean v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->selected:Z

    if-eqz v2, :cond_2

    .line 11748
    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$Import_Item;->filename:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/util/ConcurrentModificationException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 11750
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 11752
    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_4

    .line 11753
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$131;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mhideProgressDialog(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    goto :goto_1

    .line 11755
    :cond_4
    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$131$1;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$131$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$131;Ljava/util/ArrayList;)V

    .line 11760
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain$131$1;->start()V

    :cond_5
    :goto_1
    return-void
.end method
