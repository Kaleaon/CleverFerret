.class public Lcom/dropbox/core/v2/teamlog/GroupLogInfo$Builder;
.super Ljava/lang/Object;
.source "GroupLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/GroupLogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final displayName:Ljava/lang/String;

.field protected externalId:Ljava/lang/String;

.field protected groupId:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 128
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GroupLogInfo$Builder;->displayName:Ljava/lang/String;

    const/4 p1, 0x0

    .line 129
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GroupLogInfo$Builder;->groupId:Ljava/lang/String;

    .line 130
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GroupLogInfo$Builder;->externalId:Ljava/lang/String;

    return-void

    .line 126
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'displayName\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/GroupLogInfo;
    .locals 4

    .line 164
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GroupLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/GroupLogInfo$Builder;->displayName:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GroupLogInfo$Builder;->groupId:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/GroupLogInfo$Builder;->externalId:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/teamlog/GroupLogInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withExternalId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/GroupLogInfo$Builder;
    .locals 0

    .line 153
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GroupLogInfo$Builder;->externalId:Ljava/lang/String;

    return-object p0
.end method

.method public withGroupId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/GroupLogInfo$Builder;
    .locals 0

    .line 141
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GroupLogInfo$Builder;->groupId:Ljava/lang/String;

    return-object p0
.end method
