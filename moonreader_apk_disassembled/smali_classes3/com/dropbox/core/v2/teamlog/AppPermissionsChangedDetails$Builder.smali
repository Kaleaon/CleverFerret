.class public Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;
.super Ljava/lang/Object;
.source "AppPermissionsChangedDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected appName:Ljava/lang/String;

.field protected final newValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

.field protected permission:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;

.field protected final previousValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;)V
    .locals 0

    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 148
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    if-eqz p2, :cond_0

    .line 152
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;->newValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    const/4 p1, 0x0

    .line 153
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;->appName:Ljava/lang/String;

    .line 154
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;->permission:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;

    return-void

    .line 150
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'newValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 146
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'previousValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;
    .locals 5

    .line 188
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;->newValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;->appName:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;->permission:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;-><init>(Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;)V

    return-object v0
.end method

.method public withAppName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;
    .locals 0

    .line 165
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;->appName:Ljava/lang/String;

    return-object p0
.end method

.method public withPermission(Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;)Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;
    .locals 0

    .line 177
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;->permission:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;

    return-object p0
.end method
