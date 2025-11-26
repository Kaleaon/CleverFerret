.class public Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsAddExpirationDetails$Builder;
.super Ljava/lang/Object;
.source "SharedLinkSettingsAddExpirationDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsAddExpirationDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected newValue:Ljava/util/Date;

.field protected final sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

.field protected sharedContentLink:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/sharing/AccessLevel;)V
    .locals 1

    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 136
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsAddExpirationDetails$Builder;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    const/4 p1, 0x0

    .line 137
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsAddExpirationDetails$Builder;->sharedContentLink:Ljava/lang/String;

    .line 138
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsAddExpirationDetails$Builder;->newValue:Ljava/util/Date;

    return-void

    .line 134
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'sharedContentAccessLevel\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsAddExpirationDetails;
    .locals 4

    .line 174
    new-instance v0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsAddExpirationDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsAddExpirationDetails$Builder;->sharedContentAccessLevel:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsAddExpirationDetails$Builder;->sharedContentLink:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsAddExpirationDetails$Builder;->newValue:Ljava/util/Date;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsAddExpirationDetails;-><init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Ljava/lang/String;Ljava/util/Date;)V

    return-object v0
.end method

.method public withNewValue(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsAddExpirationDetails$Builder;
    .locals 0

    .line 162
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsAddExpirationDetails$Builder;->newValue:Ljava/util/Date;

    return-object p0
.end method

.method public withSharedContentLink(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsAddExpirationDetails$Builder;
    .locals 0

    .line 149
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkSettingsAddExpirationDetails$Builder;->sharedContentLink:Ljava/lang/String;

    return-object p0
.end method
