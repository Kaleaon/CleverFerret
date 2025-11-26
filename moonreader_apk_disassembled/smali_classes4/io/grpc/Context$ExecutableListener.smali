.class Lio/grpc/Context$ExecutableListener;
.super Ljava/lang/Object;
.source "Context.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/Context;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExecutableListener"
.end annotation


# instance fields
.field private final executor:Ljava/util/concurrent/Executor;

.field private final listener:Lio/grpc/Context$CancellationListener;

.field final synthetic this$0:Lio/grpc/Context;


# direct methods
.method private constructor <init>(Lio/grpc/Context;Ljava/util/concurrent/Executor;Lio/grpc/Context$CancellationListener;)V
    .locals 0

    .line 984
    iput-object p1, p0, Lio/grpc/Context$ExecutableListener;->this$0:Lio/grpc/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 985
    iput-object p2, p0, Lio/grpc/Context$ExecutableListener;->executor:Ljava/util/concurrent/Executor;

    .line 986
    iput-object p3, p0, Lio/grpc/Context$ExecutableListener;->listener:Lio/grpc/Context$CancellationListener;

    return-void
.end method

.method synthetic constructor <init>(Lio/grpc/Context;Ljava/util/concurrent/Executor;Lio/grpc/Context$CancellationListener;Lio/grpc/Context$1;)V
    .locals 0

    .line 980
    invoke-direct {p0, p1, p2, p3}, Lio/grpc/Context$ExecutableListener;-><init>(Lio/grpc/Context;Ljava/util/concurrent/Executor;Lio/grpc/Context$CancellationListener;)V

    return-void
.end method

.method static synthetic access$400(Lio/grpc/Context$ExecutableListener;)V
    .locals 0

    .line 980
    invoke-direct {p0}, Lio/grpc/Context$ExecutableListener;->deliver()V

    return-void
.end method

.method static synthetic access$500(Lio/grpc/Context$ExecutableListener;)Lio/grpc/Context$CancellationListener;
    .locals 0

    .line 980
    iget-object p0, p0, Lio/grpc/Context$ExecutableListener;->listener:Lio/grpc/Context$CancellationListener;

    return-object p0
.end method

.method private deliver()V
    .locals 4

    .line 991
    :try_start_0
    iget-object v0, p0, Lio/grpc/Context$ExecutableListener;->executor:Ljava/util/concurrent/Executor;

    invoke-interface {v0, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 993
    invoke-static {}, Lio/grpc/Context;->access$700()Ljava/util/logging/Logger;

    move-result-object v1

    sget-object v2, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    const-string v3, "Exception notifying context listener"

    invoke-virtual {v1, v2, v3, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 999
    iget-object v0, p0, Lio/grpc/Context$ExecutableListener;->listener:Lio/grpc/Context$CancellationListener;

    iget-object v1, p0, Lio/grpc/Context$ExecutableListener;->this$0:Lio/grpc/Context;

    invoke-interface {v0, v1}, Lio/grpc/Context$CancellationListener;->cancelled(Lio/grpc/Context;)V

    return-void
.end method
