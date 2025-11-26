.class public Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;
.super Ljava/lang/Object;
.source "AdminAlertingAlertConfiguration.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Serializer;,
        Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;
    }
.end annotation


# instance fields
.field protected final alertState:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final excludedFileExtensions:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final recipientsSettings:Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final sensitivityLevel:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final text:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    .line 65
    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;-><init>(Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->alertState:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;

    .line 53
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->sensitivityLevel:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;

    .line 54
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->recipientsSettings:Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;

    .line 55
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->text:Ljava/lang/String;

    .line 56
    iput-object p5, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->excludedFileExtensions:Ljava/lang/String;

    return-void
.end method

.method public static newBuilder()Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;
    .locals 1

    .line 124
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;

    invoke-direct {v0}, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;-><init>()V

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

    .line 238
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 239
    check-cast p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;

    .line 240
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->alertState:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->alertState:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;

    if-eq v2, v3, :cond_2

    if-eqz v2, :cond_6

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->sensitivityLevel:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->sensitivityLevel:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;

    if-eq v2, v3, :cond_3

    if-eqz v2, :cond_6

    .line 241
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->recipientsSettings:Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->recipientsSettings:Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;

    if-eq v2, v3, :cond_4

    if-eqz v2, :cond_6

    .line 242
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->text:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->text:Ljava/lang/String;

    if-eq v2, v3, :cond_5

    if-eqz v2, :cond_6

    .line 243
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->excludedFileExtensions:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->excludedFileExtensions:Ljava/lang/String;

    if-eq v2, p1, :cond_7

    if-eqz v2, :cond_6

    .line 244
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    goto :goto_0

    :cond_6
    return v1

    :cond_7
    :goto_0
    return v0

    :cond_8
    return v1
.end method

.method public getAlertState()Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 75
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->alertState:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;

    return-object v0
.end method

.method public getExcludedFileExtensions()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 115
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->excludedFileExtensions:Ljava/lang/String;

    return-object v0
.end method

.method public getRecipientsSettings()Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 95
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->recipientsSettings:Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;

    return-object v0
.end method

.method public getSensitivityLevel()Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 85
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->sensitivityLevel:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 105
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->text:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 7

    .line 219
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->alertState:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->sensitivityLevel:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->recipientsSettings:Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->text:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;->excludedFileExtensions:Ljava/lang/String;

    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v0, 0x1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    aput-object v2, v5, v0

    const/4 v0, 0x3

    aput-object v3, v5, v0

    const/4 v0, 0x4

    aput-object v4, v5, v0

    invoke-static {v5}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 254
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 266
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
