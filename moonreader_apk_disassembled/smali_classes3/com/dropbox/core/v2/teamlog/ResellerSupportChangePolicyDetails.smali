.class public Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails;
.super Ljava/lang/Object;
.source "ResellerSupportChangePolicyDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails$Serializer;
    }
.end annotation


# instance fields
.field protected final newValue:Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final previousValue:Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 46
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;

    if-eqz p2, :cond_0

    .line 50
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;

    return-void

    .line 48
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'previousValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 44
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'newValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
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

    .line 91
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 92
    check-cast p1, Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails;

    .line 93
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;

    if-eq v2, p1, :cond_4

    .line 94
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;->equals(Ljava/lang/Object;)Z

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

.method public getNewValue()Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 60
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;

    return-object v0
.end method

.method public getPreviousValue()Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 70
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 75
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/ResellerSupportPolicy;

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

    .line 104
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 116
    sget-object v0, Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/ResellerSupportChangePolicyDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
