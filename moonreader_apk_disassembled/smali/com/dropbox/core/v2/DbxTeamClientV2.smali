.class public Lcom/dropbox/core/v2/DbxTeamClientV2;
.super Lcom/dropbox/core/v2/DbxTeamClientV2Base;
.source "DbxTeamClientV2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;
    }
.end annotation


# instance fields
.field private final credential:Lcom/dropbox/core/oauth/DbxCredential;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/oauth/DbxCredential;)V
    .locals 2

    .line 73
    sget-object v0, Lcom/dropbox/core/DbxHost;->DEFAULT:Lcom/dropbox/core/DbxHost;

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/dropbox/core/v2/DbxTeamClientV2;-><init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/oauth/DbxCredential;Lcom/dropbox/core/DbxHost;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/oauth/DbxCredential;Lcom/dropbox/core/DbxHost;Ljava/lang/String;)V
    .locals 9

    .line 107
    new-instance v0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v8}, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;-><init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/oauth/DbxCredential;Lcom/dropbox/core/DbxHost;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/common/PathRoot;Lcom/dropbox/core/v2/DbxTeamClientV2$1;)V

    invoke-direct {p0, v0}, Lcom/dropbox/core/v2/DbxTeamClientV2Base;-><init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V

    .line 108
    iput-object v2, p0, Lcom/dropbox/core/v2/DbxTeamClientV2;->credential:Lcom/dropbox/core/oauth/DbxCredential;

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;)V
    .locals 1

    .line 42
    sget-object v0, Lcom/dropbox/core/DbxHost;->DEFAULT:Lcom/dropbox/core/DbxHost;

    invoke-direct {p0, p1, p2, v0}, Lcom/dropbox/core/v2/DbxTeamClientV2;-><init>(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/DbxHost;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/DbxHost;)V
    .locals 1

    const/4 v0, 0x0

    .line 58
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/dropbox/core/v2/DbxTeamClientV2;-><init>(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/DbxHost;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/DbxHost;Ljava/lang/String;)V
    .locals 1

    .line 90
    new-instance v0, Lcom/dropbox/core/oauth/DbxCredential;

    invoke-direct {v0, p2}, Lcom/dropbox/core/oauth/DbxCredential;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v0, p3, p4}, Lcom/dropbox/core/v2/DbxTeamClientV2;-><init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/oauth/DbxCredential;Lcom/dropbox/core/DbxHost;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public asAdmin(Ljava/lang/String;)Lcom/dropbox/core/v2/DbxClientV2;
    .locals 9

    if-eqz p1, :cond_0

    .line 175
    new-instance v0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;

    iget-object v1, p0, Lcom/dropbox/core/v2/DbxTeamClientV2;->_client:Lcom/dropbox/core/v2/DbxRawClientV2;

    .line 176
    invoke-virtual {v1}, Lcom/dropbox/core/v2/DbxRawClientV2;->getRequestConfig()Lcom/dropbox/core/DbxRequestConfig;

    move-result-object v1

    iget-object v2, p0, Lcom/dropbox/core/v2/DbxTeamClientV2;->credential:Lcom/dropbox/core/oauth/DbxCredential;

    iget-object v3, p0, Lcom/dropbox/core/v2/DbxTeamClientV2;->_client:Lcom/dropbox/core/v2/DbxRawClientV2;

    .line 178
    invoke-virtual {v3}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v3

    iget-object v4, p0, Lcom/dropbox/core/v2/DbxTeamClientV2;->_client:Lcom/dropbox/core/v2/DbxRawClientV2;

    .line 179
    invoke-virtual {v4}, Lcom/dropbox/core/v2/DbxRawClientV2;->getUserId()Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v5, 0x0

    move-object v6, p1

    invoke-direct/range {v0 .. v8}, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;-><init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/oauth/DbxCredential;Lcom/dropbox/core/DbxHost;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/common/PathRoot;Lcom/dropbox/core/v2/DbxTeamClientV2$1;)V

    .line 184
    new-instance p1, Lcom/dropbox/core/v2/DbxClientV2;

    invoke-direct {p1, v0}, Lcom/dropbox/core/v2/DbxClientV2;-><init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V

    return-object p1

    .line 172
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "\'adminId\' should not be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public asMember(Ljava/lang/String;)Lcom/dropbox/core/v2/DbxClientV2;
    .locals 9

    if-eqz p1, :cond_0

    .line 144
    new-instance v0, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;

    iget-object v1, p0, Lcom/dropbox/core/v2/DbxTeamClientV2;->_client:Lcom/dropbox/core/v2/DbxRawClientV2;

    .line 145
    invoke-virtual {v1}, Lcom/dropbox/core/v2/DbxRawClientV2;->getRequestConfig()Lcom/dropbox/core/DbxRequestConfig;

    move-result-object v1

    iget-object v2, p0, Lcom/dropbox/core/v2/DbxTeamClientV2;->credential:Lcom/dropbox/core/oauth/DbxCredential;

    iget-object v3, p0, Lcom/dropbox/core/v2/DbxTeamClientV2;->_client:Lcom/dropbox/core/v2/DbxRawClientV2;

    .line 147
    invoke-virtual {v3}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v3

    iget-object v4, p0, Lcom/dropbox/core/v2/DbxTeamClientV2;->_client:Lcom/dropbox/core/v2/DbxRawClientV2;

    .line 148
    invoke-virtual {v4}, Lcom/dropbox/core/v2/DbxRawClientV2;->getUserId()Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v6, 0x0

    move-object v5, p1

    invoke-direct/range {v0 .. v8}, Lcom/dropbox/core/v2/DbxTeamClientV2$DbxTeamRawClientV2;-><init>(Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/oauth/DbxCredential;Lcom/dropbox/core/DbxHost;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/common/PathRoot;Lcom/dropbox/core/v2/DbxTeamClientV2$1;)V

    .line 153
    new-instance p1, Lcom/dropbox/core/v2/DbxClientV2;

    invoke-direct {p1, v0}, Lcom/dropbox/core/v2/DbxClientV2;-><init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V

    return-object p1

    .line 141
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "\'memberId\' should not be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public refreshAccessToken()Lcom/dropbox/core/oauth/DbxRefreshResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 122
    iget-object v0, p0, Lcom/dropbox/core/v2/DbxTeamClientV2;->_client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->refreshAccessToken()Lcom/dropbox/core/oauth/DbxRefreshResult;

    move-result-object v0

    return-object v0
.end method
