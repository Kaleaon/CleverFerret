.class Lcom/flyersoft/components/cloud/Sync$10$1;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync$10;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Sync$10;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Sync$10;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 571
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$10$1;->this$0:Lcom/flyersoft/components/cloud/Sync$10;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 575
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$sfputcoverUploadList2(Ljava/util/ArrayList;)V

    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$sfputcoverUploadList(Ljava/util/ArrayList;)V

    return-void

    .line 578
    :cond_0
    check-cast p1, Ljava/util/HashMap;

    .line 579
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Sync$10$1;->this$0:Lcom/flyersoft/components/cloud/Sync$10;

    iget-boolean v0, v0, Lcom/flyersoft/components/cloud/Sync$10;->val$checkSyncRecords:Z

    invoke-static {p1, v0}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smverifyUploadBookCovers(Ljava/util/HashMap;Z)V

    return-void
.end method
