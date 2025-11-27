.class public Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;
.super Ljava/lang/Object;
.source "SharingAllowlistAddArgs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected domains:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected emails:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 117
    iput-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;->domains:Ljava/util/List;

    .line 118
    iput-object v0, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;->emails:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;
    .locals 3

    .line 176
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;->domains:Ljava/util/List;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;->emails:Ljava/util/List;

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs;-><init>(Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method public withDomains(Ljava/util/List;)Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 135
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 137
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'domains\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 141
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;->domains:Ljava/util/List;

    return-object p0
.end method

.method public withEmails(Ljava/util/List;)Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 159
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 161
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'emails\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 165
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistAddArgs$Builder;->emails:Ljava/util/List;

    return-object p0
.end method
