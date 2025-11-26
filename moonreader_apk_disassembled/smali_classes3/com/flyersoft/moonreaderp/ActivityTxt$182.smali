.class Lcom/flyersoft/moonreaderp/ActivityTxt$182;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->initClickTip(Z)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$forceShow:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/os/Looper;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 18173
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$182;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$182;->val$forceShow:Z

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 18176
    :try_start_0
    new-instance p1, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$182;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$182;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getPageShot(Z)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    sput-object p1, Lcom/flyersoft/moonreaderp/ClickTip;->drawable:Landroid/graphics/drawable/Drawable;

    .line 18177
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$182;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-class v1, Lcom/flyersoft/moonreaderp/ClickTip;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 18178
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$182;->val$forceShow:Z

    if-nez v0, :cond_0

    .line 18179
    const-string v0, "hideModeZone"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 18180
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$182;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 18182
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method
