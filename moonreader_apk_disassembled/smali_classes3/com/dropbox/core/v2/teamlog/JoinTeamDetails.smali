.class public Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;
.super Ljava/lang/Object;
.source "JoinTeamDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;
    }
.end annotation


# instance fields
.field protected final hasLinkedApps:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final hasLinkedDevices:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final hasLinkedSharedFolders:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final linkedApps:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/UserLinkedAppLogInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
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

    .annotation runtime Ljavax/annotation/Nonnull;
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

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final wasLinkedAppsTruncated:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final wasLinkedDevicesTruncated:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final wasLinkedSharedFoldersTruncated:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 10
    .param p1    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
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

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    .line 133
    invoke-direct/range {v0 .. v9}, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
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
            ">;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ")V"
        }
    .end annotation

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_8

    .line 82
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

    .line 84
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'linkedApps\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 87
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->linkedApps:Ljava/util/List;

    if-eqz p2, :cond_7

    .line 91
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

    .line 93
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'linkedDevices\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 96
    :cond_3
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->linkedDevices:Ljava/util/List;

    if-eqz p3, :cond_6

    .line 100
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

    .line 102
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'linkedSharedFolders\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 105
    :cond_5
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->linkedSharedFolders:Ljava/util/List;

    .line 106
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->wasLinkedAppsTruncated:Ljava/lang/Boolean;

    .line 107
    iput-object p5, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->wasLinkedDevicesTruncated:Ljava/lang/Boolean;

    .line 108
    iput-object p6, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->wasLinkedSharedFoldersTruncated:Ljava/lang/Boolean;

    .line 109
    iput-object p7, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->hasLinkedApps:Ljava/lang/Boolean;

    .line 110
    iput-object p8, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->hasLinkedDevices:Ljava/lang/Boolean;

    .line 111
    iput-object p9, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->hasLinkedSharedFolders:Ljava/lang/Boolean;

    return-void

    .line 98
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'linkedSharedFolders\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 89
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'linkedDevices\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 80
    :cond_8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'linkedApps\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Ljava/util/List;Ljava/util/List;Ljava/util/List;)Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;
    .locals 1
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
            ">;)",
            "Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;"
        }
    .end annotation

    .line 251
    new-instance v0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;

    invoke-direct {v0, p0, p1, p2}, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Builder;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 420
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 421
    check-cast p1, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;

    .line 422
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->linkedApps:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->linkedApps:Ljava/util/List;

    if-eq v2, v3, :cond_2

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->linkedDevices:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->linkedDevices:Ljava/util/List;

    if-eq v2, v3, :cond_3

    .line 423
    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->linkedSharedFolders:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->linkedSharedFolders:Ljava/util/List;

    if-eq v2, v3, :cond_4

    .line 424
    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->wasLinkedAppsTruncated:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->wasLinkedAppsTruncated:Ljava/lang/Boolean;

    if-eq v2, v3, :cond_5

    if-eqz v2, :cond_a

    .line 425
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->wasLinkedDevicesTruncated:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->wasLinkedDevicesTruncated:Ljava/lang/Boolean;

    if-eq v2, v3, :cond_6

    if-eqz v2, :cond_a

    .line 426
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->wasLinkedSharedFoldersTruncated:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->wasLinkedSharedFoldersTruncated:Ljava/lang/Boolean;

    if-eq v2, v3, :cond_7

    if-eqz v2, :cond_a

    .line 427
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->hasLinkedApps:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->hasLinkedApps:Ljava/lang/Boolean;

    if-eq v2, v3, :cond_8

    if-eqz v2, :cond_a

    .line 428
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_8
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->hasLinkedDevices:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->hasLinkedDevices:Ljava/lang/Boolean;

    if-eq v2, v3, :cond_9

    if-eqz v2, :cond_a

    .line 429
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_9
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->hasLinkedSharedFolders:Ljava/lang/Boolean;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->hasLinkedSharedFolders:Ljava/lang/Boolean;

    if-eq v2, p1, :cond_b

    if-eqz v2, :cond_a

    .line 430
    invoke-virtual {v2, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a

    goto :goto_0

    :cond_a
    return v1

    :cond_b
    :goto_0
    return v0

    :cond_c
    return v1
.end method

.method public getHasLinkedApps()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 209
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->hasLinkedApps:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getHasLinkedDevices()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 219
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->hasLinkedDevices:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getHasLinkedSharedFolders()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 229
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->hasLinkedSharedFolders:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getLinkedApps()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/UserLinkedAppLogInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 144
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->linkedApps:Ljava/util/List;

    return-object v0
.end method

.method public getLinkedDevices()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/LinkedDeviceLogInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 155
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->linkedDevices:Ljava/util/List;

    return-object v0
.end method

.method public getLinkedSharedFolders()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/FolderLogInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 166
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->linkedSharedFolders:Ljava/util/List;

    return-object v0
.end method

.method public getWasLinkedAppsTruncated()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 177
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->wasLinkedAppsTruncated:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getWasLinkedDevicesTruncated()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 188
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->wasLinkedDevicesTruncated:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getWasLinkedSharedFoldersTruncated()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 199
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->wasLinkedSharedFoldersTruncated:Ljava/lang/Boolean;

    return-object v0
.end method

.method public hashCode()I
    .locals 11

    .line 397
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->linkedApps:Ljava/util/List;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->linkedDevices:Ljava/util/List;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->linkedSharedFolders:Ljava/util/List;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->wasLinkedAppsTruncated:Ljava/lang/Boolean;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->wasLinkedDevicesTruncated:Ljava/lang/Boolean;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->wasLinkedSharedFoldersTruncated:Ljava/lang/Boolean;

    iget-object v6, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->hasLinkedApps:Ljava/lang/Boolean;

    iget-object v7, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->hasLinkedDevices:Ljava/lang/Boolean;

    iget-object v8, p0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails;->hasLinkedSharedFolders:Ljava/lang/Boolean;

    const/16 v9, 0x9

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v0, v9, v10

    const/4 v0, 0x1

    aput-object v1, v9, v0

    const/4 v0, 0x2

    aput-object v2, v9, v0

    const/4 v0, 0x3

    aput-object v3, v9, v0

    const/4 v0, 0x4

    aput-object v4, v9, v0

    const/4 v0, 0x5

    aput-object v5, v9, v0

    const/4 v0, 0x6

    aput-object v6, v9, v0

    const/4 v0, 0x7

    aput-object v7, v9, v0

    const/16 v0, 0x8

    aput-object v8, v9, v0

    invoke-static {v9}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 440
    sget-object v0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 452
    sget-object v0, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/JoinTeamDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
