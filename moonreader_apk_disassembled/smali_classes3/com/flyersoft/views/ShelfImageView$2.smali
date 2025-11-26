.class Lcom/flyersoft/views/ShelfImageView$2;
.super Ljava/lang/Thread;
.source "ShelfImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/views/ShelfImageView;->downloadUrlImage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/ShelfImageView;

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$password:Ljava/lang/String;

.field final synthetic val$url:Ljava/lang/String;

.field final synthetic val$username:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/ShelfImageView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 240
    iput-object p1, p0, Lcom/flyersoft/views/ShelfImageView$2;->this$0:Lcom/flyersoft/views/ShelfImageView;

    iput-object p2, p0, Lcom/flyersoft/views/ShelfImageView$2;->val$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/views/ShelfImageView$2;->val$username:Ljava/lang/String;

    iput-object p4, p0, Lcom/flyersoft/views/ShelfImageView$2;->val$password:Ljava/lang/String;

    iput-object p5, p0, Lcom/flyersoft/views/ShelfImageView$2;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 243
    iget-object v0, p0, Lcom/flyersoft/views/ShelfImageView$2;->val$url:Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/views/ShelfImageView$2;->val$username:Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/views/ShelfImageView$2;->val$password:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/flyersoft/tools/T;->getUrlImage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 244
    iget-object v1, p0, Lcom/flyersoft/views/ShelfImageView$2;->val$handler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 245
    iget-object v1, p0, Lcom/flyersoft/views/ShelfImageView$2;->val$handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
