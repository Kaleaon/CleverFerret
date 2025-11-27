.class Lorg/apache/commons/vfs2/util/CombinedResources$1;
.super Ljava/lang/Object;
.source "CombinedResources.java"

# interfaces
.implements Ljava/util/Enumeration;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/commons/vfs2/util/CombinedResources;->getKeys()Ljava/util/Enumeration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Enumeration<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/vfs2/util/CombinedResources;


# direct methods
.method constructor <init>(Lorg/apache/commons/vfs2/util/CombinedResources;)V
    .locals 0

    .line 102
    iput-object p1, p0, Lorg/apache/commons/vfs2/util/CombinedResources$1;->this$0:Lorg/apache/commons/vfs2/util/CombinedResources;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasMoreElements()Z
    .locals 1

    .line 105
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/CombinedResources$1;->this$0:Lorg/apache/commons/vfs2/util/CombinedResources;

    invoke-static {v0}, Lorg/apache/commons/vfs2/util/CombinedResources;->access$000(Lorg/apache/commons/vfs2/util/CombinedResources;)Ljava/util/Properties;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Properties;->keys()Ljava/util/Enumeration;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic nextElement()Ljava/lang/Object;
    .locals 1

    .line 102
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/util/CombinedResources$1;->nextElement()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public nextElement()Ljava/lang/String;
    .locals 1

    .line 111
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/CombinedResources$1;->this$0:Lorg/apache/commons/vfs2/util/CombinedResources;

    invoke-static {v0}, Lorg/apache/commons/vfs2/util/CombinedResources;->access$000(Lorg/apache/commons/vfs2/util/CombinedResources;)Ljava/util/Properties;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Properties;->keys()Ljava/util/Enumeration;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method
