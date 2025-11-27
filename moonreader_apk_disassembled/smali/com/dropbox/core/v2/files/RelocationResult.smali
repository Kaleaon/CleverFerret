.class public Lcom/dropbox/core/v2/files/RelocationResult;
.super Lcom/dropbox/core/v2/files/FileOpsResult;
.source "RelocationResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/RelocationResult$Serializer;
    }
.end annotation


# instance fields
.field protected final metadata:Lcom/dropbox/core/v2/files/Metadata;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/files/Metadata;)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/files/Metadata;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 35
    invoke-direct {p0}, Lcom/dropbox/core/v2/files/FileOpsResult;-><init>()V

    if-eqz p1, :cond_0

    .line 39
    iput-object p1, p0, Lcom/dropbox/core/v2/files/RelocationResult;->metadata:Lcom/dropbox/core/v2/files/Metadata;

    return-void

    .line 37
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'metadata\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
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

    .line 70
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 71
    check-cast p1, Lcom/dropbox/core/v2/files/RelocationResult;

    .line 72
    iget-object v2, p0, Lcom/dropbox/core/v2/files/RelocationResult;->metadata:Lcom/dropbox/core/v2/files/Metadata;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/RelocationResult;->metadata:Lcom/dropbox/core/v2/files/Metadata;

    if-eq v2, p1, :cond_3

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/Metadata;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    return v1

    :cond_3
    :goto_0
    return v0

    :cond_4
    return v1
.end method

.method public getMetadata()Lcom/dropbox/core/v2/files/Metadata;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 49
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationResult;->metadata:Lcom/dropbox/core/v2/files/Metadata;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 54
    iget-object v0, p0, Lcom/dropbox/core/v2/files/RelocationResult;->metadata:Lcom/dropbox/core/v2/files/Metadata;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 57
    invoke-super {p0}, Lcom/dropbox/core/v2/files/FileOpsResult;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 81
    sget-object v0, Lcom/dropbox/core/v2/files/RelocationResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RelocationResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 93
    sget-object v0, Lcom/dropbox/core/v2/files/RelocationResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/RelocationResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/RelocationResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
