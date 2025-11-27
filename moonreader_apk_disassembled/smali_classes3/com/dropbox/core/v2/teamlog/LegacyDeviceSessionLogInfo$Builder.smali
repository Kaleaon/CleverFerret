.class public Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;
.super Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
.source "LegacyDeviceSessionLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected clientVersion:Ljava/lang/String;

.field protected deviceType:Ljava/lang/String;

.field protected displayName:Ljava/lang/String;

.field protected isEmmManaged:Ljava/lang/Boolean;

.field protected legacyUniqId:Ljava/lang/String;

.field protected macAddress:Ljava/lang/String;

.field protected osVersion:Ljava/lang/String;

.field protected platform:Ljava/lang/String;

.field protected sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 246
    invoke-direct {p0}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;-><init>()V

    const/4 v0, 0x0

    .line 247
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    .line 248
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->displayName:Ljava/lang/String;

    .line 249
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->isEmmManaged:Ljava/lang/Boolean;

    .line 250
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->platform:Ljava/lang/String;

    .line 251
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->macAddress:Ljava/lang/String;

    .line 252
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->osVersion:Ljava/lang/String;

    .line 253
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->deviceType:Ljava/lang/String;

    .line 254
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->clientVersion:Ljava/lang/String;

    .line 255
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->legacyUniqId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo;
    .locals 1

    .line 234
    invoke-virtual {p0}, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->build()Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;
    .locals 13

    .line 418
    new-instance v0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->ipAddress:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->created:Ljava/util/Date;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->updated:Ljava/util/Date;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->displayName:Ljava/lang/String;

    iget-object v6, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->isEmmManaged:Ljava/lang/Boolean;

    iget-object v7, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->platform:Ljava/lang/String;

    iget-object v8, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->macAddress:Ljava/lang/String;

    iget-object v9, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->osVersion:Ljava/lang/String;

    iget-object v10, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->deviceType:Ljava/lang/String;

    iget-object v11, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->clientVersion:Ljava/lang/String;

    iget-object v12, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->legacyUniqId:Ljava/lang/String;

    invoke-direct/range {v0 .. v12}, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo;-><init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Lcom/dropbox/core/v2/teamlog/SessionLogInfo;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withClientVersion(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;
    .locals 0

    .line 357
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->clientVersion:Ljava/lang/String;

    return-object p0
.end method

.method public bridge synthetic withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
    .locals 0

    .line 234
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;
    .locals 0

    .line 395
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;

    return-object p0
.end method

.method public withDeviceType(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;
    .locals 0

    .line 344
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->deviceType:Ljava/lang/String;

    return-object p0
.end method

.method public withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;
    .locals 0

    .line 279
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->displayName:Ljava/lang/String;

    return-object p0
.end method

.method public bridge synthetic withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
    .locals 0

    .line 234
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;
    .locals 0

    .line 383
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;

    return-object p0
.end method

.method public withIsEmmManaged(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;
    .locals 0

    .line 292
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->isEmmManaged:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withLegacyUniqId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;
    .locals 0

    .line 370
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->legacyUniqId:Ljava/lang/String;

    return-object p0
.end method

.method public withMacAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;
    .locals 0

    .line 318
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->macAddress:Ljava/lang/String;

    return-object p0
.end method

.method public withOsVersion(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;
    .locals 0

    .line 331
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->osVersion:Ljava/lang/String;

    return-object p0
.end method

.method public withPlatform(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;
    .locals 0

    .line 305
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->platform:Ljava/lang/String;

    return-object p0
.end method

.method public withSessionInfo(Lcom/dropbox/core/v2/teamlog/SessionLogInfo;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;
    .locals 0

    .line 266
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    return-object p0
.end method

.method public bridge synthetic withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
    .locals 0

    .line 234
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;->withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/LegacyDeviceSessionLogInfo$Builder;
    .locals 0

    .line 407
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;

    return-object p0
.end method
