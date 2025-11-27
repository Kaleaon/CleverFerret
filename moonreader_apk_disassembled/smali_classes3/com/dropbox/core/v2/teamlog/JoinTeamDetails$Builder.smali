.class public Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;
.super Ljava/lang/Object;
.source "JoinTeamDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected hasLinkedApps:Ljava/lang/Boolean;

.field protected hasLinkedDevices:Ljava/lang/Boolean;

.field protected hasLinkedSharedFolders:Ljava/lang/Boolean;

.field protected final linkedApps:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/UserLinkedAppLogInfo;",
            ">;"
        }
    .end annotation
.end field

.field protected final linkedDevices:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;",
            ">;"
        }
    .end annotation
.end field

.field protected final linkedSharedFolders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/FolderLogInfo;",
            ">;"
        }
    .end annotation
.end field

.field protected wasLinkedAppsTruncated:Ljava/lang/Boolean;

.field protected wasLinkedDevicesTruncated:Ljava/lang/Boolean;

.field protected wasLinkedSharedFoldersTruncated:Ljava/lang/Boolean;


# direct methods
.method protected constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/UserLinkedAppLogInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/FolderLogInfo;",
            ">;)V"
        }
    .end annotation

    .line 269
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_8

    .line 273
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/teamlog/UserLinkedAppLogInfo;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 275
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'linkedApps\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 278
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->linkedApps:Ljava/util/List;

    if-eqz p2, :cond_7

    .line 282
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;

    if-eqz v0, :cond_2

    goto :goto_1

    .line 284
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'linkedDevices\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 287
    :cond_3
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->linkedDevices:Ljava/util/List;

    if-eqz p3, :cond_6

    .line 291
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/dropbox/core/v2/teamlog/FolderLogInfo;

    if-eqz p2, :cond_4

    goto :goto_2

    .line 293
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'linkedSharedFolders\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 296
    :cond_5
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->linkedSharedFolders:Ljava/util/List;

    const/4 p1, 0x0

    .line 297
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->wasLinkedAppsTruncated:Ljava/lang/Boolean;

    .line 298
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->wasLinkedDevicesTruncated:Ljava/lang/Boolean;

    .line 299
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->wasLinkedSharedFoldersTruncated:Ljava/lang/Boolean;

    .line 300
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->hasLinkedApps:Ljava/lang/Boolean;

    .line 301
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->hasLinkedDevices:Ljava/lang/Boolean;

    .line 302
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->hasLinkedSharedFolders:Ljava/lang/Boolean;

    return-void

    .line 289
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'linkedSharedFolders\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 280
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'linkedDevices\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 271
    :cond_8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'linkedApps\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;
    .locals 10

    .line 391
    new-instance v0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->linkedApps:Ljava/util/List;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->linkedDevices:Ljava/util/List;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->linkedSharedFolders:Ljava/util/List;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->wasLinkedAppsTruncated:Ljava/lang/Boolean;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->wasLinkedDevicesTruncated:Ljava/lang/Boolean;

    iget-object v6, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->wasLinkedSharedFoldersTruncated:Ljava/lang/Boolean;

    iget-object v7, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->hasLinkedApps:Ljava/lang/Boolean;

    iget-object v8, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->hasLinkedDevices:Ljava/lang/Boolean;

    iget-object v9, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->hasLinkedSharedFolders:Ljava/lang/Boolean;

    invoke-direct/range {v0 .. v9}, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    return-object v0
.end method

.method public withHasLinkedApps(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;
    .locals 0

    .line 354
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->hasLinkedApps:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withHasLinkedDevices(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;
    .locals 0

    .line 367
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->hasLinkedDevices:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withHasLinkedSharedFolders(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;
    .locals 0

    .line 380
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->hasLinkedSharedFolders:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withWasLinkedAppsTruncated(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;
    .locals 0

    .line 314
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->wasLinkedAppsTruncated:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withWasLinkedDevicesTruncated(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;
    .locals 0

    .line 328
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->wasLinkedDevicesTruncated:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withWasLinkedSharedFoldersTruncated(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;
    .locals 0

    .line 342
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;->wasLinkedSharedFoldersTruncated:Ljava/lang/Boolean;

    return-object p0
.end method
