.class public final Lcom/google/android/gms/auth/api/identity/Identity;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-auth@@20.7.0"


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAuthorizationClient(Landroid/app/Activity;)Lcom/google/android/gms/auth/api/identity/AuthorizationClient;
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/auth-api/zbaq;

    .line 2
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    new-instance v1, Lcom/google/android/gms/auth/api/identity/zbb;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/google/android/gms/auth/api/identity/zbb;-><init>(Lcom/google/android/gms/auth/api/identity/zba;)V

    invoke-virtual {v1}, Lcom/google/android/gms/auth/api/identity/zbb;->zbb()Lcom/google/android/gms/auth/api/identity/zbc;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/auth-api/zbaq;-><init>(Landroid/app/Activity;Lcom/google/android/gms/auth/api/identity/zbc;)V

    return-object v0
.end method

.method public static getAuthorizationClient(Landroid/content/Context;)Lcom/google/android/gms/auth/api/identity/AuthorizationClient;
    .locals 3

    .line 3
    new-instance v0, Lcom/google/android/gms/internal/auth-api/zbaq;

    .line 4
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    new-instance v1, Lcom/google/android/gms/auth/api/identity/zbb;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/google/android/gms/auth/api/identity/zbb;-><init>(Lcom/google/android/gms/auth/api/identity/zba;)V

    invoke-virtual {v1}, Lcom/google/android/gms/auth/api/identity/zbb;->zbb()Lcom/google/android/gms/auth/api/identity/zbc;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/auth-api/zbaq;-><init>(Landroid/content/Context;Lcom/google/android/gms/auth/api/identity/zbc;)V

    return-object v0
.end method

.method public static getCredentialSavingClient(Landroid/app/Activity;)Lcom/google/android/gms/auth/api/identity/CredentialSavingClient;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/auth-api/zbaw;

    .line 2
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    new-instance v1, Lcom/google/android/gms/auth/api/identity/zbh;

    invoke-direct {v1}, Lcom/google/android/gms/auth/api/identity/zbh;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/auth-api/zbaw;-><init>(Landroid/app/Activity;Lcom/google/android/gms/auth/api/identity/zbh;)V

    return-object v0
.end method

.method public static getCredentialSavingClient(Landroid/content/Context;)Lcom/google/android/gms/auth/api/identity/CredentialSavingClient;
    .locals 2

    .line 3
    new-instance v0, Lcom/google/android/gms/internal/auth-api/zbaw;

    .line 4
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    new-instance v1, Lcom/google/android/gms/auth/api/identity/zbh;

    invoke-direct {v1}, Lcom/google/android/gms/auth/api/identity/zbh;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/auth-api/zbaw;-><init>(Landroid/content/Context;Lcom/google/android/gms/auth/api/identity/zbh;)V

    return-object v0
.end method

.method public static getSignInClient(Landroid/app/Activity;)Lcom/google/android/gms/auth/api/identity/SignInClient;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/auth-api/zbbg;

    .line 2
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    new-instance v1, Lcom/google/android/gms/auth/api/identity/zbu;

    invoke-direct {v1}, Lcom/google/android/gms/auth/api/identity/zbu;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/auth-api/zbbg;-><init>(Landroid/app/Activity;Lcom/google/android/gms/auth/api/identity/zbu;)V

    return-object v0
.end method

.method public static getSignInClient(Landroid/content/Context;)Lcom/google/android/gms/auth/api/identity/SignInClient;
    .locals 2

    .line 3
    new-instance v0, Lcom/google/android/gms/internal/auth-api/zbbg;

    .line 4
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    new-instance v1, Lcom/google/android/gms/auth/api/identity/zbu;

    invoke-direct {v1}, Lcom/google/android/gms/auth/api/identity/zbu;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/auth-api/zbbg;-><init>(Landroid/content/Context;Lcom/google/android/gms/auth/api/identity/zbu;)V

    return-object v0
.end method
