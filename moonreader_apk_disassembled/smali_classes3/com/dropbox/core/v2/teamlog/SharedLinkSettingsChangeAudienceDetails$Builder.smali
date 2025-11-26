.class public Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;
.super Ljava/lang/Object;
.source "SharedLinkSettingsChangeAudienceDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final newValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

.field protected previousValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

.field protected final sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

.field protected sharedContentLink:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/LinkAudience;)V
    .locals 0

    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 153
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    if-eqz p2, :cond_0

    .line 157
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;->newValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

    const/4 p1, 0x0

    .line 158
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;->sharedContentLink:Ljava/lang/String;

    .line 159
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;->previousValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

    return-void

    .line 155
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'newValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 151
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'sharedContentAccessLevel\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;
    .locals 5

    .line 194
    new-instance v0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;->newValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;->sharedContentLink:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;->previousValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails;-><init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/LinkAudience;Ljava/lang/String;Lcom/dropbox/core/v2/sharing/LinkAudience;)V

    return-object v0
.end method

.method public withPreviousValue(Lcom/dropbox/core/v2/sharing/LinkAudience;)Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;
    .locals 0

    .line 182
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;->previousValue:Lcom/dropbox/core/v2/sharing/LinkAudience;

    return-object p0
.end method

.method public withSharedContentLink(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;
    .locals 0

    .line 170
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsChangeAudienceDetails$Builder;->sharedContentLink:Ljava/lang/String;

    return-object p0
.end method
