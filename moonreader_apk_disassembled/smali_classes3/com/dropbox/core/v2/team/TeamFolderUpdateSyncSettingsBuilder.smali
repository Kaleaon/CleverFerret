.class public Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsBuilder;
.super Ljava/lang/Object;
.source "TeamFolderUpdateSyncSettingsBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 36
    iput-object p1, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    if-eqz p2, :cond_0

    .line 40
    iput-object p2, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsBuilder;->_builder:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;

    return-void

    .line 38
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 34
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_client"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public start()Lcom/dropbox/core/v2/team/TeamFolderMetadata;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 76
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsBuilder;->_builder:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;->build()Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg;

    move-result-object v0

    .line 77
    iget-object v1, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;->teamFolderUpdateSyncSettings(Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg;)Lcom/dropbox/core/v2/team/TeamFolderMetadata;

    move-result-object v0

    return-object v0
.end method

.method public withContentSyncSettings(Ljava/util/List;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/ContentSyncSettingArg;",
            ">;)",
            "Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsBuilder;"
        }
    .end annotation

    .line 68
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsBuilder;->_builder:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;->withContentSyncSettings(Ljava/util/List;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;

    return-object p0
.end method

.method public withSyncSetting(Lcom/dropbox/core/v2/files/SyncSettingArg;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsBuilder;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsBuilder;->_builder:Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;->withSyncSetting(Lcom/dropbox/core/v2/files/SyncSettingArg;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;

    return-object p0
.end method
