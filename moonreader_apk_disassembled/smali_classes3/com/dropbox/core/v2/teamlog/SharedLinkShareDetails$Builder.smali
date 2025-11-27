.class public Lcom/dropbox/core/v2/teamlog/SharedLinkShareDetails$Builder;
.super Ljava/lang/Object;
.source "SharedLinkShareDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/SharedLinkShareDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected externalUsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/ExternalUserLogInfo;",
            ">;"
        }
    .end annotation
.end field

.field protected sharedLinkOwner:Lcom/dropbox/core/v2/teamlog/UserLogInfo;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 107
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkShareDetails$Builder;->sharedLinkOwner:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    .line 108
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkShareDetails$Builder;->externalUsers:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/SharedLinkShareDetails;
    .locals 3

    .line 154
    new-instance v0, Lcom/dropbox/core/v2/teamlog/SharedLinkShareDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkShareDetails$Builder;->sharedLinkOwner:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkShareDetails$Builder;->externalUsers:Ljava/util/List;

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/SharedLinkShareDetails;-><init>(Lcom/dropbox/core/v2/teamlog/UserLogInfo;Ljava/util/List;)V

    return-object v0
.end method

.method public withExternalUsers(Ljava/util/List;)Lcom/dropbox/core/v2/teamlog/SharedLinkShareDetails$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/ExternalUserLogInfo;",
            ">;)",
            "Lcom/dropbox/core/v2/teamlog/SharedLinkShareDetails$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 137
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/teamlog/ExternalUserLogInfo;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 139
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'externalUsers\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 143
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkShareDetails$Builder;->externalUsers:Ljava/util/List;

    return-object p0
.end method

.method public withSharedLinkOwner(Lcom/dropbox/core/v2/teamlog/UserLogInfo;)Lcom/dropbox/core/v2/teamlog/SharedLinkShareDetails$Builder;
    .locals 0

    .line 120
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkShareDetails$Builder;->sharedLinkOwner:Lcom/dropbox/core/v2/teamlog/UserLogInfo;

    return-object p0
.end method
