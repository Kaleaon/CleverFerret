.class Lorg/apache/commons/vfs2/provider/ram/RamFileData;
.super Ljava/lang/Object;
.source "RamFileData.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field static final EMPTY:[B

.field private static final serialVersionUID:J = 0x132b858L


# instance fields
.field private final children:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/provider/ram/RamFileData;",
            ">;"
        }
    .end annotation
.end field

.field private content:[B

.field private lastModified:J

.field private name:Lorg/apache/commons/vfs2/FileName;

.field private type:Lorg/apache/commons/vfs2/FileType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 32
    new-array v0, v0, [B

    sput-object v0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->EMPTY:[B

    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/vfs2/FileName;)V
    .locals 1

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->children:Ljava/util/Collection;

    .line 72
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->clear()V

    if-eqz p1, :cond_0

    .line 76
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->name:Lorg/apache/commons/vfs2/FileName;

    return-void

    .line 74
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "name can not be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method addChild(Lorg/apache/commons/vfs2/provider/ram/RamFileData;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 160
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p1, :cond_1

    .line 168
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->children:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 172
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->children:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 173
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->updateLastModified()V

    return-void

    .line 169
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Child already exists. "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 165
    :cond_1
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "No child can be null"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 161
    :cond_2
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "A child can only be added in a folder"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method clear()V
    .locals 1

    .line 125
    sget-object v0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->EMPTY:[B

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->content:[B

    .line 126
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->updateLastModified()V

    .line 127
    sget-object v0, Lorg/apache/commons/vfs2/FileType;->IMAGINARY:Lorg/apache/commons/vfs2/FileType;

    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->type:Lorg/apache/commons/vfs2/FileType;

    .line 128
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->children:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    const/4 v0, 0x0

    .line 129
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->name:Lorg/apache/commons/vfs2/FileName;

    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 213
    :cond_0
    instance-of v0, p1, Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    .line 216
    :cond_1
    check-cast p1, Lorg/apache/commons/vfs2/provider/ram/RamFileData;

    .line 217
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method getChildren()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/provider/ram/RamFileData;",
            ">;"
        }
    .end annotation

    .line 197
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->name:Lorg/apache/commons/vfs2/FileName;

    if-eqz v0, :cond_0

    .line 200
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->children:Ljava/util/Collection;

    return-object v0

    .line 198
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Data is clear"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getContent()[B
    .locals 1

    .line 83
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->content:[B

    return-object v0
.end method

.method getLastModified()J
    .locals 2

    .line 98
    iget-wide v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->lastModified:J

    return-wide v0
.end method

.method getName()Lorg/apache/commons/vfs2/FileName;
    .locals 1

    .line 140
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->name:Lorg/apache/commons/vfs2/FileName;

    return-object v0
.end method

.method getType()Lorg/apache/commons/vfs2/FileType;
    .locals 1

    .line 112
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->type:Lorg/apache/commons/vfs2/FileType;

    return-object v0
.end method

.method hasChildren(Lorg/apache/commons/vfs2/provider/ram/RamFileData;)Z
    .locals 1

    .line 231
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->children:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public hashCode()I
    .locals 1

    .line 227
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getName()Lorg/apache/commons/vfs2/FileName;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method removeChild(Lorg/apache/commons/vfs2/provider/ram/RamFileData;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 183
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->getType()Lorg/apache/commons/vfs2/FileType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/vfs2/FileType;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 186
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->children:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 189
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->children:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 190
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->updateLastModified()V

    return-void

    .line 187
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Child not found. "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 184
    :cond_1
    new-instance p1, Lorg/apache/commons/vfs2/FileSystemException;

    const-string v0, "A child can only be removed from a folder"

    invoke-direct {p1, v0}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method resize(J)V
    .locals 4

    const-wide/32 v0, 0x7fffffff

    const/4 v2, 0x0

    cmp-long v3, p1, v0

    if-gtz v3, :cond_0

    long-to-int p2, p1

    .line 253
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->size()I

    move-result p1

    .line 254
    new-array v0, p2, [B

    .line 255
    iget-object v1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->content:[B

    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v1, v2, v0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 256
    iput-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->content:[B

    .line 257
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->updateLastModified()V

    return-void

    .line 249
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 250
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const p2, 0x7fffffff

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p2, v1, p1

    const-string p1, "newSize(%d) > Integer.MAX_VALUE(%d)"

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setContent([B)V
    .locals 0

    .line 90
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->updateLastModified()V

    .line 91
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->content:[B

    return-void
.end method

.method setLastModified(J)V
    .locals 0

    .line 105
    iput-wide p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->lastModified:J

    return-void
.end method

.method setType(Lorg/apache/commons/vfs2/FileType;)V
    .locals 0

    .line 119
    iput-object p1, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->type:Lorg/apache/commons/vfs2/FileType;

    return-void
.end method

.method size()I
    .locals 1

    .line 238
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->content:[B

    array-length v0, v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 150
    iget-object v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->name:Lorg/apache/commons/vfs2/FileName;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method updateLastModified()V
    .locals 2

    .line 133
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/vfs2/provider/ram/RamFileData;->lastModified:J

    return-void
.end method
