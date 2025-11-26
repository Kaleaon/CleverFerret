.class public Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Builder;
.super Ljava/lang/Object;
.source "DeviceUnlinkDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final deleteData:Z

.field protected displayName:Ljava/lang/String;

.field protected sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;


# direct methods
.method protected constructor <init>(Z)V
    .locals 0

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    iput-boolean p1, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Builder;->deleteData:Z

    const/4 p1, 0x0

    .line 117
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Builder;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    .line 118
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Builder;->displayName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;
    .locals 4

    .line 153
    new-instance v0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;

    iget-boolean v1, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Builder;->deleteData:Z

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Builder;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Builder;->displayName:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails;-><init>(ZLcom/dropbox/core/v2/teamlog/SessionLogInfo;Ljava/lang/String;)V

    return-object v0
.end method

.method public withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Builder;
    .locals 0

    .line 142
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Builder;->displayName:Ljava/lang/String;

    return-object p0
.end method

.method public withSessionInfo(Lcom/dropbox/core/v2/teamlog/SessionLogInfo;)Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Builder;
    .locals 0

    .line 129
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/DeviceUnlinkDetails$Builder;->sessionInfo:Lcom/dropbox/core/v2/teamlog/SessionLogInfo;

    return-object p0
.end method
