.class public Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails;
.super Ljava/lang/Object;
.source "DeviceApprovalsChangeOverageActionDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails$Builder;
    }
.end annotation


# instance fields
.field protected final newValue:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final previousValue:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 56
    invoke-direct {p0, v0, v0}, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails;-><init>(Lcom/dropbox/core/v2/teampolicies/RolloutMethod;Lcom/dropbox/core/v2/teampolicies/RolloutMethod;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/teampolicies/RolloutMethod;Lcom/dropbox/core/v2/teampolicies/RolloutMethod;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/teampolicies/RolloutMethod;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/teampolicies/RolloutMethod;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails;->newValue:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    .line 47
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails;->previousValue:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    return-void
.end method

.method public static newBuilder()Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails$Builder;
    .locals 1

    .line 86
    new-instance v0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails$Builder;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails$Builder;-><init>()V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 159
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 160
    check-cast p1, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails;

    .line 161
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails;->newValue:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails;->newValue:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    if-eq v2, v3, :cond_2

    if-eqz v2, :cond_3

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teampolicies/RolloutMethod;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails;->previousValue:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails;->previousValue:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    if-eq v2, p1, :cond_4

    if-eqz v2, :cond_3

    .line 162
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teampolicies/RolloutMethod;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    :cond_5
    return v1
.end method

.method public getNewValue()Lcom/dropbox/core/v2/teampolicies/RolloutMethod;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 66
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails;->newValue:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    return-object v0
.end method

.method public getPreviousValue()Lcom/dropbox/core/v2/teampolicies/RolloutMethod;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails;->previousValue:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 143
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails;->newValue:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails;->previousValue:Lcom/dropbox/core/v2/teampolicies/RolloutMethod;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 172
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 184
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/DeviceApprovalsChangeOverageActionDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
