.class public Lcom/facebook/common/executors/UiThreadImmediateExecutorService;
.super Lcom/facebook/common/executors/HandlerExecutorServiceImpl;
.source "UiThreadImmediateExecutorService.java"


# static fields
.field private static sInstance:Lcom/facebook/common/executors/UiThreadImmediateExecutorService;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 27
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {p0, v0}, Lcom/facebook/common/executors/HandlerExecutorServiceImpl;-><init>(Landroid/os/Handler;)V

    return-void
.end method

.method public static getInstance()Lcom/facebook/common/executors/UiThreadImmediateExecutorService;
    .locals 1

    .line 31
    sget-object v0, Lcom/facebook/common/executors/UiThreadImmediateExecutorService;->sInstance:Lcom/facebook/common/executors/UiThreadImmediateExecutorService;

    if-nez v0, :cond_0

    .line 32
    new-instance v0, Lcom/facebook/common/executors/UiThreadImmediateExecutorService;

    invoke-direct {v0}, Lcom/facebook/common/executors/UiThreadImmediateExecutorService;-><init>()V

    sput-object v0, Lcom/facebook/common/executors/UiThreadImmediateExecutorService;->sInstance:Lcom/facebook/common/executors/UiThreadImmediateExecutorService;

    .line 34
    :cond_0
    sget-object v0, Lcom/facebook/common/executors/UiThreadImmediateExecutorService;->sInstance:Lcom/facebook/common/executors/UiThreadImmediateExecutorService;

    return-object v0
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 1

    .line 39
    invoke-virtual {p0}, Lcom/facebook/common/executors/UiThreadImmediateExecutorService;->isHandlerThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    .line 42
    :cond_0
    invoke-super {p0, p1}, Lcom/facebook/common/executors/HandlerExecutorServiceImpl;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
