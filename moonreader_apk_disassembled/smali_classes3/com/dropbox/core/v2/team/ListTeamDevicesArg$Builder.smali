.class public Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;
.super Ljava/lang/Object;
.source "ListTeamDevicesArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/ListTeamDevicesArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected cursor:Ljava/lang/String;

.field protected includeDesktopClients:Z

.field protected includeMobileClients:Z

.field protected includeWebSessions:Z


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 127
    iput-object v0, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->cursor:Ljava/lang/String;

    const/4 v0, 0x1

    .line 128
    iput-boolean v0, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->includeWebSessions:Z

    .line 129
    iput-boolean v0, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->includeDesktopClients:Z

    .line 130
    iput-boolean v0, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->includeMobileClients:Z

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/ListTeamDevicesArg;
    .locals 5

    .line 219
    new-instance v0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->cursor:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->includeWebSessions:Z

    iget-boolean v3, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->includeDesktopClients:Z

    iget-boolean v4, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->includeMobileClients:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/team/ListTeamDevicesArg;-><init>(Ljava/lang/String;ZZZ)V

    return-object v0
.end method

.method public withCursor(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;
    .locals 0

    .line 145
    iput-object p1, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->cursor:Ljava/lang/String;

    return-object p0
.end method

.method public withIncludeDesktopClients(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 183
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->includeDesktopClients:Z

    return-object p0

    :cond_0
    const/4 p1, 0x1

    .line 186
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->includeDesktopClients:Z

    return-object p0
.end method

.method public withIncludeMobileClients(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 204
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->includeMobileClients:Z

    return-object p0

    :cond_0
    const/4 p1, 0x1

    .line 207
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->includeMobileClients:Z

    return-object p0
.end method

.method public withIncludeWebSessions(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 162
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->includeWebSessions:Z

    return-object p0

    :cond_0
    const/4 p1, 0x1

    .line 165
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/ListTeamDevicesArg$Builder;->includeWebSessions:Z

    return-object p0
.end method
