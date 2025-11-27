.class public Lcom/dropbox/core/v2/team/DevicesListTeamDevicesBuilder;
.super Ljava/lang/Object;
.source "DevicesListTeamDevicesBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 32
    iput-object p1, p0, Lcom/dropbox/core/v2/team/DevicesListTeamDevicesBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    if-eqz p2, :cond_0

    .line 36
    iput-object p2, p0, Lcom/dropbox/core/v2/team/DevicesListTeamDevicesBuilder;->_builder:Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;

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
.method public start()Lcom/dropbox/core/v2/team/ListTeamDevicesResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/team/ListTeamDevicesErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 105
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DevicesListTeamDevicesBuilder;->_builder:Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->build()Lcom/dropbox/core/v2/team/ListTeamDevicesArg;

    move-result-object v0

    .line 106
    iget-object v1, p0, Lcom/dropbox/core/v2/team/DevicesListTeamDevicesBuilder;->_client:Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/team/DbxTeamTeamRequests;->devicesListTeamDevices(Lcom/dropbox/core/v2/team/ListTeamDevicesArg;)Lcom/dropbox/core/v2/team/ListTeamDevicesResult;

    move-result-object v0

    return-object v0
.end method

.method public withCursor(Ljava/lang/String;)Lcom/dropbox/core/v2/team/DevicesListTeamDevicesBuilder;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DevicesListTeamDevicesBuilder;->_builder:Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->withCursor(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;

    return-object p0
.end method

.method public withIncludeDesktopClients(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/DevicesListTeamDevicesBuilder;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DevicesListTeamDevicesBuilder;->_builder:Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->withIncludeDesktopClients(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;

    return-object p0
.end method

.method public withIncludeMobileClients(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/DevicesListTeamDevicesBuilder;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DevicesListTeamDevicesBuilder;->_builder:Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->withIncludeMobileClients(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;

    return-object p0
.end method

.method public withIncludeWebSessions(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/DevicesListTeamDevicesBuilder;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/dropbox/core/v2/team/DevicesListTeamDevicesBuilder;->_builder:Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->withIncludeWebSessions(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;

    return-object p0
.end method
