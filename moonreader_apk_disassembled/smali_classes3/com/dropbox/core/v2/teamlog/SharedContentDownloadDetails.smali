.class public Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;
.super Ljava/lang/Object;
.source "SharedContentDownloadDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails$Serializer;
    }
.end annotation


# instance fields
.field protected final sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final sharedContentLink:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final sharedContentOwner:Lcom/dropbox/core/v2/teamlog/UserLogInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/dropbox/core/v2/sharing/AccessLevel;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/sharing/AccessLevel;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 72
    invoke-direct {p0, p1, p2, v0}, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/teamlog/UserLogInfo;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/teamlog/UserLogInfo;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/sharing/AccessLevel;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/teamlog/UserLogInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 51
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;->sharedContentLink:Ljava/lang/String;

    .line 52
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;->sharedContentOwner:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    if-eqz p2, :cond_0

    .line 56
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    return-void

    .line 54
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'sharedContentAccessLevel\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 49
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'sharedContentLink\' is null"

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

    .line 124
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 125
    check-cast p1, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;

    .line 126
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;->sharedContentLink:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;->sharedContentLink:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    if-eq v2, v3, :cond_3

    .line 127
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/sharing/AccessLevel;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;->sharedContentOwner:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;->sharedContentOwner:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    if-eq v2, p1, :cond_5

    if-eqz v2, :cond_4

    .line 128
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/UserLogInfo;->equals(Ljava/lang/Object;)Z

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

.method public getSharedContentAccessLevel()Lcom/dropbox/core/v2/sharing/AccessLevel;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    return-object v0
.end method

.method public getSharedContentLink()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;->sharedContentLink:Ljava/lang/String;

    return-object v0
.end method

.method public getSharedContentOwner()Lcom/dropbox/core/v2/teamlog/UserLogInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 102
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;->sharedContentOwner:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 107
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;->sharedContentLink:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;->sharedContentOwner:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

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

    .line 138
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 150
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/SharedContentDownloadDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
