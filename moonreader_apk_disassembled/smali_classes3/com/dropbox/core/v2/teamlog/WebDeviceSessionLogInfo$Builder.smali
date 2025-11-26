.class public Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;
.super Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
.source "WebDeviceSessionLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final browser:Ljava/lang/String;

.field protected final os:Ljava/lang/String;

.field protected sessionInfo:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

.field protected final userAgent:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 194
    invoke-direct {p0}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;-><init>()V

    if-eqz p1, :cond_2

    .line 198
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->userAgent:Ljava/lang/String;

    if-eqz p2, :cond_1

    .line 202
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->os:Ljava/lang/String;

    if-eqz p3, :cond_0

    .line 206
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->browser:Ljava/lang/String;

    const/4 p1, 0x0

    .line 207
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->sessionInfo:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    return-void

    .line 204
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'browser\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 200
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'os\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 196
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'userAgent\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public bridge synthetic build()Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo;
    .locals 1

    .line 187
    invoke-virtual {p0}, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->build()Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;
    .locals 8

    .line 266
    new-instance v0, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->userAgent:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->os:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->browser:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->ipAddress:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->created:Ljava/util/Date;

    iget-object v6, p0, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->updated:Ljava/util/Date;

    iget-object v7, p0, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->sessionInfo:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    invoke-direct/range {v0 .. v7}, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;)V

    return-object v0
.end method

.method public bridge synthetic withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
    .locals 0

    .line 187
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;
    .locals 0

    .line 243
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
    .locals 0

    .line 187
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;
    .locals 0

    .line 231
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;

    return-object p0
.end method

.method public withSessionInfo(Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;)Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;
    .locals 0

    .line 218
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->sessionInfo:Lcom/dropbox/core/v2/teamlog/WebSessionLogInfo;

    return-object p0
.end method

.method public bridge synthetic withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
    .locals 0

    .line 187
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;->withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/WebDeviceSessionLogInfo$Builder;
    .locals 0

    .line 255
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;

    return-object p0
.end method
