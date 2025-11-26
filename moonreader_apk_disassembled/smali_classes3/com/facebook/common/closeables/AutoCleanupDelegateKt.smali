.class public final Lcom/facebook/common/closeables/AutoCleanupDelegateKt;
.super Ljava/lang/Object;
.source "AutoCleanupDelegate.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\"\u001a\u0010\u0000\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0004"
    }
    d2 = {
        "closeableCleanupFunction",
        "Lkotlin/Function1;",
        "Ljava/io/Closeable;",
        "",
        "fbcore_release"
    }
    k = 0x2
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final closeableCleanupFunction:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/io/Closeable;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$M_UC7dQz6pXeIWyVdM1HI14-htc(Ljava/io/Closeable;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0}, Lcom/facebook/common/closeables/AutoCleanupDelegateKt;->closeableCleanupFunction$lambda$0(Ljava/io/Closeable;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 37
    new-instance v0, Lcom/facebook/common/closeables/AutoCleanupDelegateKt$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/facebook/common/closeables/AutoCleanupDelegateKt$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/facebook/common/closeables/AutoCleanupDelegateKt;->closeableCleanupFunction:Lkotlin/jvm/functions/Function1;

    return-void
.end method

.method public static final synthetic access$getCloseableCleanupFunction$p()Lkotlin/jvm/functions/Function1;
    .locals 1

    .line 1
    sget-object v0, Lcom/facebook/common/closeables/AutoCleanupDelegateKt;->closeableCleanupFunction:Lkotlin/jvm/functions/Function1;

    return-object v0
.end method

.method private static final closeableCleanupFunction$lambda$0(Ljava/io/Closeable;)Lkotlin/Unit;
    .locals 1

    const-string v0, "it"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    invoke-interface {p0}, Ljava/io/Closeable;->close()V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method
