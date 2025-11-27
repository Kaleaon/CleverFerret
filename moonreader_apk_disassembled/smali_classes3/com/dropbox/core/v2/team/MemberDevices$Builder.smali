.class public Lcom/dropbox/core/v2/team/MemberDevices$Builder;
.super Ljava/lang/Object;
.source "MemberDevices.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/MemberDevices;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected desktopClients:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/DesktopClientSession;",
            ">;"
        }
    .end annotation
.end field

.field protected mobileClients:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/MobileClientSession;",
            ">;"
        }
    .end annotation
.end field

.field protected final teamMemberId:Ljava/lang/String;

.field protected webSessions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/ActiveWebSession;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 168
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MemberDevices$Builder;->teamMemberId:Ljava/lang/String;

    const/4 p1, 0x0

    .line 169
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MemberDevices$Builder;->webSessions:Ljava/util/List;

    .line 170
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MemberDevices$Builder;->desktopClients:Ljava/util/List;

    .line 171
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MemberDevices$Builder;->mobileClients:Ljava/util/List;

    return-void

    .line 166
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'teamMemberId\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/MemberDevices;
    .locals 5

    .line 250
    new-instance v0, Lcom/dropbox/core/v2/team/MemberDevices;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/MemberDevices$Builder;->teamMemberId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberDevices$Builder;->webSessions:Ljava/util/List;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/MemberDevices$Builder;->desktopClients:Ljava/util/List;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/MemberDevices$Builder;->mobileClients:Ljava/util/List;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/team/MemberDevices;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method public withDesktopClients(Ljava/util/List;)Lcom/dropbox/core/v2/team/MemberDevices$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/DesktopClientSession;",
            ">;)",
            "Lcom/dropbox/core/v2/team/MemberDevices$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 210
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/team/DesktopClientSession;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 212
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'desktopClients\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 216
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MemberDevices$Builder;->desktopClients:Ljava/util/List;

    return-object p0
.end method

.method public withMobileClients(Ljava/util/List;)Lcom/dropbox/core/v2/team/MemberDevices$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/MobileClientSession;",
            ">;)",
            "Lcom/dropbox/core/v2/team/MemberDevices$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 233
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/team/MobileClientSession;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 235
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'mobileClients\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 239
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MemberDevices$Builder;->mobileClients:Ljava/util/List;

    return-object p0
.end method

.method public withWebSessions(Ljava/util/List;)Lcom/dropbox/core/v2/team/MemberDevices$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/ActiveWebSession;",
            ">;)",
            "Lcom/dropbox/core/v2/team/MemberDevices$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 187
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/team/ActiveWebSession;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 189
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'webSessions\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 193
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/team/MemberDevices$Builder;->webSessions:Ljava/util/List;

    return-object p0
.end method
