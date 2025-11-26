.class public Lorg/apache/commons/vfs2/FileExtensionSelector;
.super Ljava/lang/Object;
.source "FileExtensionSelector.java"

# interfaces
.implements Lorg/apache/commons/vfs2/FileSelector;


# instance fields
.field private final extensions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/FileExtensionSelector;->extensions:Ljava/util/Set;

    if-eqz p1, :cond_0

    .line 50
    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    :cond_0
    return-void
.end method

.method public varargs constructor <init>([Ljava/lang/String;)V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/FileExtensionSelector;->extensions:Ljava/util/Set;

    if-eqz p1, :cond_0

    .line 61
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    :cond_0
    return-void
.end method


# virtual methods
.method public includeFile(Lorg/apache/commons/vfs2/FileSelectInfo;)Z
    .locals 4

    .line 73
    iget-object v0, p0, Lorg/apache/commons/vfs2/FileExtensionSelector;->extensions:Ljava/util/Set;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 76
    :cond_0
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 77
    invoke-interface {p1}, Lorg/apache/commons/vfs2/FileSelectInfo;->getFile()Lorg/apache/commons/vfs2/FileObject;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/commons/vfs2/FileObject;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/commons/vfs2/FileName;->getExtension()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_2
    return v1
.end method

.method public traverseDescendents(Lorg/apache/commons/vfs2/FileSelectInfo;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method
