.class public Lcom/dropbox/core/v2/files/LockFileResult;
.super Ljava/lang/Object;
.source "LockFileResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/LockFileResult$Serializer;
    }
.end annotation


# instance fields
.field protected final lock:Lcom/dropbox/core/v2/files/FileLock;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final metadata:Lcom/dropbox/core/v2/files/Metadata;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/files/Metadata;Lcom/dropbox/core/v2/files/FileLock;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/files/Metadata;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/files/FileLock;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 42
    iput-object p1, p0, Lcom/dropbox/core/v2/files/LockFileResult;->metadata:Lcom/dropbox/core/v2/files/Metadata;

    if-eqz p2, :cond_0

    .line 46
    iput-object p2, p0, Lcom/dropbox/core/v2/files/LockFileResult;->lock:Lcom/dropbox/core/v2/files/FileLock;

    return-void

    .line 44
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'lock\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 40
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'metadata\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

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

    .line 87
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 88
    check-cast p1, Lcom/dropbox/core/v2/files/LockFileResult;

    .line 89
    iget-object v2, p0, Lcom/dropbox/core/v2/files/LockFileResult;->metadata:Lcom/dropbox/core/v2/files/Metadata;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/LockFileResult;->metadata:Lcom/dropbox/core/v2/files/Metadata;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/Metadata;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/files/LockFileResult;->lock:Lcom/dropbox/core/v2/files/FileLock;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/LockFileResult;->lock:Lcom/dropbox/core/v2/files/FileLock;

    if-eq v2, p1, :cond_4

    .line 90
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/files/FileLock;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    :cond_5
    return v1
.end method

.method public getLock()Lcom/dropbox/core/v2/files/FileLock;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 66
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileResult;->lock:Lcom/dropbox/core/v2/files/FileLock;

    return-object v0
.end method

.method public getMetadata()Lcom/dropbox/core/v2/files/Metadata;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 56
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileResult;->metadata:Lcom/dropbox/core/v2/files/Metadata;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 71
    iget-object v0, p0, Lcom/dropbox/core/v2/files/LockFileResult;->metadata:Lcom/dropbox/core/v2/files/Metadata;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/LockFileResult;->lock:Lcom/dropbox/core/v2/files/FileLock;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 100
    sget-object v0, Lcom/dropbox/core/v2/files/LockFileResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/LockFileResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 112
    sget-object v0, Lcom/dropbox/core/v2/files/LockFileResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/LockFileResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/LockFileResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
