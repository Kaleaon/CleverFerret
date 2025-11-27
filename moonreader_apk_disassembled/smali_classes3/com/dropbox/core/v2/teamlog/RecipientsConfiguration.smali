.class public Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;
.super Ljava/lang/Object;
.source "RecipientsConfiguration.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Serializer;,
        Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;
    }
.end annotation


# instance fields
.field protected final emails:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final groups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final recipientSettingType:Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 80
    invoke-direct {p0, v0, v0, v0}, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;-><init>(Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .param p1    # Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->recipientSettingType:Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;

    if-eqz p2, :cond_2

    .line 54
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 58
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 59
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Stringan item in list \'emails\' is longer than 255"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 56
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'emails\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 63
    :cond_2
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->emails:Ljava/util/List;

    if-eqz p3, :cond_4

    .line 65
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    if-eqz p2, :cond_3

    goto :goto_1

    .line 67
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'groups\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 71
    :cond_4
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->groups:Ljava/util/List;

    return-void
.end method

.method public static newBuilder()Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;
    .locals 1

    .line 119
    new-instance v0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Builder;-><init>()V

    return-object v0
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

    .line 228
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 229
    check-cast p1, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;

    .line 230
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->recipientSettingType:Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->recipientSettingType:Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;

    if-eq v2, v3, :cond_2

    if-eqz v2, :cond_4

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->emails:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->emails:Ljava/util/List;

    if-eq v2, v3, :cond_3

    if-eqz v2, :cond_4

    .line 231
    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->groups:Ljava/util/List;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->groups:Ljava/util/List;

    if-eq v2, p1, :cond_5

    if-eqz v2, :cond_4

    .line 232
    invoke-interface {v2, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    :cond_6
    return v1
.end method

.method public getEmails()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 100
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->emails:Ljava/util/List;

    return-object v0
.end method

.method public getGroups()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 110
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->groups:Ljava/util/List;

    return-object v0
.end method

.method public getRecipientSettingType()Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 90
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->recipientSettingType:Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 211
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->recipientSettingType:Lcom/dropbox/core/v2/teamlog/AlertRecipientsSettingType;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->emails:Ljava/util/List;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->groups:Ljava/util/List;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 242
    sget-object v0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 254
    sget-object v0, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
