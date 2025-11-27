.class public Lcom/dropbox/core/v2/teamlog/GroupCreateDetails$Builder;
.super Ljava/lang/Object;
.source "GroupCreateDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/GroupCreateDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected isCompanyManaged:Ljava/lang/Boolean;

.field protected joinPolicy:Lcom/dropbox/core/v2/teamlog/GroupJoinPolicy;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 94
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/GroupCreateDetails$Builder;->isCompanyManaged:Ljava/lang/Boolean;

    .line 95
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/GroupCreateDetails$Builder;->joinPolicy:Lcom/dropbox/core/v2/teamlog/GroupJoinPolicy;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/GroupCreateDetails;
    .locals 3

    .line 129
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GroupCreateDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/GroupCreateDetails$Builder;->isCompanyManaged:Ljava/lang/Boolean;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/GroupCreateDetails$Builder;->joinPolicy:Lcom/dropbox/core/v2/teamlog/GroupJoinPolicy;

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/GroupCreateDetails;-><init>(Ljava/lang/Boolean;Lcom/dropbox/core/v2/teamlog/GroupJoinPolicy;)V

    return-object v0
.end method

.method public withIsCompanyManaged(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/teamlog/GroupCreateDetails$Builder;
    .locals 0

    .line 106
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GroupCreateDetails$Builder;->isCompanyManaged:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withJoinPolicy(Lcom/dropbox/core/v2/teamlog/GroupJoinPolicy;)Lcom/dropbox/core/v2/teamlog/GroupCreateDetails$Builder;
    .locals 0

    .line 118
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GroupCreateDetails$Builder;->joinPolicy:Lcom/dropbox/core/v2/teamlog/GroupJoinPolicy;

    return-object p0
.end method
