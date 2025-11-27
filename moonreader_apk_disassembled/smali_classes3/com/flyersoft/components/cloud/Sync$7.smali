.class Lcom/flyersoft/components/cloud/Sync$7;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->uploadShelfBooksToCloud(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$checkSyncRecords:Z

.field final synthetic val$uploadCoversToo:Z


# direct methods
.method constructor <init>(ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 387
    iput-boolean p1, p0, Lcom/flyersoft/components/cloud/Sync$7;->val$checkSyncRecords:Z

    iput-boolean p2, p0, Lcom/flyersoft/components/cloud/Sync$7;->val$uploadCoversToo:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 3

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 392
    sput-boolean p1, Lcom/flyersoft/components/cloud/Sync;->uploadBookFilesWorking:Z

    const/4 p1, 0x0

    .line 393
    sput-object p1, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookList:Ljava/util/ArrayList;

    return-void

    .line 397
    :cond_0
    check-cast p1, Ljava/util/HashMap;

    .line 398
    sget-object v0, Lcom/flyersoft/components/cloud/Sync;->cloudBookList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 399
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 400
    sget-object v2, Lcom/flyersoft/components/cloud/Sync;->cloudBookList:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 402
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/components/cloud/Sync;->uploadShelfBookList:Ljava/util/ArrayList;

    .line 403
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/flyersoft/components/cloud/Sync;->pdfCloudIsNewerList:Ljava/util/ArrayList;

    .line 405
    new-instance v0, Lcom/flyersoft/components/cloud/Sync$7$1;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/components/cloud/Sync$7$1;-><init>(Lcom/flyersoft/components/cloud/Sync$7;Ljava/util/HashMap;)V

    const/4 p1, 0x1

    .line 436
    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setPriority(I)V

    .line 437
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method
