.class public Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;
.super Ljava/lang/Object;
.source "SharedLinkSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/SharedLinkSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected access:Lcom/dropbox/core/v2/sharing/RequestedLinkAccessLevel;

.field protected allowDownload:Ljava/lang/Boolean;

.field protected audience:Lcom/dropbox/core/v2/sharing/LinkAudience;

.field protected expires:Ljava/util/Date;

.field protected linkPassword:Ljava/lang/String;

.field protected requestedVisibility:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

.field protected requirePassword:Ljava/lang/Boolean;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 185
    iput-object v0, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->requirePassword:Ljava/lang/Boolean;

    .line 186
    iput-object v0, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->linkPassword:Ljava/lang/String;

    .line 187
    iput-object v0, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->expires:Ljava/util/Date;

    .line 188
    iput-object v0, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->audience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    .line 189
    iput-object v0, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->access:Lcom/dropbox/core/v2/sharing/RequestedLinkAccessLevel;

    .line 190
    iput-object v0, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->requestedVisibility:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    .line 191
    iput-object v0, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->allowDownload:Ljava/lang/Boolean;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/sharing/SharedLinkSettings;
    .locals 8

    .line 299
    new-instance v0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->requirePassword:Ljava/lang/Boolean;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->linkPassword:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->expires:Ljava/util/Date;

    iget-object v4, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->audience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    iget-object v5, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->access:Lcom/dropbox/core/v2/sharing/RequestedLinkAccessLevel;

    iget-object v6, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->requestedVisibility:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    iget-object v7, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->allowDownload:Ljava/lang/Boolean;

    invoke-direct/range {v0 .. v7}, Lcom/dropbox/core/v2/sharing/SharedLinkSettings;-><init>(Ljava/lang/Boolean;Ljava/lang/String;Ljava/util/Date;Lcom/dropbox/core/v2/sharing/LinkAudience;Lcom/dropbox/core/v2/sharing/RequestedLinkAccessLevel;Lcom/dropbox/core/v2/sharing/RequestedVisibility;Ljava/lang/Boolean;)V

    return-object v0
.end method

.method public withAccess(Lcom/dropbox/core/v2/sharing/RequestedLinkAccessLevel;)Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;
    .locals 0

    .line 261
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->access:Lcom/dropbox/core/v2/sharing/RequestedLinkAccessLevel;

    return-object p0
.end method

.method public withAllowDownload(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;
    .locals 0

    .line 288
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->allowDownload:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withAudience(Lcom/dropbox/core/v2/sharing/LinkAudience;)Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;
    .locals 0

    .line 247
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->audience:Lcom/dropbox/core/v2/sharing/LinkAudience;

    return-object p0
.end method

.method public withExpires(Ljava/util/Date;)Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;
    .locals 0

    .line 230
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->expires:Ljava/util/Date;

    return-object p0
.end method

.method public withLinkPassword(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;
    .locals 0

    .line 217
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->linkPassword:Ljava/lang/String;

    return-object p0
.end method

.method public withRequestedVisibility(Lcom/dropbox/core/v2/sharing/RequestedVisibility;)Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;
    .locals 0

    .line 275
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->requestedVisibility:Lcom/dropbox/core/v2/sharing/RequestedVisibility;

    return-object p0
.end method

.method public withRequirePassword(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;
    .locals 0

    .line 203
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedLinkSettings$Builder;->requirePassword:Ljava/lang/Boolean;

    return-object p0
.end method
