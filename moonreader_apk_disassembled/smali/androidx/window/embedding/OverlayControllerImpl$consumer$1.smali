.class final Landroidx/window/embedding/OverlayControllerImpl$consumer$1;
.super Lkotlin/jvm/internal/Lambda;
.source "OverlayControllerImpl.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/window/embedding/OverlayControllerImpl;-><init>(Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;Landroidx/window/embedding/EmbeddingAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Ljava/util/List<",
        "+",
        "Landroidx/window/extensions/embedding/ActivityStack;",
        ">;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nOverlayControllerImpl.kt\nKotlin\n*S Kotlin\n*F\n+ 1 OverlayControllerImpl.kt\nandroidx/window/embedding/OverlayControllerImpl$consumer$1\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,326:1\n1549#2:327\n1620#2,3:328\n*S KotlinDebug\n*F\n+ 1 OverlayControllerImpl.kt\nandroidx/window/embedding/OverlayControllerImpl$consumer$1\n*L\n135#1:327\n135#1:328,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003H\n\u00a2\u0006\u0002\u0008\u0005"
    }
    d2 = {
        "<anonymous>",
        "",
        "activityStacks",
        "",
        "Landroidx/window/extensions/embedding/ActivityStack;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/window/embedding/OverlayControllerImpl;


# direct methods
.method constructor <init>(Landroidx/window/embedding/OverlayControllerImpl;)V
    .locals 0

    iput-object p1, p0, Landroidx/window/embedding/OverlayControllerImpl$consumer$1;->this$0:Landroidx/window/embedding/OverlayControllerImpl;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 129
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Landroidx/window/embedding/OverlayControllerImpl$consumer$1;->invoke(Ljava/util/List;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method public final invoke(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/window/extensions/embedding/ActivityStack;",
            ">;)V"
        }
    .end annotation

    const-string v0, "activityStacks"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 130
    iget-object v0, p0, Landroidx/window/embedding/OverlayControllerImpl$consumer$1;->this$0:Landroidx/window/embedding/OverlayControllerImpl;

    invoke-static {v0}, Landroidx/window/embedding/OverlayControllerImpl;->access$getGlobalLock$p(Landroidx/window/embedding/OverlayControllerImpl;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    iget-object v1, p0, Landroidx/window/embedding/OverlayControllerImpl$consumer$1;->this$0:Landroidx/window/embedding/OverlayControllerImpl;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 131
    :try_start_0
    invoke-static {v1}, Landroidx/window/embedding/OverlayControllerImpl;->access$getOverlayTagToContainerMap$p(Landroidx/window/embedding/OverlayControllerImpl;)Landroid/util/ArrayMap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v2

    const-string v3, "<get-keys>(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 133
    invoke-static {v1}, Landroidx/window/embedding/OverlayControllerImpl;->access$getOverlayTagToContainerMap$p(Landroidx/window/embedding/OverlayControllerImpl;)Landroid/util/ArrayMap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/util/ArrayMap;->clear()V

    .line 134
    invoke-static {v1}, Landroidx/window/embedding/OverlayControllerImpl;->access$getOverlayTagToContainerMap$p(Landroidx/window/embedding/OverlayControllerImpl;)Landroid/util/ArrayMap;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 135
    invoke-static {v1, p1}, Landroidx/window/embedding/OverlayControllerImpl;->access$getOverlayContainers(Landroidx/window/embedding/OverlayControllerImpl;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    .line 327
    new-instance v4, Ljava/util/ArrayList;

    const/16 v5, 0xa

    invoke-static {p1, v5}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v4, Ljava/util/Collection;

    .line 328
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 329
    check-cast v5, Landroidx/window/extensions/embedding/ActivityStack;

    .line 136
    new-instance v6, Lkotlin/Pair;

    invoke-virtual {v5}, Landroidx/window/extensions/embedding/ActivityStack;->getTag()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {v6, v7, v5}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 329
    invoke-interface {v4, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 330
    :cond_0
    check-cast v4, Ljava/util/List;

    .line 327
    check-cast v4, Ljava/lang/Iterable;

    .line 134
    invoke-static {v3, v4}, Lkotlin/collections/MapsKt;->putAll(Ljava/util/Map;Ljava/lang/Iterable;)V

    .line 140
    invoke-static {v1, v2}, Landroidx/window/embedding/OverlayControllerImpl;->access$cleanUpDismissedOverlayContainerRecords(Landroidx/window/embedding/OverlayControllerImpl;Ljava/util/Set;)V

    .line 141
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method
