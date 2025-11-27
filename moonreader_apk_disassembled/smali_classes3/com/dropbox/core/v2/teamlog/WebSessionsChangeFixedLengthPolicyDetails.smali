.class public Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails;
.super Ljava/lang/Object;
.source "WebSessionsChangeFixedLengthPolicyDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails$Builder;
    }
.end annotation


# instance fields
.field protected final newValue:Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final previousValue:Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 55
    invoke-direct {p0, v0, v0}, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails;-><init>(Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;

    .line 46
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;

    return-void
.end method

.method public static newBuilder()Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails$Builder;
    .locals 1

    .line 85
    new-instance v0, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails$Builder;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails$Builder;-><init>()V

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

    .line 158
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 159
    check-cast p1, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails;

    .line 160
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;

    if-eq v2, v3, :cond_2

    if-eqz v2, :cond_3

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;

    if-eq v2, p1, :cond_4

    if-eqz v2, :cond_3

    .line 161
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;->equals(Ljava/lang/Object;)Z

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

.method public getNewValue()Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 65
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;

    return-object v0
.end method

.method public getPreviousValue()Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 76
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 142
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails;->newValue:Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/WebSessionsFixedLengthPolicy;

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

    .line 171
    sget-object v0, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 183
    sget-object v0, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/WebSessionsChangeFixedLengthPolicyDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
