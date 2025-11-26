.class public Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;
.super Ljava/lang/Object;
.source "SharedLinkSettingsChangeExpirationDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails$Builder;
    }
.end annotation


# instance fields
.field protected final newValue:Ljava/util/Date;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final previousValue:Ljava/util/Date;
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
.method public constructor <init>(Lcom/dropbox/core/v2/sharing/AccessLevel;)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/sharing/AccessLevel;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 79
    invoke-direct {p0, p1, v0, v0, v0}, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;-><init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/sharing/AccessLevel;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 61
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    .line 62
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->sharedContentLink:Ljava/lang/String;

    .line 63
    invoke-static {p3}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->newValue:Ljava/util/Date;

    .line 64
    invoke-static {p4}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->previousValue:Ljava/util/Date;

    return-void

    .line 59
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'sharedContentAccessLevel\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Lcom/dropbox/core/v2/sharing/AccessLevel;)Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails$Builder;
    .locals 1

    .line 136
    new-instance v0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails$Builder;-><init>(Lcom/dropbox/core/v2/sharing/AccessLevel;)V

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

    .line 230
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 231
    check-cast p1, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;

    .line 232
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/sharing/AccessLevel;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->sharedContentLink:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->sharedContentLink:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    if-eqz v2, :cond_5

    .line 233
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->newValue:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->newValue:Ljava/util/Date;

    if-eq v2, v3, :cond_4

    if-eqz v2, :cond_5

    .line 234
    invoke-virtual {v2, v3}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->previousValue:Ljava/util/Date;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->previousValue:Ljava/util/Date;

    if-eq v2, p1, :cond_6

    if-eqz v2, :cond_5

    .line 235
    invoke-virtual {v2, p1}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

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

.method public getNewValue()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 110
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->newValue:Ljava/util/Date;

    return-object v0
.end method

.method public getPreviousValue()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 121
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->previousValue:Ljava/util/Date;

    return-object v0
.end method

.method public getSharedContentAccessLevel()Lcom/dropbox/core/v2/sharing/AccessLevel;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 89
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    return-object v0
.end method

.method public getSharedContentLink()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 99
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->sharedContentLink:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 212
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->sharedContentLink:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->newValue:Ljava/util/Date;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails;->previousValue:Ljava/util/Date;

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

    .line 245
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 257
    sget-object v0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeExpirationDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
