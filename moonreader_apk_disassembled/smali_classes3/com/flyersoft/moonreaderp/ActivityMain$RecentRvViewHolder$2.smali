.class Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder$2;
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

    .line 10810
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 10812
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->clearLibWeb()V

    .line 10813
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$RecentRvViewHolder;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {}, Lcom/flyersoft/opds/N;->getLibraries()Ljava/util/ArrayList;

    move-result-object v1

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/opds/OpdsSite;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mopenLibrary(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/opds/OpdsSite;)V

    return-void
.end method
