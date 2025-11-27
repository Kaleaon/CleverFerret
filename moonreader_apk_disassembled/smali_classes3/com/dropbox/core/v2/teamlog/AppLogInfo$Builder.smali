.class public Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;
.super Ljava/lang/Object;
.source "AppLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/AppLogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected appId:Ljava/lang/String;

.field protected displayName:Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 94
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;->appId:Ljava/lang/String;

    .line 95
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;->displayName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/AppLogInfo;
    .locals 3

    .line 129
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AppLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;->appId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;->displayName:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/AppLogInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withAppId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;
    .locals 0

    .line 106
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;->appId:Ljava/lang/String;

    return-object p0
.end method

.method public withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;
    .locals 0

    .line 118
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AppLogInfo$Builder;->displayName:Ljava/lang/String;

    return-object p0
.end method
