.class Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;
.super Ljava/lang/Thread;
.source "PrefChapters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->loadPdfAnnotShot(Landroid/widget/ImageView;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

.field final synthetic val$iv:Landroid/widget/ImageView;

.field final synthetic val$position:I

.field final synthetic val$verified:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;Landroid/widget/ImageView;II)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 2470
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->val$iv:Landroid/widget/ImageView;

    iput p3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->val$position:I

    iput p4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->val$verified:I

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 2473
    :try_start_0
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    invoke-direct {v0, v1}, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;)V

    .line 2474
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->val$iv:Landroid/widget/ImageView;

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->iv:Landroid/widget/ImageView;

    .line 2475
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->act:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v3, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfAnnotList:Ljava/util/ArrayList;

    iget v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->val$position:I

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->root:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    mul-int/lit8 v1, v1, 0x4b

    div-int/lit8 v5, v1, 0x64

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v6, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->pdfShotCaches:Ljava/util/HashMap;

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/flyersoft/books/PDFReader;->pdfGetPageAnnotShot(Ljava/util/ArrayList;IILjava/util/HashMap;Z)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->bm:Landroid/graphics/Bitmap;

    .line 2476
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->val$position:I

    iput v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->position:I

    .line 2477
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->val$verified:I

    iput v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$ImageDrawable;->verified:I

    .line 2478
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter;->handler:Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$ImageListAdapter$7;->val$verified:I

    if-nez v2, :cond_0

    const-wide/16 v2, 0x0

    goto :goto_0

    :cond_0
    const/16 v2, 0x12c

    invoke-static {v2}, Lcom/flyersoft/tools/T;->myRandom(I)I

    move-result v2

    int-to-long v2, v2

    :goto_0
    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 2480
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method
