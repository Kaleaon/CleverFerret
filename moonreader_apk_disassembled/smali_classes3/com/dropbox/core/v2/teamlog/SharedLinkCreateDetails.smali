.class public Lcom/dropbox/core/v2/teamlog/SharedLinkCreateDetails;
.super Ljava/lang/Object;
.source "SharedLinkCreateDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/SharedLinkCreateDetails$Serializer;
    }
.end annotation


# instance fields
.field protected final sharedLinkAccessLevel:Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, v0}, Lcom/dropbox/core/v2/teamlog/SharedLinkCreateDetails;-><init>(Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkCreateDetails;->sharedLinkAccessLevel:Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;

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

    .line 78
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 79
    check-cast p1, Lcom/dropbox/core/v2/teamlog/SharedLinkCreateDetails;

    .line 80
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkCreateDetails;->sharedLinkAccessLevel:Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/SharedLinkCreateDetails;->sharedLinkAccessLevel:Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;

    if-eq v2, p1, :cond_3

    if-eqz v2, :cond_2

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;->equals(Ljava/lang/Object;)Z

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

.method public getSharedLinkAccessLevel()Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 58
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkCreateDetails;->sharedLinkAccessLevel:Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 63
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkCreateDetails;->sharedLinkAccessLevel:Lcom/dropbox/core/v2/teamlog/SharedLinkAccessLevel;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 89
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedLinkCreateDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedLinkCreateDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/SharedLinkCreateDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 101
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedLinkCreateDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedLinkCreateDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/SharedLinkCreateDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
