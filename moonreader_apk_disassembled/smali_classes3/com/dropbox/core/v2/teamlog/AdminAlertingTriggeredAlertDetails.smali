.class public Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;
.super Ljava/lang/Object;
.source "AdminAlertingTriggeredAlertDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails$Serializer;
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


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;Ljava/lang/String;)V
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

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 51
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertName:Ljava/lang/String;

    if-eqz p2, :cond_2

    .line 55
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertSeverity:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    if-eqz p3, :cond_1

    .line 59
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertCategory:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    if-eqz p4, :cond_0

    .line 63
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertInstanceId:Ljava/lang/String;

    return-void

    .line 61
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'alertInstanceId\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 57
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'alertCategory\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 53
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'alertSeverity\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 49
    :cond_3
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

    .line 126
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 127
    check-cast p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;

    .line 128
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertName:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertSeverity:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertSeverity:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    if-eq v2, v3, :cond_3

    .line 129
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertCategory:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertCategory:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    if-eq v2, v3, :cond_4

    .line 130
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertInstanceId:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertInstanceId:Ljava/lang/String;

    if-eq v2, p1, :cond_6

    .line 131
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public getAlertCategory()Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertCategory:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    return-object v0
.end method

.method public getAlertInstanceId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 103
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertInstanceId:Ljava/lang/String;

    return-object v0
.end method

.method public getAlertName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 73
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertName:Ljava/lang/String;

    return-object v0
.end method

.method public getAlertSeverity()Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 83
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertSeverity:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 108
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertName:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertSeverity:Lcom/dropbox/core/v2/teamlog/AdminAlertSeverityEnum;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertCategory:Lcom/dropbox/core/v2/teamlog/AdminAlertCategoryEnum;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails;->alertInstanceId:Ljava/lang/String;

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

    .line 141
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 153
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/AdminAlertingTriggeredAlertDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
