.class Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$ReplicateAction;
.super Ljava/lang/Object;
.source "PrivilegedFileReplicator.java"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReplicateAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedExceptionAction<",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# instance fields
.field private final selector:Lorg/apache/commons/vfs2/FileSelector;

.field private final srcFile:Lorg/apache/commons/vfs2/FileObject;

.field final synthetic this$0:Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;


# direct methods
.method public constructor <init>(Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)V
    .locals 0

    .line 138
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$ReplicateAction;->this$0:Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    iput-object p2, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$ReplicateAction;->srcFile:Lorg/apache/commons/vfs2/FileObject;

    .line 140
    iput-object p3, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$ReplicateAction;->selector:Lorg/apache/commons/vfs2/FileSelector;

    return-void
.end method


# virtual methods
.method public run()Ljava/io/File;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 152
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$ReplicateAction;->this$0:Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;

    invoke-static {v0}, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;->access$300(Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;)Lorg/apache/commons/vfs2/provider/FileReplicator;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$ReplicateAction;->srcFile:Lorg/apache/commons/vfs2/FileObject;

    iget-object v2, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$ReplicateAction;->selector:Lorg/apache/commons/vfs2/FileSelector;

    invoke-interface {v0, v1, v2}, Lorg/apache/commons/vfs2/provider/FileReplicator;->replicateFile(Lorg/apache/commons/vfs2/FileObject;Lorg/apache/commons/vfs2/FileSelector;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 134
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$ReplicateAction;->run()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method
