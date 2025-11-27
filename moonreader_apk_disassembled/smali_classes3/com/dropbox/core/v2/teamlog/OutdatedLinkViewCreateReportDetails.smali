.class public Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails;
.super Ljava/lang/Object;
.source "OutdatedLinkViewCreateReportDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails$Serializer;
    }
.end annotation


# instance fields
.field protected final endDate:Ljava/util/Date;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final startDate:Ljava/util/Date;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Date;Ljava/util/Date;)V
    .locals 0
    .param p1    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 47
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails;->startDate:Ljava/util/Date;

    if-eqz p2, :cond_0

    .line 51
    invoke-static {p2}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails;->endDate:Ljava/util/Date;

    return-void

    .line 49
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'endDate\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 45
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'startDate\' is null"

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

    .line 92
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 93
    check-cast p1, Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails;

    .line 94
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails;->startDate:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails;->startDate:Ljava/util/Date;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails;->endDate:Ljava/util/Date;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails;->endDate:Ljava/util/Date;

    if-eq v2, p1, :cond_4

    .line 95
    invoke-virtual {v2, p1}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

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

.method public getEndDate()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 71
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails;->endDate:Ljava/util/Date;

    return-object v0
.end method

.method public getStartDate()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 61
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails;->startDate:Ljava/util/Date;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 76
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails;->startDate:Ljava/util/Date;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails;->endDate:Ljava/util/Date;

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

    .line 105
    sget-object v0, Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 117
    sget-object v0, Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/OutdatedLinkViewCreateReportDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
