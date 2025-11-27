.class public Lcom/dropbox/core/v2/teamlog/FileRequestCloseDetails$Builder;
.super Ljava/lang/Object;
.source "FileRequestCloseDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/FileRequestCloseDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected fileRequestId:Ljava/lang/String;

.field protected previousDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 109
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileRequestCloseDetails$Builder;->fileRequestId:Ljava/lang/String;

    .line 110
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileRequestCloseDetails$Builder;->previousDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/FileRequestCloseDetails;
    .locals 3

    .line 158
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FileRequestCloseDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestCloseDetails$Builder;->fileRequestId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileRequestCloseDetails$Builder;->previousDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/FileRequestCloseDetails;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/FileRequestDetails;)V

    return-object v0
.end method

.method public withFileRequestId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileRequestCloseDetails$Builder;
    .locals 2

    if-eqz p1, :cond_2

    .line 127
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 130
    const-string v0, "[-_0-9a-zA-Z]+"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 131
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'fileRequestId\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 128
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'fileRequestId\' is shorter than 1"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 134
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestCloseDetails$Builder;->fileRequestId:Ljava/lang/String;

    return-object p0
.end method

.method public withPreviousDetails(Lcom/dropbox/core/v2/teamlog/FileRequestDetails;)Lcom/dropbox/core/v2/teamlog/FileRequestCloseDetails$Builder;
    .locals 0

    .line 147
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileRequestCloseDetails$Builder;->previousDetails:Lcom/dropbox/core/v2/teamlog/FileRequestDetails;

    return-object p0
.end method
