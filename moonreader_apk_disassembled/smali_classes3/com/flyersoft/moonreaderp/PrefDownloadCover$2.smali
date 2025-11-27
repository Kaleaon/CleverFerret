.class Lcom/flyersoft/moonreaderp/PrefDownloadCover$2;
.super Landroid/os/Handler;
.source "PrefDownloadCover.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefDownloadCover;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Landroid/os/Looper;)V
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

    .line 233
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$2;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 235
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$2;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->root:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->progressBar2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 236
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_0

    .line 238
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$2;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->coverIv:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 239
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$2;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefDownloadCover;->tipTv:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    return-void
.end method
