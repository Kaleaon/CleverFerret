.class public Lcom/dropbox/core/v2/team/DevicesListMembersDevicesBuilder;
.super Ljava/lang/Object;
.source "DevicesListMembersDevicesBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 32
    iput-object p1, p0, Lcom/dropbox/core/v2/team/DevicesListMembersDevicesBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    if-eqz p2, :cond_0

    .line 36
    iput-object p2, p0, Lcom/dropbox/core/v2/team/DevicesListMembersDevicesBuilder;->_builder:Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;

    return-void

    .line 34
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 30
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_client"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public start()Lcom/dropbox/core/v2/team/ListMembersDevicesResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/team/ListMembersDevicesErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 104
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DevicesListMembersDevicesBuilder;->_builder:Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;->build()Lcom/dropbox/core/v2/team/ListMembersDevicesArg;

    move-result-object v0

    .line 105
    iget-object v1, p0, Lcom/dropbox/core/v2/team/DevicesListMembersDevicesBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;->devicesListMembersDevices(Lcom/dropbox/core/v2/team/ListMembersDevicesArg;)Lcom/dropbox/core/v2/team/ListMembersDevicesResult;

    move-result-object v0

    return-object v0
.end method

.method public withCursor(Ljava/lang/String;)Lcom/dropbox/core/v2/team/DevicesListMembersDevicesBuilder;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DevicesListMembersDevicesBuilder;->_builder:Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;->withCursor(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;

    return-object p0
.end method

.method public withIncludeDesktopClients(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/DevicesListMembersDevicesBuilder;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DevicesListMembersDevicesBuilder;->_builder:Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;->withIncludeDesktopClients(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;

    return-object p0
.end method

.method public withIncludeMobileClients(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/DevicesListMembersDevicesBuilder;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DevicesListMembersDevicesBuilder;->_builder:Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;->withIncludeMobileClients(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;

    return-object p0
.end method

.method public withIncludeWebSessions(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/DevicesListMembersDevicesBuilder;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DevicesListMembersDevicesBuilder;->_builder:Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;->withIncludeWebSessions(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/ListMembersDevicesArg$Builder;

    return-object p0
.end method
