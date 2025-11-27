.class public Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo$Builder;
.super Ljava/lang/Object;
.source "FailureDetailsLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected technicalErrorMessage:Ljava/lang/String;

.field protected userFriendlyMessage:Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 95
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo$Builder;->userFriendlyMessage:Ljava/lang/String;

    .line 96
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo$Builder;->technicalErrorMessage:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;
    .locals 3

    .line 131
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo$Builder;->userFriendlyMessage:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo$Builder;->technicalErrorMessage:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withTechnicalErrorMessage(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo$Builder;
    .locals 0

    .line 120
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo$Builder;->technicalErrorMessage:Ljava/lang/String;

    return-object p0
.end method

.method public withUserFriendlyMessage(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo$Builder;
    .locals 0

    .line 107
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo$Builder;->userFriendlyMessage:Ljava/lang/String;

    return-object p0
.end method
