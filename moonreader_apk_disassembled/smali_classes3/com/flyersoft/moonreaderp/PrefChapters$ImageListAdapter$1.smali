.class Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;
.super Ljava/lang/Thread;
.source "PrefChapters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

.field final synthetic val$this$0:Lcom/flyersoft/moonreaderp/PrefChapters;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;Lcom/flyersoft/moonreaderp/PrefChapters;)V
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

    .line 2237
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;->val$this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 2241
    :try_start_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfGetAnnotList()Ljava/util/ArrayList;

    move-result-object v0

    .line 2242
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->pdfAnnotLoading:Z

    .line 2243
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->dismissed:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->root:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 2244
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iput-object v0, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfAnnotList:Ljava/util/ArrayList;

    .line 2245
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters;->root:Landroid/view/View;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1$1;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$1;)V

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 2256
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method
