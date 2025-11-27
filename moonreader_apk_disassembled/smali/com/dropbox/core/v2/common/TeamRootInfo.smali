.class public Lcom/dropbox/core/v2/common/TeamRootInfo;
.super Lcom/dropbox/core/v2/common/RootInfo;
.source "TeamRootInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/common/TeamRootInfo$Serializer;
    }
.end annotation


# instance fields
.field protected final homePath:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 49
    invoke-direct {p0, p1, p2}, Lcom/dropbox/core/v2/common/RootInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p3, :cond_0

    .line 53
    iput-object p3, p0, Lcom/dropbox/core/v2/common/TeamRootInfo;->homePath:Ljava/lang/String;

    return-void

    .line 51
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'homePath\' is null"

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

    .line 107
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 108
    check-cast p1, Lcom/dropbox/core/v2/common/TeamRootInfo;

    .line 109
    iget-object v2, p0, Lcom/dropbox/core/v2/common/TeamRootInfo;->rootNamespaceId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/common/TeamRootInfo;->rootNamespaceId:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lcom/dropbox/core/v2/common/TeamRootInfo;->rootNamespaceId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/common/TeamRootInfo;->rootNamespaceId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/common/TeamRootInfo;->homeNamespaceId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/common/TeamRootInfo;->homeNamespaceId:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    iget-object v2, p0, Lcom/dropbox/core/v2/common/TeamRootInfo;->homeNamespaceId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/common/TeamRootInfo;->homeNamespaceId:Ljava/lang/String;

    .line 110
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/common/TeamRootInfo;->homePath:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/common/TeamRootInfo;->homePath:Ljava/lang/String;

    if-eq v2, p1, :cond_5

    .line 111
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

.method public getHomeNamespaceId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 76
    iget-object v0, p0, Lcom/dropbox/core/v2/common/TeamRootInfo;->homeNamespaceId:Ljava/lang/String;

    return-object v0
.end method

.method public getHomePath()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 86
    iget-object v0, p0, Lcom/dropbox/core/v2/common/TeamRootInfo;->homePath:Ljava/lang/String;

    return-object v0
.end method

.method public getRootNamespaceId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 66
    iget-object v0, p0, Lcom/dropbox/core/v2/common/TeamRootInfo;->rootNamespaceId:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 91
    iget-object v0, p0, Lcom/dropbox/core/v2/common/TeamRootInfo;->homePath:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 94
    invoke-super {p0}, Lcom/dropbox/core/v2/common/RootInfo;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 121
    sget-object v0, Lcom/dropbox/core/v2/common/TeamRootInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/common/TeamRootInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/common/TeamRootInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 133
    sget-object v0, Lcom/dropbox/core/v2/common/TeamRootInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/common/TeamRootInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/common/TeamRootInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
