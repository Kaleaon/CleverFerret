.class public Lorg/apache/commons/vfs2/util/PosixPermissions;
.super Ljava/lang/Object;
.source "PosixPermissions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/util/PosixPermissions$Type;
    }
.end annotation


# instance fields
.field private final isInGroup:Z

.field private final isOwner:Z

.field private final permissions:I


# direct methods
.method public constructor <init>(IZZ)V
    .locals 0

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    iput p1, p0, Lorg/apache/commons/vfs2/util/PosixPermissions;->permissions:I

    .line 123
    iput-boolean p2, p0, Lorg/apache/commons/vfs2/util/PosixPermissions;->isOwner:Z

    .line 124
    iput-boolean p3, p0, Lorg/apache/commons/vfs2/util/PosixPermissions;->isInGroup:Z

    return-void
.end method

.method private computeNewPermissions(Ljava/util/Map;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lorg/apache/commons/vfs2/util/PosixPermissions$Type;",
            "Ljava/lang/Boolean;",
            ">;)I"
        }
    .end annotation

    .line 134
    iget v0, p0, Lorg/apache/commons/vfs2/util/PosixPermissions;->permissions:I

    .line 135
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 136
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    .line 137
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 138
    invoke-virtual {v2}, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->getMask()I

    move-result v1

    or-int/2addr v0, v1

    goto :goto_0

    .line 140
    :cond_0
    invoke-virtual {v2}, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->getMask()I

    move-result v1

    not-int v1, v1

    and-int/2addr v0, v1

    goto :goto_0

    :cond_1
    return v0
.end method

.method private get(Lorg/apache/commons/vfs2/util/PosixPermissions$Type;)Z
    .locals 1

    .line 152
    invoke-virtual {p1}, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->getMask()I

    move-result p1

    iget v0, p0, Lorg/apache/commons/vfs2/util/PosixPermissions;->permissions:I

    and-int/2addr p1, v0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method public getPermissions()I
    .locals 1

    .line 161
    iget v0, p0, Lorg/apache/commons/vfs2/util/PosixPermissions;->permissions:I

    return v0
.end method

.method public isExecutable()Z
    .locals 1

    .line 170
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/util/PosixPermissions;->isOwner:Z

    if-eqz v0, :cond_0

    .line 171
    sget-object v0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->UserExecutable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->get(Lorg/apache/commons/vfs2/util/PosixPermissions$Type;)Z

    move-result v0

    return v0

    .line 173
    :cond_0
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/util/PosixPermissions;->isInGroup:Z

    if-eqz v0, :cond_1

    .line 174
    sget-object v0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->GroupExecutable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->get(Lorg/apache/commons/vfs2/util/PosixPermissions$Type;)Z

    move-result v0

    return v0

    .line 176
    :cond_1
    sget-object v0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->OtherExecutable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->get(Lorg/apache/commons/vfs2/util/PosixPermissions$Type;)Z

    move-result v0

    return v0
.end method

.method public isReadable()Z
    .locals 1

    .line 185
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/util/PosixPermissions;->isOwner:Z

    if-eqz v0, :cond_0

    .line 186
    sget-object v0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->UserReadable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->get(Lorg/apache/commons/vfs2/util/PosixPermissions$Type;)Z

    move-result v0

    return v0

    .line 188
    :cond_0
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/util/PosixPermissions;->isInGroup:Z

    if-eqz v0, :cond_1

    .line 189
    sget-object v0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->GroupReadable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->get(Lorg/apache/commons/vfs2/util/PosixPermissions$Type;)Z

    move-result v0

    return v0

    .line 191
    :cond_1
    sget-object v0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->OtherReadable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->get(Lorg/apache/commons/vfs2/util/PosixPermissions$Type;)Z

    move-result v0

    return v0
.end method

.method public isWritable()Z
    .locals 1

    .line 200
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/util/PosixPermissions;->isOwner:Z

    if-eqz v0, :cond_0

    .line 201
    sget-object v0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->UserWritable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->get(Lorg/apache/commons/vfs2/util/PosixPermissions$Type;)Z

    move-result v0

    return v0

    .line 203
    :cond_0
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/util/PosixPermissions;->isInGroup:Z

    if-eqz v0, :cond_1

    .line 204
    sget-object v0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->GroupWritable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->get(Lorg/apache/commons/vfs2/util/PosixPermissions$Type;)Z

    move-result v0

    return v0

    .line 206
    :cond_1
    sget-object v0, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->OtherWritable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->get(Lorg/apache/commons/vfs2/util/PosixPermissions$Type;)Z

    move-result v0

    return v0
.end method

.method public makeExecutable(ZZ)I
    .locals 3

    .line 217
    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 218
    sget-object v1, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->UserExecutable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p2, :cond_0

    .line 220
    sget-object p2, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->GroupExecutable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    sget-object p2, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->OtherExecutable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    :cond_0
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->computeNewPermissions(Ljava/util/Map;)I

    move-result p1

    return p1
.end method

.method public makeReadable(ZZ)Ljava/lang/Integer;
    .locals 3

    .line 234
    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 235
    sget-object v1, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->UserReadable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p2, :cond_0

    .line 237
    sget-object p2, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->GroupReadable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    sget-object p2, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->OtherReadable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    :cond_0
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->computeNewPermissions(Ljava/util/Map;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public makeWritable(ZZ)Ljava/lang/Integer;
    .locals 3

    .line 251
    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 252
    sget-object v1, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->UserWritable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p2, :cond_0

    .line 254
    sget-object p2, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->GroupWritable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    sget-object p2, Lorg/apache/commons/vfs2/util/PosixPermissions$Type;->OtherWritable:Lorg/apache/commons/vfs2/util/PosixPermissions$Type;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    :cond_0
    invoke-direct {p0, v0}, Lorg/apache/commons/vfs2/util/PosixPermissions;->computeNewPermissions(Ljava/util/Map;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method
