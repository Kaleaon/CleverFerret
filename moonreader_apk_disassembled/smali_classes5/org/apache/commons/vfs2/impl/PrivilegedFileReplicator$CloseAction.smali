.class Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$CloseAction;
.super Ljava/lang/Object;
.source "PrivilegedFileReplicator.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CloseAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedAction<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;


# direct methods
.method private constructor <init>(Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;)V
    .locals 0

    .line 159
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$CloseAction;->this$0:Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$1;)V
    .locals 0

    .line 159
    invoke-direct {p0, p1}, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$CloseAction;-><init>(Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;)V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .locals 1

    .line 165
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator$CloseAction;->this$0:Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;

    invoke-static {v0}, Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;->access$200(Lorg/apache/commons/vfs2/impl/PrivilegedFileReplicator;)Lorg/apache/commons/vfs2/provider/VfsComponent;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/vfs2/provider/VfsComponent;->close()V

    const/4 v0, 0x0

    return-object v0
.end method
