.class final Lio/opencensus/trace/CurrentSpanUtils;
.super Ljava/lang/Object;
.source "CurrentSpanUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/opencensus/trace/CurrentSpanUtils$CallableInSpan;,
        Lio/opencensus/trace/CurrentSpanUtils$RunnableInSpan;,
        Lio/opencensus/trace/CurrentSpanUtils$ScopeInSpan;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$300(Lio/opencensus/trace/Span;Ljava/lang/Throwable;)V
    .locals 0

    .line 26
    invoke-static {p0, p1}, Lio/opencensus/trace/CurrentSpanUtils;->setErrorStatus(Lio/opencensus/trace/Span;Ljava/lang/Throwable;)V

    return-void
.end method

.method static getCurrentSpan()Lio/opencensus/trace/Span;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 37
    invoke-static {}, Lio/grpc/Context;->current()Lio/grpc/Context;

    move-result-object v0

    invoke-static {v0}, Lio/opencensus/trace/unsafe/ContextUtils;->getValue(Lio/grpc/Context;)Lio/opencensus/trace/Span;

    move-result-object v0

    return-object v0
.end method

.method private static setErrorStatus(Lio/opencensus/trace/Span;Ljava/lang/Throwable;)V
    .locals 2

    .line 174
    sget-object v0, Lio/opencensus/trace/Status;->UNKNOWN:Lio/opencensus/trace/Status;

    .line 176
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    .line 175
    :goto_0
    invoke-virtual {v0, p1}, Lio/opencensus/trace/Status;->withDescription(Ljava/lang/String;)Lio/opencensus/trace/Status;

    move-result-object p1

    .line 174
    invoke-virtual {p0, p1}, Lio/opencensus/trace/Span;->setStatus(Lio/opencensus/trace/Status;)V

    return-void
.end method

.method static withSpan(Lio/opencensus/trace/Span;Z)Lio/opencensus/common/Scope;
    .locals 2

    .line 52
    new-instance v0, Lio/opencensus/trace/CurrentSpanUtils$ScopeInSpan;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lio/opencensus/trace/CurrentSpanUtils$ScopeInSpan;-><init>(Lio/opencensus/trace/Span;ZLio/opencensus/trace/CurrentSpanUtils$1;)V

    return-object v0
.end method

.method static withSpan(Lio/opencensus/trace/Span;ZLjava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 2

    .line 64
    new-instance v0, Lio/opencensus/trace/CurrentSpanUtils$RunnableInSpan;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, p1, v1}, Lio/opencensus/trace/CurrentSpanUtils$RunnableInSpan;-><init>(Lio/opencensus/trace/Span;Ljava/lang/Runnable;ZLio/opencensus/trace/CurrentSpanUtils$1;)V

    return-object v0
.end method

.method static withSpan(Lio/opencensus/trace/Span;ZLjava/util/concurrent/Callable;)Ljava/util/concurrent/Callable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/opencensus/trace/Span;",
            "Z",
            "Ljava/util/concurrent/Callable<",
            "TC;>;)",
            "Ljava/util/concurrent/Callable<",
            "TC;>;"
        }
    .end annotation

    .line 76
    new-instance v0, Lio/opencensus/trace/CurrentSpanUtils$CallableInSpan;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, p1, v1}, Lio/opencensus/trace/CurrentSpanUtils$CallableInSpan;-><init>(Lio/opencensus/trace/Span;Ljava/util/concurrent/Callable;ZLio/opencensus/trace/CurrentSpanUtils$1;)V

    return-object v0
.end method
