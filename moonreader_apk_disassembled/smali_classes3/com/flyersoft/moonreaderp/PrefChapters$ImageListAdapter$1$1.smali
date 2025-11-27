.class Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1$1;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2245
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 2248
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->imagesAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    if-eqz v0, :cond_0

    .line 2249
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->-$$Nest$minitList(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;)V

    .line 2250
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->imagesAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method
