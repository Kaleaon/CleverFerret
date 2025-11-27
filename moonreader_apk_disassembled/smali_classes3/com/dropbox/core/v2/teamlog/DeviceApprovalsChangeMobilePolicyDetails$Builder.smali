.class public Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeMobilePolicyDetails$Builder;
.super Ljava/lang/Object;
.source "DeviceApprovalsChangeMobilePolicyDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeMobilePolicyDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected newValue:Lcom/dropbox/core/v2/teamlog/DeviceApprovalsPolicy;

.field protected previousValue:Lcom/dropbox/core/v2/teamlog/DeviceApprovalsPolicy;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 101
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeMobilePolicyDetails$Builder;->newValue:Lcom/dropbox/core/v2/teamlog/DeviceApprovalsPolicy;

    .line 102
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeMobilePolicyDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/DeviceApprovalsPolicy;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeMobilePolicyDetails;
    .locals 3

    .line 140
    new-instance v0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeMobilePolicyDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeMobilePolicyDetails$Builder;->newValue:Lcom/dropbox/core/v2/teamlog/DeviceApprovalsPolicy;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeMobilePolicyDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/DeviceApprovalsPolicy;

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeMobilePolicyDetails;-><init>(Lcom/dropbox/core/v2/teamlog/DeviceApprovalsPolicy;Lcom/dropbox/core/v2/teamlog/DeviceApprovalsPolicy;)V

    return-object v0
.end method

.method public withNewValue(Lcom/dropbox/core/v2/teamlog/DeviceApprovalsPolicy;)Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeMobilePolicyDetails$Builder;
    .locals 0

    .line 114
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeMobilePolicyDetails$Builder;->newValue:Lcom/dropbox/core/v2/teamlog/DeviceApprovalsPolicy;

    return-object p0
.end method

.method public withPreviousValue(Lcom/dropbox/core/v2/teamlog/DeviceApprovalsPolicy;)Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeMobilePolicyDetails$Builder;
    .locals 0

    .line 127
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeMobilePolicyDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/DeviceApprovalsPolicy;

    return-object p0
.end method
