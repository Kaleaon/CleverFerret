.class public Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;
.super Ljava/lang/Object;
.source "AdminAlertingAlertConfiguration.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected alertState:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;

.field protected excludedFileExtensions:Ljava/lang/String;

.field protected recipientsSettings:Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;

.field protected sensitivityLevel:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;

.field protected text:Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 139
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;->alertState:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;

    .line 140
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;->sensitivityLevel:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;

    .line 141
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;->recipientsSettings:Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;

    .line 142
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;->text:Ljava/lang/String;

    .line 143
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;->excludedFileExtensions:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;
    .locals 6

    .line 213
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;->alertState:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;->sensitivityLevel:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;->recipientsSettings:Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;->text:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;->excludedFileExtensions:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration;-><init>(Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withAlertState(Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;)Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;
    .locals 0

    .line 154
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;->alertState:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertStatePolicy;

    return-object p0
.end method

.method public withExcludedFileExtensions(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;
    .locals 0

    .line 202
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;->excludedFileExtensions:Ljava/lang/String;

    return-object p0
.end method

.method public withRecipientsSettings(Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;)Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;
    .locals 0

    .line 178
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;->recipientsSettings:Lcom/dropbox/core/v2/teamlog/RecipientsConfiguration;

    return-object p0
.end method

.method public withSensitivityLevel(Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;)Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;
    .locals 0

    .line 166
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;->sensitivityLevel:Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertSensitivity;

    return-object p0
.end method

.method public withText(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;
    .locals 0

    .line 190
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AdminAlertingAlertConfiguration$Builder;->text:Ljava/lang/String;

    return-object p0
.end method
