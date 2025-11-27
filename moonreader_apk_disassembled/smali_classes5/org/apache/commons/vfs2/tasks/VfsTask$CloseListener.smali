.class Lorg/apache/commons/vfs2/tasks/VfsTask$CloseListener;
.super Ljava/lang/Object;
.source "VfsTask.java"

# interfaces
.implements Lorg/apache/tools/ant/SubBuildListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/tasks/VfsTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CloseListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/vfs2/tasks/VfsTask;


# direct methods
.method private constructor <init>(Lorg/apache/commons/vfs2/tasks/VfsTask;)V
    .locals 0

    .line 66
    iput-object p1, p0, Lorg/apache/commons/vfs2/tasks/VfsTask$CloseListener;->this$0:Lorg/apache/commons/vfs2/tasks/VfsTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/commons/vfs2/tasks/VfsTask;Lorg/apache/commons/vfs2/tasks/VfsTask$1;)V
    .locals 0

    .line 66
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/tasks/VfsTask$CloseListener;-><init>(Lorg/apache/commons/vfs2/tasks/VfsTask;)V

    return-void
.end method


# virtual methods
.method public buildFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0

    .line 78
    iget-object p1, p0, Lorg/apache/commons/vfs2/tasks/VfsTask$CloseListener;->this$0:Lorg/apache/commons/vfs2/tasks/VfsTask;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/tasks/VfsTask;->closeManager()V

    return-void
.end method

.method public buildStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0

    return-void
.end method

.method public messageLogged(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0

    return-void
.end method

.method public subBuildFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0

    .line 73
    iget-object p1, p0, Lorg/apache/commons/vfs2/tasks/VfsTask$CloseListener;->this$0:Lorg/apache/commons/vfs2/tasks/VfsTask;

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/tasks/VfsTask;->closeManager()V

    return-void
.end method

.method public subBuildStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0

    return-void
.end method

.method public targetFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0

    return-void
.end method

.method public targetStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0

    return-void
.end method

.method public taskFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0

    return-void
.end method

.method public taskStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0

    return-void
.end method
