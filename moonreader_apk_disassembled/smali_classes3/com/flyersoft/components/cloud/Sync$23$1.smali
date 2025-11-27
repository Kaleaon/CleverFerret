.class Lcom/flyersoft/components/cloud/Sync$23$1;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync$23;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Sync$23;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Sync$23;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1093
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$23$1;->this$0:Lcom/flyersoft/components/cloud/Sync$23;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 1097
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$sfputcoverDownloadList2(Ljava/util/ArrayList;)V

    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$sfputcoverDownloadList(Ljava/util/ArrayList;)V

    return-void

    .line 1100
    :cond_0
    check-cast p1, Ljava/util/HashMap;

    .line 1101
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Sync$23$1;->this$0:Lcom/flyersoft/components/cloud/Sync$23;

    iget-boolean v0, v0, Lcom/flyersoft/components/cloud/Sync$23;->val$uploadCoversAfterDownload:Z

    iget-object v1, p0, Lcom/flyersoft/components/cloud/Sync$23$1;->this$0:Lcom/flyersoft/components/cloud/Sync$23;

    iget-boolean v1, v1, Lcom/flyersoft/components/cloud/Sync$23;->val$checkSyncRecords:Z

    invoke-static {p1, v0, v1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smverifyDownloadBookCovers(Ljava/util/HashMap;ZZ)V

    return-void
.end method
