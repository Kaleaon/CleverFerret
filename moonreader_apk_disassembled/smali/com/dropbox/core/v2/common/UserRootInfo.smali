.class public Lcom/dropbox/core/v2/common/UserRootInfo;
.super Lcom/dropbox/core/v2/common/RootInfo;
.source "UserRootInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/common/UserRootInfo$Serializer;
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 45
    invoke-direct {p0, p1, p2}, Lcom/dropbox/core/v2/common/RootInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
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

    .line 86
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 87
    check-cast p1, Lcom/dropbox/core/v2/common/UserRootInfo;

    .line 88
    iget-object v2, p0, Lcom/dropbox/core/v2/common/UserRootInfo;->rootNamespaceId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/common/UserRootInfo;->rootNamespaceId:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lcom/dropbox/core/v2/common/UserRootInfo;->rootNamespaceId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/common/UserRootInfo;->rootNamespaceId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/common/UserRootInfo;->homeNamespaceId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/common/UserRootInfo;->homeNamespaceId:Ljava/lang/String;

    if-eq v2, v3, :cond_4

    iget-object v2, p0, Lcom/dropbox/core/v2/common/UserRootInfo;->homeNamespaceId:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/common/UserRootInfo;->homeNamespaceId:Ljava/lang/String;

    .line 89
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public getHomeNamespaceId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 68
    iget-object v0, p0, Lcom/dropbox/core/v2/common/UserRootInfo;->homeNamespaceId:Ljava/lang/String;

    return-object v0
.end method

.method public getRootNamespaceId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 58
    iget-object v0, p0, Lcom/dropbox/core/v2/common/UserRootInfo;->rootNamespaceId:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 74
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 99
    sget-object v0, Lcom/dropbox/core/v2/common/UserRootInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/common/UserRootInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/common/UserRootInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 111
    sget-object v0, Lcom/dropbox/core/v2/common/UserRootInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/common/UserRootInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/common/UserRootInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
