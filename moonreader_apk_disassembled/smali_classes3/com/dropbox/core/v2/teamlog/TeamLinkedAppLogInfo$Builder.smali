.class public Lcom/dropbox/core/v2/teamlog/TeamLinkedAppLogInfo$Builder;
.super Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;
.source "TeamLinkedAppLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/TeamLinkedAppLogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 84
    invoke-direct {p0}, Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lcom/dropbox/core/v2/teamlog/AppLogInfo;
    .locals 1

    .line 82
    invoke-virtual {p0}, Lcom/dropbox/core/v2/teamlog/TeamLinkedAppLogInfo$Builder;->build()Lcom/dropbox/core/v2/teamlog/TeamLinkedAppLogInfo;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/dropbox/core/v2/teamlog/TeamLinkedAppLogInfo;
    .locals 3

    .line 118
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamLinkedAppLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/TeamLinkedAppLogInfo$Builder;->appId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamLinkedAppLogInfo$Builder;->displayName:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/TeamLinkedAppLogInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public bridge synthetic withAppId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;
    .locals 0

    .line 82
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/TeamLinkedAppLogInfo$Builder;->withAppId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/TeamLinkedAppLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withAppId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/TeamLinkedAppLogInfo$Builder;
    .locals 0

    .line 95
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;->withAppId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;
    .locals 0

    .line 82
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/TeamLinkedAppLogInfo$Builder;->withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/TeamLinkedAppLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/TeamLinkedAppLogInfo$Builder;
    .locals 0

    .line 107
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;->withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;

    return-object p0
.end method
