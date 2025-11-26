.class public Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;
.super Ljava/lang/Object;
.source "LegalHoldsActivateAHoldDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails$Serializer;
    }
.end annotation


# instance fields
.field protected final endDate:Ljava/util/Date;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final legalHoldId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final name:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final startDate:Ljava/util/Date;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 79
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    .line 54
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->legalHoldId:Ljava/lang/String;

    if-eqz p2, :cond_1

    .line 58
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->name:Ljava/lang/String;

    if-eqz p3, :cond_0

    .line 62
    invoke-static {p3}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->startDate:Ljava/util/Date;

    .line 63
    invoke-static {p4}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->endDate:Ljava/util/Date;

    return-void

    .line 60
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'startDate\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 56
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'name\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 52
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'legalHoldId\' is null"

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

    .line 142
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 143
    check-cast p1, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;

    .line 144
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->legalHoldId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->legalHoldId:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->name:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    .line 145
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->startDate:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->startDate:Ljava/util/Date;

    if-eq v2, v3, :cond_4

    .line 146
    invoke-virtual {v2, v3}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->endDate:Ljava/util/Date;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->endDate:Ljava/util/Date;

    if-eq v2, p1, :cond_6

    if-eqz v2, :cond_5

    .line 147
    invoke-virtual {v2, p1}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getEndDate()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 119
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->endDate:Ljava/util/Date;

    return-object v0
.end method

.method public getLegalHoldId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 89
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->legalHoldId:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 99
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getStartDate()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 109
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->startDate:Ljava/util/Date;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 124
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->legalHoldId:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->startDate:Ljava/util/Date;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails;->endDate:Ljava/util/Date;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 157
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 169
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/LegalHoldsActivateAHoldDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
