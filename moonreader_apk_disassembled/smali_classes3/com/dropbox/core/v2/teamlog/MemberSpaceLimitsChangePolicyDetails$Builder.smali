.class public Lcom/dropbox/core/v2/teamlog/MemberSpaceLimitsChangePolicyDetails$Builder;
.super Ljava/lang/Object;
.source "MemberSpaceLimitsChangePolicyDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/MemberSpaceLimitsChangePolicyDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected newValue:Ljava/lang/Long;

.field protected previousValue:Ljava/lang/Long;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 98
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/MemberSpaceLimitsChangePolicyDetails$Builder;->previousValue:Ljava/lang/Long;

    .line 99
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/MemberSpaceLimitsChangePolicyDetails$Builder;->newValue:Ljava/lang/Long;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/MemberSpaceLimitsChangePolicyDetails;
    .locals 3

    .line 135
    new-instance v0, Lcom/dropbox/core/v2/teamlog/MemberSpaceLimitsChangePolicyDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/MemberSpaceLimitsChangePolicyDetails$Builder;->previousValue:Ljava/lang/Long;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/MemberSpaceLimitsChangePolicyDetails$Builder;->newValue:Ljava/lang/Long;

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/MemberSpaceLimitsChangePolicyDetails;-><init>(Ljava/lang/Long;Ljava/lang/Long;)V

    return-object v0
.end method

.method public withNewValue(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamlog/MemberSpaceLimitsChangePolicyDetails$Builder;
    .locals 0

    .line 124
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MemberSpaceLimitsChangePolicyDetails$Builder;->newValue:Ljava/lang/Long;

    return-object p0
.end method

.method public withPreviousValue(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamlog/MemberSpaceLimitsChangePolicyDetails$Builder;
    .locals 0

    .line 111
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MemberSpaceLimitsChangePolicyDetails$Builder;->previousValue:Ljava/lang/Long;

    return-object p0
.end method
