.class public Lcom/dropbox/core/v2/teamlog/DbxTeamTeamLogRequests;
.super Ljava/lang/Object;
.source "DbxTeamTeamLogRequests.java"


# instance fields
.field private final client:Lcom/dropbox/core/v2/DbxRawClientV2;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/DbxRawClientV2;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/DbxTeamTeamLogRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    return-void
.end method


# virtual methods
.method public getEvents()Lcom/dropbox/core/v2/teamlog/GetTeamEventsResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/teamlog/GetTeamEventsErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg;-><init>()V

    .line 84
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/teamlog/DbxTeamTeamLogRequests;->getEvents(Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsResult;

    move-result-object v0

    return-object v0
.end method

.method getEvents(Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/teamlog/GetTeamEventsErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 47
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DbxTeamTeamLogRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/team_log/get_events"

    sget-object v5, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/teamlog/GetTeamEventsResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GetTeamEventsResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/teamlog/GetTeamEventsError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GetTeamEventsError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/teamlog/GetTeamEventsResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 56
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/teamlog/GetTeamEventsError;

    const-string v3, "2/team_log/get_events"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/teamlog/GetTeamEventsError;)V

    throw v0
.end method

.method public getEventsBuilder()Lcom/dropbox/core/v2/teamlog/GetEventsBuilder;
    .locals 2

    .line 105
    invoke-static {}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg;->newBuilder()Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;

    move-result-object v0

    .line 106
    new-instance v1, Lcom/dropbox/core/v2/teamlog/GetEventsBuilder;

    invoke-direct {v1, p0, v0}, Lcom/dropbox/core/v2/teamlog/GetEventsBuilder;-><init>(Lcom/dropbox/core/v2/teamlog/DbxTeamTeamLogRequests;Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;)V

    return-object v1
.end method

.method getEventsContinue(Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueArg;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsResult;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 121
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DbxTeamTeamLogRequests;->client:Lcom/dropbox/core/v2/DbxRawClientV2;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/DbxRawClientV2;->getHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getApi()Ljava/lang/String;

    move-result-object v1

    const-string v2, "2/team_log/get_events/continue"

    sget-object v5, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueArg$Serializer;

    sget-object v6, Lcom/dropbox/core/v2/teamlog/GetTeamEventsResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GetTeamEventsResult$Serializer;

    sget-object v7, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError$Serializer;

    const/4 v4, 0x0

    move-object v3, p1

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/v2/DbxRawClientV2;->rpcStyle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;ZLcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;Lcom/dropbox/core/stone/StoneSerializer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/teamlog/GetTeamEventsResult;
    :try_end_0
    .catch Lcom/dropbox/core/DbxWrappedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 130
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueErrorException;

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getRequestId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getUserMessage()Lcom/dropbox/core/LocalizedText;

    move-result-object v2

    invoke-virtual {p1}, Lcom/dropbox/core/DbxWrappedException;->getErrorValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;

    const-string v3, "2/team_log/get_events/continue"

    invoke-direct {v0, v3, v1, v2, p1}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueErrorException;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/LocalizedText;Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueError;)V

    throw v0
.end method

.method public getEventsContinue(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 148
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueArg;

    invoke-direct {v0, p1}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueArg;-><init>(Ljava/lang/String;)V

    .line 149
    invoke-virtual {p0, v0}, Lcom/dropbox/core/v2/teamlog/DbxTeamTeamLogRequests;->getEventsContinue(Lcom/dropbox/core/v2/teamlog/GetTeamEventsContinueArg;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsResult;

    move-result-object p1

    return-object p1
.end method
