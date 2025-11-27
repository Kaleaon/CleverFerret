.class public Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;
.super Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo;
.source "DesktopDeviceSessionLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;,
        Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Builder;
    }
.end annotation


# instance fields
.field protected final clientType:Lcom/dropbox/core/v2/team/DesktopPlatform;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final clientVersion:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final hostName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final isDeleteOnUnlinkSupported:Z

.field protected final platform:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final sessionInfo:Lcom/dropbox/core/v2/teamlog/DesktopSessionLogInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/dropbox/core/v2/team/DesktopPlatform;Ljava/lang/String;Z)V
    .locals 10
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/team/DesktopPlatform;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    .line 101
    invoke-direct/range {v0 .. v9}, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/team/DesktopPlatform;Ljava/lang/String;ZLjava/lang/String;Ljava/util/Date;Ljava/util/Date;Lcom/dropbox/core/v2/teamlog/DesktopSessionLogInfo;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/dropbox/core/v2/team/DesktopPlatform;Ljava/lang/String;ZLjava/lang/String;Ljava/util/Date;Ljava/util/Date;Lcom/dropbox/core/v2/teamlog/DesktopSessionLogInfo;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/team/DesktopPlatform;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Lcom/dropbox/core/v2/teamlog/DesktopSessionLogInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 66
    invoke-direct {p0, p5, p6, p7}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo;-><init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V

    .line 67
    iput-object p8, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->sessionInfo:Lcom/dropbox/core/v2/teamlog/DesktopSessionLogInfo;

    if-eqz p1, :cond_2

    .line 71
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->hostName:Ljava/lang/String;

    if-eqz p2, :cond_1

    .line 75
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->clientType:Lcom/dropbox/core/v2/team/DesktopPlatform;

    .line 76
    iput-object p9, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->clientVersion:Ljava/lang/String;

    if-eqz p3, :cond_0

    .line 80
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->platform:Ljava/lang/String;

    .line 81
    iput-boolean p4, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->isDeleteOnUnlinkSupported:Z

    return-void

    .line 78
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'platform\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 73
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'clientType\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 69
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'hostName\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Ljava/lang/String;Lcom/dropbox/core/v2/team/DesktopPlatform;Ljava/lang/String;Z)Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Builder;
    .locals 1

    .line 211
    new-instance v0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Builder;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Builder;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/team/DesktopPlatform;Ljava/lang/String;Z)V

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

    .line 339
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 340
    check-cast p1, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;

    .line 341
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->hostName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->hostName:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->clientType:Lcom/dropbox/core/v2/team/DesktopPlatform;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->clientType:Lcom/dropbox/core/v2/team/DesktopPlatform;

    if-eq v2, v3, :cond_3

    .line 342
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/team/DesktopPlatform;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->platform:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->platform:Ljava/lang/String;

    if-eq v2, v3, :cond_4

    .line 343
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_4
    iget-boolean v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->isDeleteOnUnlinkSupported:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->isDeleteOnUnlinkSupported:Z

    if-ne v2, v3, :cond_a

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->ipAddress:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->ipAddress:Ljava/lang/String;

    if-eq v2, v3, :cond_5

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->ipAddress:Ljava/lang/String;

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->ipAddress:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->ipAddress:Ljava/lang/String;

    .line 345
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->created:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->created:Ljava/util/Date;

    if-eq v2, v3, :cond_6

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->created:Ljava/util/Date;

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->created:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->created:Ljava/util/Date;

    .line 346
    invoke-virtual {v2, v3}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->updated:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->updated:Ljava/util/Date;

    if-eq v2, v3, :cond_7

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->updated:Ljava/util/Date;

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->updated:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->updated:Ljava/util/Date;

    .line 347
    invoke-virtual {v2, v3}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->sessionInfo:Lcom/dropbox/core/v2/teamlog/DesktopSessionLogInfo;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->sessionInfo:Lcom/dropbox/core/v2/teamlog/DesktopSessionLogInfo;

    if-eq v2, v3, :cond_8

    if-eqz v2, :cond_a

    .line 348
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/DesktopSessionLogInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_8
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->clientVersion:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->clientVersion:Ljava/lang/String;

    if-eq v2, p1, :cond_9

    if-eqz v2, :cond_a

    .line 349
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a

    :cond_9
    return v0

    :cond_a
    return v1
.end method

.method public getClientType()Lcom/dropbox/core/v2/team/DesktopPlatform;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 121
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->clientType:Lcom/dropbox/core/v2/team/DesktopPlatform;

    return-object v0
.end method

.method public getClientVersion()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 191
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->clientVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getCreated()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 161
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->created:Ljava/util/Date;

    return-object v0
.end method

.method public getHostName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 111
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->hostName:Ljava/lang/String;

    return-object v0
.end method

.method public getIpAddress()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 151
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->ipAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getIsDeleteOnUnlinkSupported()Z
    .locals 1

    .line 141
    iget-boolean v0, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->isDeleteOnUnlinkSupported:Z

    return v0
.end method

.method public getPlatform()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 131
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->platform:Ljava/lang/String;

    return-object v0
.end method

.method public getSessionInfo()Lcom/dropbox/core/v2/teamlog/DesktopSessionLogInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 181
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->sessionInfo:Lcom/dropbox/core/v2/teamlog/DesktopSessionLogInfo;

    return-object v0
.end method

.method public getUpdated()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 171
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->updated:Ljava/util/Date;

    return-object v0
.end method

.method public hashCode()I
    .locals 8

    .line 318
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->sessionInfo:Lcom/dropbox/core/v2/teamlog/DesktopSessionLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->hostName:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->clientType:Lcom/dropbox/core/v2/team/DesktopPlatform;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->clientVersion:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->platform:Ljava/lang/String;

    iget-boolean v5, p0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo;->isDeleteOnUnlinkSupported:Z

    .line 324
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    const/4 v6, 0x6

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    const/4 v0, 0x1

    aput-object v1, v6, v0

    const/4 v0, 0x2

    aput-object v2, v6, v0

    const/4 v0, 0x3

    aput-object v3, v6, v0

    const/4 v0, 0x4

    aput-object v4, v6, v0

    const/4 v0, 0x5

    aput-object v5, v6, v0

    .line 318
    invoke-static {v6}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 326
    invoke-super {p0}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 359
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 371
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/DesktopDeviceSessionLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
