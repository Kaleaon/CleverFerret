.class Lcom/dropbox/core/v2/files/MoveBatchArg;
.super Lcom/dropbox/core/v2/files/RelocationBatchArgBase;
.source "MoveBatchArg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/MoveBatchArg$Serializer;,
        Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;
    }
.end annotation


# instance fields
.field protected final allowOwnershipTransfer:Z


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/RelocationPath;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 63
    invoke-direct {p0, p1, v0, v0}, Lcom/dropbox/core/v2/files/MoveBatchArg;-><init>(Ljava/util/List;ZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;ZZ)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/RelocationPath;",
            ">;ZZ)V"
        }
    .end annotation

    .line 45
    invoke-direct {p0, p1, p2}, Lcom/dropbox/core/v2/files/RelocationBatchArgBase;-><init>(Ljava/util/List;Z)V

    .line 46
    iput-boolean p3, p0, Lcom/dropbox/core/v2/files/MoveBatchArg;->allowOwnershipTransfer:Z

    return-void
.end method

.method public static newBuilder(Ljava/util/List;)Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/RelocationPath;",
            ">;)",
            "Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;"
        }
    .end annotation

    .line 113
    new-instance v0, Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/files/MoveBatchArg$Builder;-><init>(Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 219
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 220
    check-cast p1, Lcom/dropbox/core/v2/files/MoveBatchArg;

    .line 221
    iget-object v2, p0, Lcom/dropbox/core/v2/files/MoveBatchArg;->entries:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/MoveBatchArg;->entries:Ljava/util/List;

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lcom/dropbox/core/v2/files/MoveBatchArg;->entries:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/MoveBatchArg;->entries:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/MoveBatchArg;->autorename:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/files/MoveBatchArg;->autorename:Z

    if-ne v2, v3, :cond_3

    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/MoveBatchArg;->allowOwnershipTransfer:Z

    iget-boolean p1, p1, Lcom/dropbox/core/v2/files/MoveBatchArg;->allowOwnershipTransfer:Z

    if-ne v2, p1, :cond_3

    return v0

    :cond_3
    return v1
.end method

.method public getAllowOwnershipTransfer()Z
    .locals 1

    .line 96
    iget-boolean v0, p0, Lcom/dropbox/core/v2/files/MoveBatchArg;->allowOwnershipTransfer:Z

    return v0
.end method

.method public getAutorename()Z
    .locals 1

    .line 85
    iget-boolean v0, p0, Lcom/dropbox/core/v2/files/MoveBatchArg;->autorename:Z

    return v0
.end method

.method public getEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/RelocationPath;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/dropbox/core/v2/files/MoveBatchArg;->entries:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 203
    iget-boolean v0, p0, Lcom/dropbox/core/v2/files/MoveBatchArg;->allowOwnershipTransfer:Z

    .line 204
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    .line 203
    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 206
    invoke-super {p0}, Lcom/dropbox/core/v2/files/RelocationBatchArgBase;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 233
    sget-object v0, Lcom/dropbox/core/v2/files/MoveBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/MoveBatchArg$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/MoveBatchArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 245
    sget-object v0, Lcom/dropbox/core/v2/files/MoveBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/MoveBatchArg$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/MoveBatchArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
