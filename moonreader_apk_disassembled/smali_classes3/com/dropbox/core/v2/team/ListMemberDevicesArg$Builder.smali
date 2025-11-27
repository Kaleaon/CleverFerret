.class public Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;
.super Ljava/lang/Object;
.source "ListMemberDevicesArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/ListMemberDevicesArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected includeDesktopClients:Z

.field protected includeMobileClients:Z

.field protected includeWebSessions:Z

.field protected final teamMemberId:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 137
    iput-object p1, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;->teamMemberId:Ljava/lang/String;

    const/4 p1, 0x1

    .line 138
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;->includeWebSessions:Z

    .line 139
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;->includeDesktopClients:Z

    .line 140
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;->includeMobileClients:Z

    return-void

    .line 135
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'teamMemberId\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/ListMemberDevicesArg;
    .locals 5

    .line 215
    new-instance v0, Lcom/dropbox/core/v2/team/ListMemberDevicesArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;->teamMemberId:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;->includeWebSessions:Z

    iget-boolean v3, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;->includeDesktopClients:Z

    iget-boolean v4, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;->includeMobileClients:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/team/ListMemberDevicesArg;-><init>(Ljava/lang/String;ZZZ)V

    return-object v0
.end method

.method public withIncludeDesktopClients(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 178
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;->includeDesktopClients:Z

    return-object p0

    :cond_0
    const/4 p1, 0x1

    .line 181
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;->includeDesktopClients:Z

    return-object p0
.end method

.method public withIncludeMobileClients(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 200
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;->includeMobileClients:Z

    return-object p0

    :cond_0
    const/4 p1, 0x1

    .line 203
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;->includeMobileClients:Z

    return-object p0
.end method

.method public withIncludeWebSessions(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 156
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;->includeWebSessions:Z

    return-object p0

    :cond_0
    const/4 p1, 0x1

    .line 159
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesArg$Builder;->includeWebSessions:Z

    return-object p0
.end method
