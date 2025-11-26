.class public final Lorg/apache/commons/vfs2/FileSystemOptions;
.super Ljava/lang/Object;
.source "FileSystemOptions.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;
    }
.end annotation


# instance fields
.field private final options:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 53
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/FileSystemOptions;-><init>(Ljava/util/Map;)V

    return-void
.end method

.method protected constructor <init>(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lorg/apache/commons/vfs2/FileSystemOptions;->options:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 3

    .line 225
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemOptions;

    new-instance v1, Ljava/util/TreeMap;

    iget-object v2, p0, Lorg/apache/commons/vfs2/FileSystemOptions;->options:Ljava/util/Map;

    invoke-direct {v1, v2}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    invoke-direct {v0, v1}, Lorg/apache/commons/vfs2/FileSystemOptions;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public compareTo(Lorg/apache/commons/vfs2/FileSystemOptions;)I
    .locals 9

    const/4 v0, 0x0

    if-ne p0, p1, :cond_0

    return v0

    .line 144
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/vfs2/FileSystemOptions;->options:Ljava/util/Map;

    if-nez v1, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    .line 145
    :goto_0
    iget-object v2, p1, Lorg/apache/commons/vfs2/FileSystemOptions;->options:Ljava/util/Map;

    if-nez v2, :cond_2

    const/4 v2, 0x0

    goto :goto_1

    :cond_2
    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    :goto_1
    const/4 v3, -0x1

    if-ge v1, v2, :cond_3

    return v3

    :cond_3
    const/4 v4, 0x1

    if-le v1, v2, :cond_4

    return v4

    :cond_4
    if-nez v1, :cond_5

    return v0

    .line 158
    :cond_5
    iget-object v2, p0, Lorg/apache/commons/vfs2/FileSystemOptions;->options:Ljava/util/Map;

    instance-of v5, v2, Ljava/util/SortedMap;

    if-eqz v5, :cond_6

    check-cast v2, Ljava/util/SortedMap;

    goto :goto_2

    :cond_6
    new-instance v2, Ljava/util/TreeMap;

    iget-object v5, p0, Lorg/apache/commons/vfs2/FileSystemOptions;->options:Ljava/util/Map;

    invoke-direct {v2, v5}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    .line 161
    :goto_2
    iget-object v5, p1, Lorg/apache/commons/vfs2/FileSystemOptions;->options:Ljava/util/Map;

    instance-of v6, v5, Ljava/util/SortedMap;

    if-eqz v6, :cond_7

    check-cast v5, Ljava/util/SortedMap;

    goto :goto_3

    :cond_7
    new-instance v5, Ljava/util/TreeMap;

    iget-object p1, p1, Lorg/apache/commons/vfs2/FileSystemOptions;->options:Ljava/util/Map;

    invoke-direct {v5, p1}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    .line 164
    :goto_3
    invoke-interface {v2}, Ljava/util/SortedMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 165
    invoke-interface {v5}, Ljava/util/SortedMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 166
    :cond_8
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_9

    .line 167
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;

    invoke-virtual {v7, v8}, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;->compareTo(Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;)I

    move-result v7

    if-eqz v7, :cond_8

    return v7

    .line 173
    :cond_9
    new-array p1, v1, [Ljava/lang/Object;

    .line 174
    invoke-interface {v2}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->deepHashCode([Ljava/lang/Object;)I

    move-result v1

    .line 175
    invoke-interface {v5}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->deepHashCode([Ljava/lang/Object;)I

    move-result p1

    if-ge v1, p1, :cond_a

    return v3

    :cond_a
    if-le v1, p1, :cond_b

    return v4

    :cond_b
    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 211
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_2

    return v1

    .line 214
    :cond_2
    check-cast p1, Lorg/apache/commons/vfs2/FileSystemOptions;

    .line 215
    invoke-virtual {p0, p1}, Lorg/apache/commons/vfs2/FileSystemOptions;->compareTo(Lorg/apache/commons/vfs2/FileSystemOptions;)I

    move-result p1

    if-nez p1, :cond_3

    return v0

    :cond_3
    return v1
.end method

.method getOption(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 129
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;-><init>(Ljava/lang/Class;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions$1;)V

    .line 130
    iget-object p1, p0, Lorg/apache/commons/vfs2/FileSystemOptions;->options:Ljava/util/Map;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method hasOption(Ljava/lang/Class;Ljava/lang/String;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 134
    new-instance v0, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;-><init>(Ljava/lang/Class;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions$1;)V

    .line 135
    iget-object p1, p0, Lorg/apache/commons/vfs2/FileSystemOptions;->options:Ljava/util/Map;

    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public hashCode()I
    .locals 3

    .line 191
    iget-object v0, p0, Lorg/apache/commons/vfs2/FileSystemOptions;->options:Ljava/util/Map;

    const/16 v1, 0x1f

    if-nez v0, :cond_0

    return v1

    .line 194
    :cond_0
    instance-of v2, v0, Ljava/util/SortedMap;

    if-eqz v2, :cond_1

    check-cast v0, Ljava/util/SortedMap;

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/util/TreeMap;

    iget-object v2, p0, Lorg/apache/commons/vfs2/FileSystemOptions;->options:Ljava/util/Map;

    invoke-direct {v0, v2}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    .line 197
    :goto_0
    invoke-interface {v0}, Ljava/util/SortedMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->hashCode()I

    move-result v2

    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    .line 198
    invoke-interface {v0}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/vfs2/FileSystemOptions;->options:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->deepHashCode([Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v2, v0

    return v2
.end method

.method setOption(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 125
    iget-object v0, p0, Lorg/apache/commons/vfs2/FileSystemOptions;->options:Ljava/util/Map;

    new-instance v1, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lorg/apache/commons/vfs2/FileSystemOptions$FileSystemOptionKey;-><init>(Ljava/lang/Class;Ljava/lang/String;Lorg/apache/commons/vfs2/FileSystemOptions$1;)V

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 230
    iget-object v0, p0, Lorg/apache/commons/vfs2/FileSystemOptions;->options:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
