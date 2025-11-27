.class public Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;
.super Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo;
.source "LegacyDeviceSessionLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Serializer;,
        Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;
    }
.end annotation


# instance fields
.field protected final clientVersion:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final deviceType:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final displayName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final isEmmManaged:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final legacyUniqId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final macAddress:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final osVersion:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final platform:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 13

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v0, p0

    .line 95
    invoke-direct/range {v0 .. v12}, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;-><init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Lcom/dropbox/core/v2/teamlog/SessionLogInfo;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Lcom/dropbox/core/v2/teamlog/SessionLogInfo;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/teamlog/SessionLogInfo;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p11    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p12    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 77
    invoke-direct {p0, p1, p2, p3}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo;-><init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V

    .line 78
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    .line 79
    iput-object p5, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->displayName:Ljava/lang/String;

    .line 80
    iput-object p6, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->isEmmManaged:Ljava/lang/Boolean;

    .line 81
    iput-object p7, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->platform:Ljava/lang/String;

    .line 82
    iput-object p8, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->macAddress:Ljava/lang/String;

    .line 83
    iput-object p9, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->osVersion:Ljava/lang/String;

    .line 84
    iput-object p10, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->deviceType:Ljava/lang/String;

    .line 85
    iput-object p11, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->clientVersion:Ljava/lang/String;

    .line 86
    iput-object p12, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->legacyUniqId:Ljava/lang/String;

    return-void
.end method

.method public static newBuilder()Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;
    .locals 1

    .line 228
    new-instance v0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;-><init>()V

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

    .line 448
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 449
    check-cast p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;

    .line 450
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->ipAddress:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->ipAddress:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->ipAddress:Ljava/lang/String;

    if-eqz v2, :cond_d

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->ipAddress:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->ipAddress:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->created:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->created:Ljava/util/Date;

    if-eq v2, v3, :cond_3

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->created:Ljava/util/Date;

    if-eqz v2, :cond_d

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->created:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->created:Ljava/util/Date;

    .line 451
    invoke-virtual {v2, v3}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->updated:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->updated:Ljava/util/Date;

    if-eq v2, v3, :cond_4

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->updated:Ljava/util/Date;

    if-eqz v2, :cond_d

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->updated:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->updated:Ljava/util/Date;

    .line 452
    invoke-virtual {v2, v3}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    if-eq v2, v3, :cond_5

    if-eqz v2, :cond_d

    .line 453
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/SessionLogInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->displayName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->displayName:Ljava/lang/String;

    if-eq v2, v3, :cond_6

    if-eqz v2, :cond_d

    .line 454
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->isEmmManaged:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->isEmmManaged:Ljava/lang/Boolean;

    if-eq v2, v3, :cond_7

    if-eqz v2, :cond_d

    .line 455
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->platform:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->platform:Ljava/lang/String;

    if-eq v2, v3, :cond_8

    if-eqz v2, :cond_d

    .line 456
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_8
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->macAddress:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->macAddress:Ljava/lang/String;

    if-eq v2, v3, :cond_9

    if-eqz v2, :cond_d

    .line 457
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_9
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->osVersion:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->osVersion:Ljava/lang/String;

    if-eq v2, v3, :cond_a

    if-eqz v2, :cond_d

    .line 458
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_a
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->deviceType:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->deviceType:Ljava/lang/String;

    if-eq v2, v3, :cond_b

    if-eqz v2, :cond_d

    .line 459
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_b
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->clientVersion:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->clientVersion:Ljava/lang/String;

    if-eq v2, v3, :cond_c

    if-eqz v2, :cond_d

    .line 460
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    :cond_c
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->legacyUniqId:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->legacyUniqId:Ljava/lang/String;

    if-eq v2, p1, :cond_e

    if-eqz v2, :cond_d

    .line 461
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    goto :goto_0

    :cond_d
    return v1

    :cond_e
    :goto_0
    return v0

    :cond_f
    return v1
.end method

.method public getClientVersion()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 208
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->clientVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getCreated()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 115
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->created:Ljava/util/Date;

    return-object v0
.end method

.method public getDeviceType()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 198
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->deviceType:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 145
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getIpAddress()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 105
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->ipAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getIsEmmManaged()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 155
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->isEmmManaged:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getLegacyUniqId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 219
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->legacyUniqId:Ljava/lang/String;

    return-object v0
.end method

.method public getMacAddress()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 177
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->macAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getOsVersion()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 187
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->osVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getPlatform()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 166
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->platform:Ljava/lang/String;

    return-object v0
.end method

.method public getSessionInfo()Lcom/dropbox/core/v2/teamlog/SessionLogInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 135
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    return-object v0
.end method

.method public getUpdated()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 125
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->updated:Ljava/util/Date;

    return-object v0
.end method

.method public hashCode()I
    .locals 11

    .line 424
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->displayName:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->isEmmManaged:Ljava/lang/Boolean;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->platform:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->macAddress:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->osVersion:Ljava/lang/String;

    iget-object v6, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->deviceType:Ljava/lang/String;

    iget-object v7, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->clientVersion:Ljava/lang/String;

    iget-object v8, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;->legacyUniqId:Ljava/lang/String;

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

    .line 435
    invoke-super {p0}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 471
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 483
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
