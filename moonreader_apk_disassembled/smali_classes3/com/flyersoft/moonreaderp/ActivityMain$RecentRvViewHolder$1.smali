.class Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder$1;
.super Landroid/os/Handler;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 10800
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 10802
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->bookmarkBooks:Ljava/util/ArrayList;

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowOneBookAnnots(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;)V

    return-void
.end method
