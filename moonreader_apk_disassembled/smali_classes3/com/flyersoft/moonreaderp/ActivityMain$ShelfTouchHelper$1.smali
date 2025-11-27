.class Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->clearView(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 8160
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 8163
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->listShelfBooks:Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$smupdateBooksByTopId(Ljava/util/ArrayList;Z)V

    .line 8164
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfTouchHelper;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetshelfBookSearchKey(Lcom/flyersoft/moonreaderp/ActivityMain;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowShelfBookList(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    return-void
.end method
