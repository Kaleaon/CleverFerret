.class public Lcom/dropbox/core/v2/files/SingleUserLock;
.super Ljava/lang/Object;
.source "SingleUserLock.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/SingleUserLock$Serializer;
    }
.end annotation


# instance fields
.field protected final created:Ljava/util/Date;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final lockHolderAccountId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final lockHolderTeamId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Date;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 78
    invoke-direct {p0, p1, p2, v0}, Lcom/dropbox/core/v2/files/SingleUserLock;-><init>(Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 50
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/files/SingleUserLock;->created:Ljava/util/Date;

    if-eqz p2, :cond_2

    .line 54
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    const/16 v0, 0x28

    if-lt p1, v0, :cond_1

    .line 57
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    if-gt p1, v0, :cond_0

    .line 60
    iput-object p2, p0, Lcom/dropbox/core/v2/files/SingleUserLock;->lockHolderAccountId:Ljava/lang/String;

    .line 61
    iput-object p3, p0, Lcom/dropbox/core/v2/files/SingleUserLock;->lockHolderTeamId:Ljava/lang/String;

    return-void

    .line 58
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'lockHolderAccountId\' is longer than 40"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 55
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'lockHolderAccountId\' is shorter than 40"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 52
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'lockHolderAccountId\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 48
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'created\' is null"

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

    .line 130
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 131
    check-cast p1, Lcom/dropbox/core/v2/files/SingleUserLock;

    .line 132
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SingleUserLock;->created:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/SingleUserLock;->created:Ljava/util/Date;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SingleUserLock;->lockHolderAccountId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/SingleUserLock;->lockHolderAccountId:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    .line 133
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SingleUserLock;->lockHolderTeamId:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/SingleUserLock;->lockHolderTeamId:Ljava/lang/String;

    if-eq v2, p1, :cond_5

    if-eqz v2, :cond_4

    .line 134
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    :cond_6
    return v1
.end method

.method public getCreated()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 88
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SingleUserLock;->created:Ljava/util/Date;

    return-object v0
.end method

.method public getLockHolderAccountId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 98
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SingleUserLock;->lockHolderAccountId:Ljava/lang/String;

    return-object v0
.end method

.method public getLockHolderTeamId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 108
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SingleUserLock;->lockHolderTeamId:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 113
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SingleUserLock;->created:Ljava/util/Date;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/SingleUserLock;->lockHolderAccountId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SingleUserLock;->lockHolderTeamId:Ljava/lang/String;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 144
    sget-object v0, Lcom/dropbox/core/v2/files/SingleUserLock$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SingleUserLock$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SingleUserLock$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 156
    sget-object v0, Lcom/dropbox/core/v2/files/SingleUserLock$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SingleUserLock$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SingleUserLock$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
