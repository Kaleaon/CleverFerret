.class public Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;
.super Ljava/lang/Object;
.source "ListMemberDevicesResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/ListMemberDevicesResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected activeWebSessions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/ActiveWebSession;",
            ">;"
        }
    .end annotation
.end field

.field protected desktopClientSessions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/DesktopClientSession;",
            ">;"
        }
    .end annotation
.end field

.field protected mobileClientSessions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/MobileClientSession;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 132
    iput-object v0, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;->activeWebSessions:Ljava/util/List;

    .line 133
    iput-object v0, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;->desktopClientSessions:Ljava/util/List;

    .line 134
    iput-object v0, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;->mobileClientSessions:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/ListMemberDevicesResult;
    .locals 4

    .line 213
    new-instance v0, Lcom/dropbox/core/v2/team/ListMemberDevicesResult;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;->activeWebSessions:Ljava/util/List;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;->desktopClientSessions:Ljava/util/List;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;->mobileClientSessions:Ljava/util/List;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/team/ListMemberDevicesResult;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method public withActiveWebSessions(Ljava/util/List;)Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/ActiveWebSession;",
            ">;)",
            "Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 150
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

    .line 152
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'activeWebSessions\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 156
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;->activeWebSessions:Ljava/util/List;

    return-object p0
.end method

.method public withDesktopClientSessions(Ljava/util/List;)Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/DesktopClientSession;",
            ">;)",
            "Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 173
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

    .line 175
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'desktopClientSessions\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 179
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;->desktopClientSessions:Ljava/util/List;

    return-object p0
.end method

.method public withMobileClientSessions(Ljava/util/List;)Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/team/MobileClientSession;",
            ">;)",
            "Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 196
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

    .line 198
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'mobileClientSessions\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 202
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/team/ListMemberDevicesResult$Builder;->mobileClientSessions:Ljava/util/List;

    return-object p0
.end method
