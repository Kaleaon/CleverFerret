.class public Lcom/dropbox/core/v2/teamlog/PaperDocChangeSharingPolicyDetails$Builder;
.super Ljava/lang/Object;
.source "PaperDocChangeSharingPolicyDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/PaperDocChangeSharingPolicyDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final eventUuid:Ljava/lang/String;

.field protected publicSharingPolicy:Ljava/lang/String;

.field protected teamSharingPolicy:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 128
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/PaperDocChangeSharingPolicyDetails$Builder;->eventUuid:Ljava/lang/String;

    const/4 p1, 0x0

    .line 129
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/PaperDocChangeSharingPolicyDetails$Builder;->publicSharingPolicy:Ljava/lang/String;

    .line 130
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/PaperDocChangeSharingPolicyDetails$Builder;->teamSharingPolicy:Ljava/lang/String;

    return-void

    .line 126
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'eventUuid\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/PaperDocChangeSharingPolicyDetails;
    .locals 4

    .line 164
    new-instance v0, Lcom/dropbox/core/v2/teamlog/PaperDocChangeSharingPolicyDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/PaperDocChangeSharingPolicyDetails$Builder;->eventUuid:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/PaperDocChangeSharingPolicyDetails$Builder;->publicSharingPolicy:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/PaperDocChangeSharingPolicyDetails$Builder;->teamSharingPolicy:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/teamlog/PaperDocChangeSharingPolicyDetails;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withPublicSharingPolicy(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/PaperDocChangeSharingPolicyDetails$Builder;
    .locals 0

    .line 141
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/PaperDocChangeSharingPolicyDetails$Builder;->publicSharingPolicy:Ljava/lang/String;

    return-object p0
.end method

.method public withTeamSharingPolicy(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/PaperDocChangeSharingPolicyDetails$Builder;
    .locals 0

    .line 153
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/PaperDocChangeSharingPolicyDetails$Builder;->teamSharingPolicy:Ljava/lang/String;

    return-object p0
.end method
