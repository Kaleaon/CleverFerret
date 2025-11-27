.class Lcom/flyersoft/moonreaderp/PrefShelf$12$1;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf$12;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefShelf$12;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf$12;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 560
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$12$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 563
    const-string v0, ""

    const/16 v1, 0x3f0

    const/4 v2, 0x0

    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->emptyDatabase()V

    const/4 v3, 0x1

    .line 564
    invoke-static {v3}, Lcom/flyersoft/components/cloud/Sync;->setShelfUpdateState(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 566
    sput v2, Lcom/flyersoft/tools/A;->shelf_category:I

    .line 567
    sput-object v0, Lcom/flyersoft/tools/A;->shelf_sub_author:Ljava/lang/String;

    .line 568
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 569
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_0
    return-void

    :catchall_0
    move-exception v3

    .line 566
    sput v2, Lcom/flyersoft/tools/A;->shelf_category:I

    .line 567
    sput-object v0, Lcom/flyersoft/tools/A;->shelf_sub_author:Ljava/lang/String;

    .line 568
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 569
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 570
    :cond_1
    throw v3
.end method
