.class public Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;
.super Ljava/lang/Object;
.source "TeamFolderUpdateSyncSettingsArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected contentSyncSettings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/ContentSyncSettingArg;",
            ">;"
        }
    .end annotation
.end field

.field protected syncSetting:Lcom/dropbox/core/v2/files/SyncSettingArg;

.field protected final teamFolderId:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 135
    const-string v0, "[-_0-9a-zA-Z:]+"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 138
    iput-object p1, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;->teamFolderId:Ljava/lang/String;

    const/4 p1, 0x0

    .line 139
    iput-object p1, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;->syncSetting:Lcom/dropbox/core/v2/files/SyncSettingArg;

    .line 140
    iput-object p1, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;->contentSyncSettings:Ljava/util/List;

    return-void

    .line 136
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'teamFolderId\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 133
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'teamFolderId\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg;
    .locals 4

    .line 186
    new-instance v0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;->teamFolderId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;->syncSetting:Lcom/dropbox/core/v2/files/SyncSettingArg;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;->contentSyncSettings:Ljava/util/List;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/SyncSettingArg;Ljava/util/List;)V

    return-object v0
.end method

.method public withContentSyncSettings(Ljava/util/List;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/ContentSyncSettingArg;",
            ">;)",
            "Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 169
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/files/ContentSyncSettingArg;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 171
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'contentSyncSettings\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 175
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;->contentSyncSettings:Ljava/util/List;

    return-object p0
.end method

.method public withSyncSetting(Lcom/dropbox/core/v2/files/SyncSettingArg;)Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;
    .locals 0

    .line 152
    iput-object p1, p0, Lcom/dropbox/core/v2/team/TeamFolderUpdateSyncSettingsArg$Builder;->syncSetting:Lcom/dropbox/core/v2/files/SyncSettingArg;

    return-object p0
.end method
