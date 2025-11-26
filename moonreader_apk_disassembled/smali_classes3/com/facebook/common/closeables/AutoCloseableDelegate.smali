.class public final Lcom/facebook/common/closeables/AutoCloseableDelegate;
.super Lcom/facebook/common/closeables/AutoCleanupDelegate;
.source "AutoCleanupDelegate.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ljava/io/Closeable;",
        ">",
        "Lcom/facebook/common/closeables/AutoCleanupDelegate<",
        "TT;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u0008\u0012\u0004\u0012\u0002H\u00010\u0003B\u0013\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00018\u0000\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/facebook/common/closeables/AutoCloseableDelegate;",
        "T",
        "Ljava/io/Closeable;",
        "Lcom/facebook/common/closeables/AutoCleanupDelegate;",
        "initialValue",
        "<init>",
        "(Ljava/io/Closeable;)V",
        "fbcore_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, v0}, Lcom/facebook/common/closeables/AutoCloseableDelegate;-><init>(Ljava/io/Closeable;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/Closeable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 35
    invoke-static {}, Lcom/facebook/common/closeables/AutoCleanupDelegateKt;->access$getCloseableCleanupFunction$p()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/facebook/common/closeables/AutoCleanupDelegate;-><init>(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/io/Closeable;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 34
    :cond_0
    invoke-direct {p0, p1}, Lcom/facebook/common/closeables/AutoCloseableDelegate;-><init>(Ljava/io/Closeable;)V

    return-void
.end method
