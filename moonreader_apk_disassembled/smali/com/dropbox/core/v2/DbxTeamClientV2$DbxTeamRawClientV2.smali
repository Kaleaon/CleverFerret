.class final Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;
.super Lcom/dropbox/core/v2/DbxRawClientV2;
.source "DbxTeamClientV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/DbxTeamClientV2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DbxTeamRawClientV2"
.end annotation


# instance fields
.field private final adminId:Ljava/lang/String;

.field private final credential:Lcom/dropbox/core/oauth/DbxCredential;

.field private final memberId:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/oauth/DbxCredential;Lcom/dropbox/core/DbxHost;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/common/PathRoot;)V
    .locals 0

    .line 205
    invoke-direct {p0, p1, p3, p4, p7}, Lcom/dropbox/core/v2/DbxRawClientV2;-><init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/lang/String;Lcom/dropbox/core/v2/common/PathRoot;)V

    if-eqz p2, :cond_0

    .line 209
    iput-object p2, p0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->credential:Lcom/dropbox/core/oauth/DbxCredential;

    .line 210
    iput-object p5, p0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->memberId:Ljava/lang/String;

    .line 211
    iput-object p6, p0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->adminId:Ljava/lang/String;

    return-void

    .line 207
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "credential"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method synthetic constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/oauth/DbxCredential;Lcom/dropbox/core/DbxHost;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/common/PathRoot;Lcom/dropbox/core/v2/DbxTeamClientV2$1;)V
    .locals 0

    .line 192
    invoke-direct/range {p0 .. p7}, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;-><init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/oauth/DbxCredential;Lcom/dropbox/core/DbxHost;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/common/PathRoot;)V

    return-void
.end method


# virtual methods
.method protected addAuthHeaders(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/http/HttpRequestor$Header;",
            ">;)V"
        }
    .end annotation

    .line 232
    invoke-static {p1}, Lcom/dropbox/core/DbxRequestUtil;->removeAuthHeader(Ljava/util/List;)Ljava/util/List;

    .line 233
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->credential:Lcom/dropbox/core/oauth/DbxCredential;

    invoke-virtual {v0}, Lcom/dropbox/core/oauth/DbxCredential;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/dropbox/core/DbxRequestUtil;->addAuthHeader(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    .line 234
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->memberId:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 235
    invoke-static {p1, v0}, Lcom/dropbox/core/DbxRequestUtil;->addSelectUserHeader(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    .line 237
    :cond_0
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->adminId:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 238
    invoke-static {p1, v0}, Lcom/dropbox/core/DbxRequestUtil;->addSelectAdminHeader(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    :cond_1
    return-void
.end method

.method public canRefreshAccessToken()Z
    .locals 1

    .line 222
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->credential:Lcom/dropbox/core/oauth/DbxCredential;

    invoke-virtual {v0}, Lcom/dropbox/core/oauth/DbxCredential;->getRefreshToken()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public needsRefreshAccessToken()Z
    .locals 1

    .line 227
    invoke-virtual {p0}, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->canRefreshAccessToken()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->credential:Lcom/dropbox/core/oauth/DbxCredential;

    invoke-virtual {v0}, Lcom/dropbox/core/oauth/DbxCredential;->aboutToExpire()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public refreshAccessToken()Lcom/dropbox/core/oauth/DbxRefreshResult;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 216
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->credential:Lcom/dropbox/core/oauth/DbxCredential;

    invoke-virtual {p0}, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->getRequestConfig()Lcom/dropbox/core/DbxRequestConfig;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/dropbox/core/oauth/DbxCredential;->refresh(Lcom/dropbox/core/DbxRequestConfig;)Lcom/dropbox/core/oauth/DbxRefreshResult;

    .line 217
    new-instance v0, Lcom/dropbox/core/oauth/DbxRefreshResult;

    iget-object v1, p0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->credential:Lcom/dropbox/core/oauth/DbxCredential;

    invoke-virtual {v1}, Lcom/dropbox/core/oauth/DbxCredential;->getAccessToken()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->credential:Lcom/dropbox/core/oauth/DbxCredential;

    invoke-virtual {v2}, Lcom/dropbox/core/oauth/DbxCredential;->getExpiresAt()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/oauth/DbxRefreshResult;-><init>(Ljava/lang/String;J)V

    return-object v0
.end method

.method protected withPathRoot(Lcom/dropbox/core/v2/common/PathRoot;)Lcom/dropbox/core/v2/DbxRawClientV2;
    .locals 8

    .line 244
    new-instance v0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;

    .line 245
    invoke-virtual {p0}, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->getRequestConfig()Lcom/dropbox/core/DbxRequestConfig;

    move-result-object v1

    iget-object v2, p0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->credential:Lcom/dropbox/core/oauth/DbxCredential;

    .line 247
    invoke-virtual {p0}, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v3

    .line 248
    invoke-virtual {p0}, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->getUserId()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->memberId:Ljava/lang/String;

    iget-object v6, p0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;->adminId:Ljava/lang/String;

    move-object v7, p1

    invoke-direct/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;-><init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/oauth/DbxCredential;Lcom/dropbox/core/DbxHost;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/common/PathRoot;)V

    return-object v0
.end method
