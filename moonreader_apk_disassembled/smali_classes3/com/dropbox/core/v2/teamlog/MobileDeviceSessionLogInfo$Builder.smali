.class public Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;
.super Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
.source "MobileDeviceSessionLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final clientType:Lcom/dropbox/core/v2/team/MobileClientPlatform;

.field protected clientVersion:Ljava/lang/String;

.field protected final deviceName:Ljava/lang/String;

.field protected lastCarrier:Ljava/lang/String;

.field protected osVersion:Ljava/lang/String;

.field protected sessionInfo:Lcom/dropbox/core/v2/teamlog/MobileSessionLogInfo;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Lcom/dropbox/core/v2/team/MobileClientPlatform;)V
    .locals 0

    .line 211
    invoke-direct {p0}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;-><init>()V

    if-eqz p1, :cond_1

    .line 215
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->deviceName:Ljava/lang/String;

    if-eqz p2, :cond_0

    .line 219
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->clientType:Lcom/dropbox/core/v2/team/MobileClientPlatform;

    const/4 p1, 0x0

    .line 220
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->sessionInfo:Lcom/dropbox/core/v2/teamlog/MobileSessionLogInfo;

    .line 221
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->clientVersion:Ljava/lang/String;

    .line 222
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->osVersion:Ljava/lang/String;

    .line 223
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->lastCarrier:Ljava/lang/String;

    return-void

    .line 217
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'clientType\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 213
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'deviceName\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public bridge synthetic build()Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo;
    .locals 1

    .line 202
    invoke-virtual {p0}, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->build()Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;
    .locals 10

    .line 318
    new-instance v0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->deviceName:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->clientType:Lcom/dropbox/core/v2/team/MobileClientPlatform;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->ipAddress:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->created:Ljava/util/Date;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->updated:Ljava/util/Date;

    iget-object v6, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->sessionInfo:Lcom/dropbox/core/v2/teamlog/MobileSessionLogInfo;

    iget-object v7, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->clientVersion:Ljava/lang/String;

    iget-object v8, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->osVersion:Ljava/lang/String;

    iget-object v9, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->lastCarrier:Ljava/lang/String;

    invoke-direct/range {v0 .. v9}, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/team/MobileClientPlatform;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Lcom/dropbox/core/v2/teamlog/MobileSessionLogInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withClientVersion(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;
    .locals 0

    .line 246
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->clientVersion:Ljava/lang/String;

    return-object p0
.end method

.method public bridge synthetic withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
    .locals 0

    .line 202
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;
    .locals 0

    .line 295
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
    .locals 0

    .line 202
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;
    .locals 0

    .line 283
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;

    return-object p0
.end method

.method public withLastCarrier(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;
    .locals 0

    .line 270
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->lastCarrier:Ljava/lang/String;

    return-object p0
.end method

.method public withOsVersion(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;
    .locals 0

    .line 258
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->osVersion:Ljava/lang/String;

    return-object p0
.end method

.method public withSessionInfo(Lcom/dropbox/core/v2/teamlog/MobileSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;
    .locals 0

    .line 234
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->sessionInfo:Lcom/dropbox/core/v2/teamlog/MobileSessionLogInfo;

    return-object p0
.end method

.method public bridge synthetic withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
    .locals 0

    .line 202
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;->withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/MobileDeviceSessionLogInfo$Builder;
    .locals 0

    .line 307
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;

    return-object p0
.end method
