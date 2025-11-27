.class Lcom/dropbox/core/v2/files/RelocationBatchArg;
.super Lcom/dropbox/core/v2/files/RelocationBatchArgBase;
.source "RelocationBatchArg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/RelocationBatchArg$Serializer;,
        Lcom/dropbox/core/v2/files/RelocationBatchArg$Builder;
    }
.end annotation


# instance fields
.field protected final allowOwnershipTransfer:Z

.field protected final allowSharedFolder:Z


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

    .line 66
    invoke-direct {p0, p1, v0, v0, v0}, Lcom/dropbox/core/v2/files/RelocationBatchArg;-><init>(Ljava/util/List;ZZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;ZZZ)V
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
            ">;ZZZ)V"
        }
    .end annotation

    .line 47
    invoke-direct {p0, p1, p2}, Lcom/dropbox/core/v2/files/RelocationBatchArgBase;-><init>(Ljava/util/List;Z)V

    .line 48
    iput-boolean p3, p0, Lcom/dropbox/core/v2/files/RelocationBatchArg;->allowSharedFolder:Z

    .line 49
    iput-boolean p4, p0, Lcom/dropbox/core/v2/files/RelocationBatchArg;->allowOwnershipTransfer:Z

    return-void
.end method

.method public static newBuilder(Ljava/util/List;)Lcom/dropbox/core/v2/files/RelocationBatchArg$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/RelocationPath;",
            ">;)",
            "Lcom/dropbox/core/v2/files/RelocationBatchArg$Builder;"
        }
    .end annotation

    .line 126
    new-instance v0, Lcom/dropbox/core/v2/files/RelocationBatchArg$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/files/RelocationBatchArg$Builder;-><init>(Ljava/util/List;)V

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

    .line 256
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 257
    check-cast p1, Lcom/dropbox/core/v2/files/RelocationBatchArg;

    .line 258
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchArg;->entries:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/RelocationBatchArg;->entries:Ljava/util/List;

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchArg;->entries:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/RelocationBatchArg;->entries:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchArg;->autorename:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/files/RelocationBatchArg;->autorename:Z

    if-ne v2, v3, :cond_3

    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchArg;->allowSharedFolder:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/files/RelocationBatchArg;->allowSharedFolder:Z

    if-ne v2, v3, :cond_3

    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/RelocationBatchArg;->allowOwnershipTransfer:Z

    iget-boolean p1, p1, Lcom/dropbox/core/v2/files/RelocationBatchArg;->allowOwnershipTransfer:Z

    if-ne v2, p1, :cond_3

    return v0

    :cond_3
    return v1
.end method

.method public getAllowOwnershipTransfer()Z
    .locals 1

    .line 109
    iget-boolean v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchArg;->allowOwnershipTransfer:Z

    return v0
.end method

.method public getAllowSharedFolder()Z
    .locals 1

    .line 98
    iget-boolean v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchArg;->allowSharedFolder:Z

    return v0
.end method

.method public getAutorename()Z
    .locals 1

    .line 88
    iget-boolean v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchArg;->autorename:Z

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

    .line 77
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchArg;->entries:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 239
    iget-boolean v0, p0, Lcom/dropbox/core/v2/files/RelocationBatchArg;->allowSharedFolder:Z

    .line 240
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-boolean v1, p0, Lcom/dropbox/core/v2/files/RelocationBatchArg;->allowOwnershipTransfer:Z

    .line 241
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    .line 239
    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 243
    invoke-super {p0}, Lcom/dropbox/core/v2/files/RelocationBatchArgBase;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 271
    sget-object v0, Lcom/dropbox/core/v2/files/RelocationBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchArg$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 283
    sget-object v0, Lcom/dropbox/core/v2/files/RelocationBatchArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationBatchArg$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RelocationBatchArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
