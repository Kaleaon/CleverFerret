.class Lcom/flyersoft/components/cloud/Sync$4;
.super Landroid/os/Handler;
.source "Sync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->syncShelfToCloudManually()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>(Landroid/os/Looper;)V
    .locals 0

    .line 300
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 302
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 304
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    .line 305
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllBooks()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0, v2, v2}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smuploadShelfBookCovers(Ljava/util/ArrayList;ZZ)V

    .line 306
    :cond_1
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 307
    invoke-static {v2, v2}, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBooksToCloud(ZZ)V

    :cond_2
    :goto_0
    return-void
.end method
