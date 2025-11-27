.class Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl$1;
.super Ljava/lang/Object;
.source "DeferredReleaserConcurrentImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;


# direct methods
.method constructor <init>(Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;)V
    .locals 0

    .line 31
    iput-object p1, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl$1;->this$0:Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 36
    iget-object v0, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl$1;->this$0:Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;

    invoke-static {v0}, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->-$$Nest$fgetmLock(Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 37
    :try_start_0
    iget-object v1, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl$1;->this$0:Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;

    invoke-static {v1}, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->-$$Nest$fgetmTempList(Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;)Ljava/util/ArrayList;

    move-result-object v1

    .line 38
    iget-object v2, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl$1;->this$0:Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;

    invoke-static {v2}, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->-$$Nest$fgetmPendingReleasables(Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->-$$Nest$fputmTempList(Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;Ljava/util/ArrayList;)V

    .line 39
    iget-object v2, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl$1;->this$0:Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;

    invoke-static {v2, v1}, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->-$$Nest$fputmPendingReleasables(Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;Ljava/util/ArrayList;)V

    .line 40
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    iget-object v0, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl$1;->this$0:Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;

    invoke-static {v0}, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->-$$Nest$fgetmTempList(Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 44
    iget-object v2, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl$1;->this$0:Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;

    invoke-static {v2}, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->-$$Nest$fgetmTempList(Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/drawee/components/DeferredReleaser$Releasable;

    invoke-interface {v2}, Lcom/facebook/drawee/components/DeferredReleaser$Releasable;->release()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl$1;->this$0:Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;

    invoke-static {v0}, Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;->-$$Nest$fgetmTempList(Lcom/facebook/drawee/components/DeferredReleaserConcurrentImpl;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void

    :catchall_0
    move-exception v1

    .line 40
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
