.class Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;
.super Ljava/lang/Object;
.source "VfsTask.java"

# interfaces
.implements Lorg/apache/commons/logging/Log;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/tasks/VfsTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AntLogger"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/vfs2/tasks/VfsTask;


# direct methods
.method private constructor <init>(Lorg/apache/commons/vfs2/tasks/VfsTask;)V
    .locals 0

    .line 109
    iput-object p1, p0, Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;->this$0:Lorg/apache/commons/vfs2/tasks/VfsTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/commons/vfs2/tasks/VfsTask;Lorg/apache/commons/vfs2/tasks/VfsTask$1;)V
    .locals 0

    .line 109
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;-><init>(Lorg/apache/commons/vfs2/tasks/VfsTask;)V

    return-void
.end method


# virtual methods
.method public debug(Ljava/lang/Object;)V
    .locals 2

    .line 112
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;->this$0:Lorg/apache/commons/vfs2/tasks/VfsTask;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x4

    invoke-virtual {v0, p1, v1}, Lorg/apache/commons/vfs2/tasks/VfsTask;->log(Ljava/lang/String;I)V

    return-void
.end method

.method public debug(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 0

    .line 117
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;->debug(Ljava/lang/Object;)V

    return-void
.end method

.method public error(Ljava/lang/Object;)V
    .locals 2

    .line 122
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;->this$0:Lorg/apache/commons/vfs2/tasks/VfsTask;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lorg/apache/commons/vfs2/tasks/VfsTask;->log(Ljava/lang/String;I)V

    return-void
.end method

.method public error(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 0

    .line 127
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;->error(Ljava/lang/Object;)V

    return-void
.end method

.method public fatal(Ljava/lang/Object;)V
    .locals 2

    .line 132
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;->this$0:Lorg/apache/commons/vfs2/tasks/VfsTask;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lorg/apache/commons/vfs2/tasks/VfsTask;->log(Ljava/lang/String;I)V

    return-void
.end method

.method public fatal(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 0

    .line 137
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;->fatal(Ljava/lang/Object;)V

    return-void
.end method

.method public info(Ljava/lang/Object;)V
    .locals 2

    .line 142
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;->this$0:Lorg/apache/commons/vfs2/tasks/VfsTask;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x2

    invoke-virtual {v0, p1, v1}, Lorg/apache/commons/vfs2/tasks/VfsTask;->log(Ljava/lang/String;I)V

    return-void
.end method

.method public info(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 0

    .line 147
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;->info(Ljava/lang/Object;)V

    return-void
.end method

.method public isDebugEnabled()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isErrorEnabled()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isFatalEnabled()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isInfoEnabled()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isTraceEnabled()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isWarnEnabled()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public trace(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public trace(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 0

    return-void
.end method

.method public warn(Ljava/lang/Object;)V
    .locals 2

    .line 160
    iget-object v0, p0, Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;->this$0:Lorg/apache/commons/vfs2/tasks/VfsTask;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lorg/apache/commons/vfs2/tasks/VfsTask;->log(Ljava/lang/String;I)V

    return-void
.end method

.method public warn(Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 0

    .line 165
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/tasks/VfsTask$AntLogger;->warn(Ljava/lang/Object;)V

    return-void
.end method
