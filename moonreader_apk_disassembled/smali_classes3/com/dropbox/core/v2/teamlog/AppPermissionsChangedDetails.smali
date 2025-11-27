.class public Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;
.super Ljava/lang/Object;
.source "AppPermissionsChangedDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;,
        Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;
    }
.end annotation


# instance fields
.field protected final appName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final newValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final permission:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final previousValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 76
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;-><init>(Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;Ljava/lang/String;Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->appName:Ljava/lang/String;

    .line 53
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->permission:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;

    if-eqz p1, :cond_1

    .line 57
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    if-eqz p2, :cond_0

    .line 61
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->newValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    return-void

    .line 59
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'newValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 55
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'previousValue\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;)Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;
    .locals 1

    .line 131
    new-instance v0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Builder;-><init>(Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;)V

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

    .line 212
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 213
    check-cast p1, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;

    .line 214
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->newValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->newValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    if-eq v2, v3, :cond_3

    .line 215
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->appName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->appName:Ljava/lang/String;

    if-eq v2, v3, :cond_4

    if-eqz v2, :cond_5

    .line 216
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->permission:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->permission:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;

    if-eq v2, p1, :cond_6

    if-eqz v2, :cond_5

    .line 217
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getAppName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 106
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->appName:Ljava/lang/String;

    return-object v0
.end method

.method public getNewValue()Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 96
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->newValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    return-object v0
.end method

.method public getPermission()Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 116
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->permission:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;

    return-object v0
.end method

.method public getPreviousValue()Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 86
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 194
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->appName:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->permission:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPermission;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails;->newValue:Lcom/dropbox/core/v2/teamlog/AdminConsoleAppPolicy;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 227
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 239
    sget-object v0, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/AppPermissionsChangedDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
