.class public Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;
.super Ljava/lang/Object;
.source "AdminAlertingAlertStateChangedDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails$Serializer;
    }
.end annotation


# instance fields
.field protected final alertCategory:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final alertInstanceId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final alertName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final alertSeverity:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final newValue:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final previousValue:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p5    # Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p6    # Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_5

    .line 58
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertName:Ljava/lang/String;

    if-eqz p2, :cond_4

    .line 62
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertSeverity:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    if-eqz p3, :cond_3

    .line 66
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertCategory:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    if-eqz p4, :cond_2

    .line 70
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertInstanceId:Ljava/lang/String;

    if-eqz p5, :cond_1

    .line 74
    iput-object p5, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    if-eqz p6, :cond_0

    .line 78
    iput-object p6, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->newValue:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    return-void

    .line 76
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'newValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 72
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'previousValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 68
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'alertInstanceId\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 64
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'alertCategory\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 60
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'alertSeverity\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 56
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'alertName\' is null"

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

    .line 163
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 164
    check-cast p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;

    .line 165
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertName:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertSeverity:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertSeverity:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    if-eq v2, v3, :cond_3

    .line 166
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertCategory:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertCategory:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    if-eq v2, v3, :cond_4

    .line 167
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertInstanceId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertInstanceId:Ljava/lang/String;

    if-eq v2, v3, :cond_5

    .line 168
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    if-eq v2, v3, :cond_6

    .line 169
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->newValue:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->newValue:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    if-eq v2, p1, :cond_8

    .line 170
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_0

    :cond_7
    return v1

    :cond_8
    :goto_0
    return v0

    :cond_9
    return v1
.end method

.method public getAlertCategory()Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 108
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertCategory:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    return-object v0
.end method

.method public getAlertInstanceId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 118
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertInstanceId:Ljava/lang/String;

    return-object v0
.end method

.method public getAlertName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 88
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertName:Ljava/lang/String;

    return-object v0
.end method

.method public getAlertSeverity()Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 98
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertSeverity:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    return-object v0
.end method

.method public getNewValue()Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 138
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->newValue:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    return-object v0
.end method

.method public getPreviousValue()Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 128
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    return-object v0
.end method

.method public hashCode()I
    .locals 8

    .line 143
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertName:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertSeverity:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertCategory:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->alertInstanceId:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails;->newValue:Lcom/dropbox/core/v2/teamlog/AdminAlertGeneralStateEnum;

    const/4 v6, 0x6

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    const/4 v0, 0x1

    aput-object v1, v6, v0

    const/4 v0, 0x2

    aput-object v2, v6, v0

    const/4 v0, 0x3

    aput-object v3, v6, v0

    const/4 v0, 0x4

    aput-object v4, v6, v0

    const/4 v0, 0x5

    aput-object v5, v6, v0

    invoke-static {v6}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 180
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 192
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStateChangedDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
