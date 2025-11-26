.class final Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;
.super Ljava/lang/Object;
.source "FileSystemOptions.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/vfs2/FileSystemOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FileSystemOptionKey"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;",
        ">;"
    }
.end annotation


# static fields
.field private static final HASH:I = 0x1d


# instance fields
.field private final fileSystemClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ">;"
        }
    .end annotation
.end field

.field private final name:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p1, p0, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->fileSystemClass:Ljava/lang/Class;

    .line 77
    iput-object p2, p0, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->name:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Class;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions$1;)V
    .locals 0

    .line 63
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 63
    check-cast p1, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;

    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->compareTo(Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;)I

    move-result p1

    return p1
.end method

.method public compareTo(Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;)I
    .locals 2

    .line 82
    iget-object v0, p0, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->fileSystemClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->fileSystemClass:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    return v0

    .line 86
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->name:Ljava/lang/String;

    iget-object p1, p1, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->name:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_4

    .line 94
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_0

    .line 98
    :cond_1
    check-cast p1, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;

    .line 100
    iget-object v2, p0, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->fileSystemClass:Ljava/lang/Class;

    iget-object v3, p1, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->fileSystemClass:Ljava/lang/Class;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    return v1

    .line 103
    :cond_2
    iget-object v2, p0, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->name:Ljava/lang/String;

    iget-object p1, p1, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->name:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    return v1

    :cond_3
    return v0

    :cond_4
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 113
    iget-object v0, p0, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->fileSystemClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1d

    .line 114
    iget-object v1, p0, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->fileSystemClass:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
