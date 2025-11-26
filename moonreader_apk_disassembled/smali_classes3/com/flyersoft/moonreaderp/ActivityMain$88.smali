.class Lcom/flyersoft/moonreaderp/ActivityMain$88;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefGroupBooks$OnGroupMoveOut;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->showGroupBooksDialog(ILcom/flyersoft/tools/BookDb$BookInfo;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/tools/BookDb$BookInfo;I)V
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

    .line 8757
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$88;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iput p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$88;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/String;I)V
    .locals 2

    .line 8760
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$88;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-virtual {v0}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroupShouldMove()Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_0

    const/4 p2, 0x2

    :cond_0
    if-eqz p1, :cond_1

    .line 8763
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$88;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {v0, v1, p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mbookRemovedFromGroupDialog(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/tools/BookDb$BookInfo;Ljava/lang/String;I)V

    return-void

    :cond_1
    const/4 p1, 0x1

    if-le p2, p1, :cond_2

    .line 8765
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$88;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mchangeGroupIfItShouldBeMoved(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/tools/BookDb$BookInfo;)Z

    .line 8766
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    return-void

    :cond_2
    if-ne p2, p1, :cond_4

    .line 8768
    sget p1, Lcom/flyersoft/tools/A;->shelfStyle:I

    if-ge p1, v1, :cond_3

    .line 8769
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->shelfAdapter:Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;

    iget p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$88;->val$position:I

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$ShelfAdapter;->notifyItemChanged(I)V

    return-void

    .line 8771
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$88;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->coverflow:Lcom/flyersoft/views/CoverFlow;

    invoke-virtual {p2}, Lcom/flyersoft/views/CoverFlow;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Landroid/widget/Adapter;)V

    :cond_4
    return-void
.end method
