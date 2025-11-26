.class Lorg/apache/commons/vfs2/provider/FileSystemKey;
.super Ljava/lang/Object;
.source "FileSystemKey.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lorg/apache/commons/vfs2/provider/FileSystemKey;",
        ">;"
    }
.end annotation


# static fields
.field private static final EMPTY_OPTIONS:Lorg/apache/commons/vfs2/FileSystemOptions;


# instance fields
.field private final fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

.field private final key:Ljava/lang/Comparable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Comparable<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemOptions;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/FileSystemOptions;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/provider/FileSystemKey;->EMPTY_OPTIONS:Lorg/apache/commons/vfs2/FileSystemOptions;

    return-void
.end method

.method constructor <init>(Ljava/lang/Comparable;Lorg/apache/commons/vfs2/FileSystemOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Comparable<",
            "*>;",
            "Lorg/apache/commons/vfs2/FileSystemOptions;",
            ")V"
        }
    .end annotation

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/FileSystemKey;->key:Ljava/lang/Comparable;

    if-eqz p2, :cond_0

    .line 40
    iput-object p2, p0, Lorg/apache/commons/vfs2/provider/FileSystemKey;->fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    return-void

    .line 42
    :cond_0
    sget-object p1, Lorg/apache/commons/vfs2/provider/FileSystemKey;->EMPTY_OPTIONS:Lorg/apache/commons/vfs2/FileSystemOptions;

    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/FileSystemKey;->fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 24
    check-cast p1, Lorg/apache/commons/vfs2/provider/FileSystemKey;

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/provider/FileSystemKey;->compareTo(Lorg/apache/commons/vfs2/provider/FileSystemKey;)I

    move-result p1

    return p1
.end method

.method public compareTo(Lorg/apache/commons/vfs2/provider/FileSystemKey;)I
    .locals 2

    .line 49
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/FileSystemKey;->key:Ljava/lang/Comparable;

    .line 50
    iget-object v1, p1, Lorg/apache/commons/vfs2/provider/FileSystemKey;->key:Ljava/lang/Comparable;

    invoke-interface {v0, v1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-eqz v0, :cond_0

    return v0

    .line 56
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/FileSystemKey;->fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    iget-object p1, p1, Lorg/apache/commons/vfs2/provider/FileSystemKey;->fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    invoke-virtual {v0, p1}, Lorg/apache/commons/vfs2/FileSystemOptions;->compareTo(Lorg/apache/commons/vfs2/FileSystemOptions;)I

    move-result p1

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " [key="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/FileSystemKey;->key:Ljava/lang/Comparable;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", fileSystemOptions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/FileSystemKey;->fileSystemOptions:Lorg/apache/commons/vfs2/FileSystemOptions;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
