.class public Lcom/dropbox/core/v2/teamlog/RansomwareAlertCreateReportFailedDetails;
.super Ljava/lang/Object;
.source "RansomwareAlertCreateReportFailedDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/RansomwareAlertCreateReportFailedDetails$Serializer;
    }
.end annotation


# instance fields
.field protected final failureReason:Lcom/dropbox/core/v2/team/TeamReportFailureReason;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/team/TeamReportFailureReason;)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/team/TeamReportFailureReason;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 43
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/RansomwareAlertCreateReportFailedDetails;->failureReason:Lcom/dropbox/core/v2/team/TeamReportFailureReason;

    return-void

    .line 41
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'failureReason\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

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

    .line 73
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 74
    check-cast p1, Lcom/dropbox/core/v2/teamlog/RansomwareAlertCreateReportFailedDetails;

    .line 75
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/RansomwareAlertCreateReportFailedDetails;->failureReason:Lcom/dropbox/core/v2/team/TeamReportFailureReason;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/RansomwareAlertCreateReportFailedDetails;->failureReason:Lcom/dropbox/core/v2/team/TeamReportFailureReason;

    if-eq v2, p1, :cond_3

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamReportFailureReason;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    return v1

    :cond_3
    :goto_0
    return v0

    :cond_4
    return v1
.end method

.method public getFailureReason()Lcom/dropbox/core/v2/team/TeamReportFailureReason;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/RansomwareAlertCreateReportFailedDetails;->failureReason:Lcom/dropbox/core/v2/team/TeamReportFailureReason;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 58
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/RansomwareAlertCreateReportFailedDetails;->failureReason:Lcom/dropbox/core/v2/team/TeamReportFailureReason;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 84
    sget-object v0, Lcom/dropbox/core/v2/teamlog/RansomwareAlertCreateReportFailedDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/RansomwareAlertCreateReportFailedDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/RansomwareAlertCreateReportFailedDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 96
    sget-object v0, Lcom/dropbox/core/v2/teamlog/RansomwareAlertCreateReportFailedDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/RansomwareAlertCreateReportFailedDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/RansomwareAlertCreateReportFailedDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
