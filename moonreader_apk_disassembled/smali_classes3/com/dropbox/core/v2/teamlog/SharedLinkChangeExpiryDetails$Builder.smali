.class public Lcom/dropbox/core/v2/teamlog/SharedLinkChangeExpiryDetails$Builder;
.super Ljava/lang/Object;
.source "SharedLinkChangeExpiryDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/SharedLinkChangeExpiryDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected newValue:Ljava/util/Date;

.field protected previousValue:Ljava/util/Date;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 100
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkChangeExpiryDetails$Builder;->newValue:Ljava/util/Date;

    .line 101
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkChangeExpiryDetails$Builder;->previousValue:Ljava/util/Date;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/SharedLinkChangeExpiryDetails;
    .locals 3

    .line 137
    new-instance v0, Lcom/dropbox/core/v2/teamlog/SharedLinkChangeExpiryDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkChangeExpiryDetails$Builder;->newValue:Ljava/util/Date;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkChangeExpiryDetails$Builder;->previousValue:Ljava/util/Date;

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/SharedLinkChangeExpiryDetails;-><init>(Ljava/util/Date;Ljava/util/Date;)V

    return-object v0
.end method

.method public withNewValue(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/SharedLinkChangeExpiryDetails$Builder;
    .locals 0

    .line 113
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkChangeExpiryDetails$Builder;->newValue:Ljava/util/Date;

    return-object p0
.end method

.method public withPreviousValue(Ljava/util/Date;)Lcom/dropbox/core/v2/teamlog/SharedLinkChangeExpiryDetails$Builder;
    .locals 0

    .line 126
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/SharedLinkChangeExpiryDetails$Builder;->previousValue:Ljava/util/Date;

    return-object p0
.end method
