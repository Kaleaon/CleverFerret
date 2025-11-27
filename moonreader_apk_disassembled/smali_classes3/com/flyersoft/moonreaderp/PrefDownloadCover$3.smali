.class Lcom/flyersoft/moonreaderp/PrefDownloadCover$3;
.super Ljava/lang/Object;
.source "PrefDownloadCover.java"

# interfaces
.implements Ljava/lang/Runnable;


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

.field final synthetic val$fullHandler:Landroid/os/Handler;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefDownloadCover;Ljava/lang/String;Landroid/os/Handler;)V
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

    .line 246
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$3;->this$0:Lcom/flyersoft/moonreaderp/PrefDownloadCover;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$3;->val$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$3;->val$fullHandler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 248
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$3;->val$url:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getUrlImage(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 249
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$3;->val$fullHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 250
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefDownloadCover$3;->val$fullHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
