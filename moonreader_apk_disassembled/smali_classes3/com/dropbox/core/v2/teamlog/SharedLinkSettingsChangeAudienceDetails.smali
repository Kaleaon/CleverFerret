.class public Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;
.super Ljava/lang/Object;
.source "SharedLinkSettingsChangeAudienceDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;
    }
.end annotation


# instance fields
.field protected final newValue:Lcom/dropbox/core/v2/sharing/LinkAudience;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final previousValue:Lcom/dropbox/core/v2/sharing/LinkAudience;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final sharedContentLink:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/LinkAudience;)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/sharing/AccessLevel;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/sharing/LinkAudience;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 80
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;-><init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/LinkAudience;Ljava/lang/String;Lcom/dropbox/core/v2/sharing/LinkAudience;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/LinkAudience;Ljava/lang/String;Lcom/dropbox/core/v2/sharing/LinkAudience;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/sharing/AccessLevel;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/sharing/LinkAudience;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/sharing/LinkAudience;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 58
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    .line 59
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->sharedContentLink:Ljava/lang/String;

    if-eqz p2, :cond_0

    .line 63
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->newValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

    .line 64
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->previousValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

    return-void

    .line 61
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'newValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 56
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'sharedContentAccessLevel\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/LinkAudience;)Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;
    .locals 1

    .line 136
    new-instance v0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;-><init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/LinkAudience;)V

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

    .line 218
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 219
    check-cast p1, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;

    .line 220
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/sharing/AccessLevel;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->newValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->newValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

    if-eq v2, v3, :cond_3

    .line 221
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/sharing/LinkAudience;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->sharedContentLink:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->sharedContentLink:Ljava/lang/String;

    if-eq v2, v3, :cond_4

    if-eqz v2, :cond_5

    .line 222
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->previousValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->previousValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

    if-eq v2, p1, :cond_6

    if-eqz v2, :cond_5

    .line 223
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/LinkAudience;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getNewValue()Lcom/dropbox/core/v2/sharing/LinkAudience;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 100
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->newValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

    return-object v0
.end method

.method public getPreviousValue()Lcom/dropbox/core/v2/sharing/LinkAudience;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 120
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->previousValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

    return-object v0
.end method

.method public getSharedContentAccessLevel()Lcom/dropbox/core/v2/sharing/AccessLevel;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 90
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    return-object v0
.end method

.method public getSharedContentLink()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 110
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->sharedContentLink:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 200
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->sharedContentLink:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->newValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;->previousValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 233
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 245
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
