.class public Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;
.super Ljava/lang/Object;
.source "RecipientsConfiguration.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected emails:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected groups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected recipientSettingType:Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 132
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;->recipientSettingType:Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;

    .line 133
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;->emails:Ljava/util/List;

    .line 134
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;->groups:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;
    .locals 4

    .line 205
    new-instance v0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;->recipientSettingType:Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;->emails:Ljava/util/List;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;->groups:Ljava/util/List;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;-><init>(Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method public withEmails(Ljava/util/List;)Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_2

    .line 162
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 166
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0xff

    if-gt v1, v2, :cond_0

    goto :goto_0

    .line 167
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Stringan item in list \'emails\' is longer than 255"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 164
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'emails\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 171
    :cond_2
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;->emails:Ljava/util/List;

    return-object p0
.end method

.method public withGroups(Ljava/util/List;)Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 188
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

    .line 190
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'groups\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 194
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;->groups:Ljava/util/List;

    return-object p0
.end method

.method public withRecipientSettingType(Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;)Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;
    .locals 0

    .line 145
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;->recipientSettingType:Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;

    return-object p0
.end method
