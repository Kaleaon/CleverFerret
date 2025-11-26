.class public Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
.super Ljava/lang/Object;
.source "DeviceSessionLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected created:Ljava/util/Date;

.field protected ipAddress:Ljava/lang/String;

.field protected updated:Ljava/util/Date;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 111
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->ipAddress:Ljava/lang/String;

    .line 112
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->created:Ljava/util/Date;

    .line 113
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->updated:Ljava/util/Date;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo;
    .locals 4

    .line 160
    new-instance v0, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->ipAddress:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->created:Ljava/util/Date;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->updated:Ljava/util/Date;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo;-><init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V

    return-object v0
.end method

.method public withCreated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
    .locals 0

    .line 137
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->created:Ljava/util/Date;

    return-object p0
.end method

.method public withIpAddress(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
    .locals 0

    .line 125
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->ipAddress:Ljava/lang/String;

    return-object p0
.end method

.method public withUpdated(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;
    .locals 0

    .line 149
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/DeviceSessionLogInfo$Builder;->updated:Ljava/util/Date;

    return-object p0
.end method
