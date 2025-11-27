.class public Lcom/dropbox/core/android/AuthActivity;
.super Landroid/app/Activity;
.source "AuthActivity.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/android/AuthActivity$SecurityProvider;,
        Lcom/dropbox/core/android/AuthActivity$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAuthActivity.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AuthActivity.kt\ncom/dropbox/core/android/AuthActivity\n+ 2 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n*L\n1#1,643:1\n37#2:644\n36#2,3:645\n*S KotlinDebug\n*F\n+ 1 AuthActivity.kt\ncom/dropbox/core/android/AuthActivity\n*L\n292#1:644\n292#1:645,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u0016\u0018\u0000 \u00182\u00020\u0001:\u0002\u0018\u0019B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0012\u0010\t\u001a\u00020\n2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u000cH\u0002J\u0012\u0010\r\u001a\u00020\n2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0014J\u0010\u0010\u0010\u001a\u00020\n2\u0006\u0010\u0011\u001a\u00020\u000cH\u0014J\u0008\u0010\u0012\u001a\u00020\nH\u0014J\u0010\u0010\u0013\u001a\u00020\n2\u0006\u0010\u0014\u001a\u00020\u0004H\u0016J\u0010\u0010\u0015\u001a\u00020\n2\u0006\u0010\u0016\u001a\u00020\u0017H\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0005\u001a\u00020\u00068BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/dropbox/core/android/AuthActivity;",
        "Landroid/app/Activity;",
        "()V",
        "mActivityDispatchHandlerPosted",
        "",
        "mState",
        "Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;",
        "getMState",
        "()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;",
        "authFinished",
        "",
        "authResult",
        "Landroid/content/Intent;",
        "onCreate",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "onNewIntent",
        "intent",
        "onResume",
        "onTopResumedActivityChanged",
        "onTop",
        "startWebAuth",
        "state",
        "",
        "Companion",
        "SecurityProvider",
        "android_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x6,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final ACTION_AUTHENTICATE_V1:Ljava/lang/String; = "com.dropbox.android.AUTHENTICATE_V1"

.field public static final ACTION_AUTHENTICATE_V2:Ljava/lang/String; = "com.dropbox.android.AUTHENTICATE_V2"

.field public static final AUTH_PATH_CONNECT:Ljava/lang/String; = "/connect"

.field public static final AUTH_VERSION:I = 0x1

.field public static final Companion:Lcom/dropbox/core/android/AuthActivity$Companion;

.field private static final TAG:Ljava/lang/String;

.field public static result:Landroid/content/Intent;

.field private static sAuthParams:Lcom/dropbox/core/android/internal/AuthParameters;

.field private static sSecurityProvider:Lcom/dropbox/core/android/AuthActivity$SecurityProvider;

.field private static final sSecurityProviderLock:Ljava/lang/Object;


# instance fields
.field private mActivityDispatchHandlerPosted:Z


# direct methods
.method public static synthetic $r8$lambda$C4YK5qTz97zpMgywgyo62NffBNQ(Lcom/dropbox/core/android/AuthActivity;Landroid/content/Intent;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/dropbox/core/android/AuthActivity;->onTopResumedActivityChanged$lambda-0(Lcom/dropbox/core/android/AuthActivity;Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/dropbox/core/android/AuthActivity$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/dropbox/core/android/AuthActivity$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/dropbox/core/android/AuthActivity;->Companion:Lcom/dropbox/core/android/AuthActivity$Companion;

    .line 299
    const-class v0, Lcom/dropbox/core/android/AuthActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/android/AuthActivity;->TAG:Ljava/lang/String;

    .line 325
    new-instance v0, Lcom/dropbox/core/android/AuthActivity$Companion$sSecurityProvider$1;

    invoke-direct {v0}, Lcom/dropbox/core/android/AuthActivity$Companion$sSecurityProvider$1;-><init>()V

    check-cast v0, Lcom/dropbox/core/android/AuthActivity$SecurityProvider;

    sput-object v0, Lcom/dropbox/core/android/AuthActivity;->sSecurityProvider:Lcom/dropbox/core/android/AuthActivity$SecurityProvider;

    .line 329
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/dropbox/core/android/AuthActivity;->sSecurityProviderLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method public static final synthetic access$getSSecurityProvider$cp()Lcom/dropbox/core/android/AuthActivity$SecurityProvider;
    .locals 1

    .line 36
    sget-object v0, Lcom/dropbox/core/android/AuthActivity;->sSecurityProvider:Lcom/dropbox/core/android/AuthActivity$SecurityProvider;

    return-object v0
.end method

.method public static final synthetic access$getSSecurityProviderLock$cp()Ljava/lang/Object;
    .locals 1

    .line 36
    sget-object v0, Lcom/dropbox/core/android/AuthActivity;->sSecurityProviderLock:Ljava/lang/Object;

    return-object v0
.end method

.method public static final synthetic access$getTAG$cp()Ljava/lang/String;
    .locals 1

    .line 36
    sget-object v0, Lcom/dropbox/core/android/AuthActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static final synthetic access$setSAuthParams$cp(Lcom/dropbox/core/android/internal/AuthParameters;)V
    .locals 0

    .line 36
    sput-object p0, Lcom/dropbox/core/android/AuthActivity;->sAuthParams:Lcom/dropbox/core/android/internal/AuthParameters;

    return-void
.end method

.method public static final synthetic access$setSSecurityProvider$cp(Lcom/dropbox/core/android/AuthActivity$SecurityProvider;)V
    .locals 0

    .line 36
    sput-object p0, Lcom/dropbox/core/android/AuthActivity;->sSecurityProvider:Lcom/dropbox/core/android/AuthActivity$SecurityProvider;

    return-void
.end method

.method private final authFinished(Landroid/content/Intent;)V
    .locals 0

    .line 257
    sput-object p1, Lcom/dropbox/core/android/AuthActivity;->result:Landroid/content/Intent;

    .line 258
    sget-object p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel;->Companion:Lcom/dropbox/core/android/internal/AuthSessionViewModel$Companion;

    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$Companion;->endAuthSession()V

    .line 259
    invoke-virtual {p0}, Lcom/dropbox/core/android/AuthActivity;->finish()V

    return-void
.end method

.method public static final checkAppBeforeAuth(Landroid/content/Context;Ljava/lang/String;Z)Z
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "Use Methods in com.dropbox.core.android.Auth, This will be removed in future versions."
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/AuthActivity;->Companion:Lcom/dropbox/core/android/AuthActivity$Companion;

    invoke-virtual {v0, p0, p1, p2}, Lcom/dropbox/core/android/AuthActivity$Companion;->checkAppBeforeAuth(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method private final getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;
    .locals 1

    .line 71
    sget-object v0, Lcom/dropbox/core/android/internal/AuthSessionViewModel;->Companion:Lcom/dropbox/core/android/internal/AuthSessionViewModel$Companion;

    invoke-virtual {v0}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$Companion;->getState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v0

    return-object v0
.end method

.method public static final makeIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "Use Methods in com.dropbox.core.android.Auth, This will be removed in future versions."
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/AuthActivity;->Companion:Lcom/dropbox/core/android/AuthActivity$Companion;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/dropbox/core/android/AuthActivity$Companion;->makeIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static final makeIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 8
    .annotation runtime Lkotlin/Deprecated;
        message = "Use Methods in com.dropbox.core.android.Auth. This will be removed in future versions."
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/AuthActivity;->Companion:Lcom/dropbox/core/android/AuthActivity$Companion;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-virtual/range {v0 .. v7}, Lcom/dropbox/core/android/AuthActivity$Companion;->makeIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method private static final onTopResumedActivityChanged$lambda-0(Lcom/dropbox/core/android/AuthActivity;Landroid/content/Intent;Ljava/lang/String;)V
    .locals 3

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$officialAuthIntent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$stateNonce"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 135
    sget-object v0, Lcom/dropbox/core/android/AuthActivity;->TAG:Ljava/lang/String;

    const-string v1, "running startActivity in handler"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    :try_start_0
    sget-object v0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->Companion:Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;

    .line 138
    invoke-virtual {p0}, Lcom/dropbox/core/android/AuthActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "applicationContext"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1, p1}, Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;->getDropboxAppPackage$android_release(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/pm/PackageInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 142
    invoke-virtual {p0, p1}, Lcom/dropbox/core/android/AuthActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 144
    :cond_0
    invoke-direct {p0, p2}, Lcom/dropbox/core/android/AuthActivity;->startWebAuth(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    :goto_0
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object p0

    invoke-virtual {p0, p2}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->setMAuthStateNonce(Ljava/lang/String;)V

    return-void

    :catch_0
    move-exception p1

    .line 147
    sget-object p2, Lcom/dropbox/core/android/AuthActivity;->TAG:Ljava/lang/String;

    const-string v0, "Could not launch intent. User may have restricted profile"

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p2, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 148
    invoke-virtual {p0}, Lcom/dropbox/core/android/AuthActivity;->finish()V

    return-void
.end method

.method public static final setSecurityProvider(Lcom/dropbox/core/android/AuthActivity$SecurityProvider;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/AuthActivity;->Companion:Lcom/dropbox/core/android/AuthActivity$Companion;

    invoke-virtual {v0, p0}, Lcom/dropbox/core/android/AuthActivity$Companion;->setSecurityProvider(Lcom/dropbox/core/android/AuthActivity$SecurityProvider;)V

    return-void
.end method

.method private final startWebAuth(Ljava/lang/String;)V
    .locals 11

    .line 264
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    .line 265
    new-instance v1, Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMAlreadyAuthedUids()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMAlreadyAuthedUids()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v0, "0"

    :goto_0
    move-object v6, v0

    .line 274
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMAppKey()Ljava/lang/String;

    move-result-object v4

    .line 276
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMApiType()Ljava/lang/String;

    move-result-object v8

    .line 277
    const-string v9, "state"

    const-string v3, "k"

    const-string v5, "n"

    const-string v7, "api"

    move-object v10, p1

    filled-new-array/range {v3 .. v10}, [Ljava/lang/String;

    move-result-object p1

    .line 273
    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 279
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMTokenAccessType()Lcom/dropbox/core/TokenAccessType;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 280
    const-string v0, "extra_query_params"

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 282
    sget-object v0, Lcom/dropbox/core/android/internal/QueryParamsUtil;->INSTANCE:Lcom/dropbox/core/android/internal/QueryParamsUtil;

    .line 283
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v3

    invoke-virtual {v3}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMTokenAccessType()Lcom/dropbox/core/TokenAccessType;

    move-result-object v3

    .line 284
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v4

    invoke-virtual {v4}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMScope()Ljava/lang/String;

    move-result-object v4

    .line 285
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v5

    invoke-virtual {v5}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMIncludeGrantedScopes()Lcom/dropbox/core/IncludeGrantedScopes;

    move-result-object v5

    .line 286
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v6

    invoke-virtual {v6}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMPKCEManager()Lcom/dropbox/core/DbxPKCEManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/dropbox/core/DbxPKCEManager;->getCodeChallenge()Ljava/lang/String;

    move-result-object v6

    const-string v7, "mState.mPKCEManager.codeChallenge"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 282
    invoke-virtual {v0, v3, v4, v5, v6}, Lcom/dropbox/core/android/internal/QueryParamsUtil;->createExtraQueryParams$android_release(Lcom/dropbox/core/TokenAccessType;Ljava/lang/String;Lcom/dropbox/core/IncludeGrantedScopes;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 281
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 291
    :cond_1
    invoke-virtual {v1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v1}, Lcom/dropbox/core/DbxHost;->getWeb()Ljava/lang/String;

    move-result-object v1

    .line 292
    check-cast p1, Ljava/util/Collection;

    .line 647
    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {p1, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_2

    check-cast p1, [Ljava/lang/String;

    .line 290
    const-string v2, "1/connect"

    invoke-static {v0, v1, v2, p1}, Lcom/dropbox/core/DbxRequestUtil;->buildUrlWithParams(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 294
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 295
    invoke-virtual {p0, v0}, Lcom/dropbox/core/android/AuthActivity;->startActivity(Landroid/content/Intent;)V

    return-void

    .line 647
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "null cannot be cast to non-null type kotlin.Array<T of kotlin.collections.ArraysKt__ArraysJVMKt.toTypedArray>"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 54
    sget-object v0, Lcom/dropbox/core/android/internal/AuthSessionViewModel;->Companion:Lcom/dropbox/core/android/internal/AuthSessionViewModel$Companion;

    invoke-virtual {v0}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$Companion;->isAuthInProgress()Z

    move-result v0

    if-nez v0, :cond_0

    .line 55
    sget-object v0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->Companion:Lcom/dropbox/core/android/internal/AuthSessionViewModel$State$Companion;

    sget-object v1, Lcom/dropbox/core/android/AuthActivity;->sAuthParams:Lcom/dropbox/core/android/internal/AuthParameters;

    invoke-virtual {v0, v1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State$Companion;->fromAuthParams(Lcom/dropbox/core/android/internal/AuthParameters;)Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v0

    .line 56
    sget-object v1, Lcom/dropbox/core/android/internal/AuthSessionViewModel;->Companion:Lcom/dropbox/core/android/internal/AuthSessionViewModel$Companion;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$Companion;->startAuthSession(Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;)V

    :cond_0
    const v0, 0x1030010

    .line 58
    invoke-virtual {p0, v0}, Lcom/dropbox/core/android/AuthActivity;->setTheme(I)V

    .line 59
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 12

    const-string v0, "intent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 160
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMAuthStateNonce()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 161
    invoke-direct {p0, v1}, Lcom/dropbox/core/android/AuthActivity;->authFinished(Landroid/content/Intent;)V

    return-void

    .line 168
    :cond_0
    const-string v0, "ACCESS_TOKEN"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    const-string v3, "UID"

    const-string v4, "ACCESS_SECRET"

    if-eqz v2, :cond_1

    .line 170
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 171
    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 172
    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 173
    const-string v7, "AUTH_STATE"

    invoke-virtual {p1, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    move-object v11, v6

    move-object v6, v5

    move-object v5, v11

    goto :goto_3

    .line 176
    :cond_1
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 178
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 179
    const-string v5, "/connect"

    invoke-static {v5, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 181
    :try_start_0
    const-string v2, "oauth_token"

    invoke-virtual {p1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_3

    .line 182
    :try_start_1
    const-string v5, "oauth_token_secret"

    invoke-virtual {p1, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5
    :try_end_1
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_1 .. :try_end_1} :catch_2

    .line 183
    :try_start_2
    const-string v6, "uid"

    invoke-virtual {p1, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6
    :try_end_2
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_2 .. :try_end_2} :catch_1

    .line 184
    :try_start_3
    const-string v7, "state"

    invoke-virtual {p1, v7}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_3
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    :catch_0
    nop

    goto :goto_2

    :catch_1
    nop

    move-object v6, v1

    goto :goto_2

    :catch_2
    nop

    move-object v5, v1

    goto :goto_1

    :catch_3
    nop

    move-object v2, v1

    move-object v5, v2

    :goto_1
    move-object v6, v5

    :goto_2
    move-object p1, v6

    move-object v6, v5

    move-object v5, p1

    move-object p1, v1

    goto :goto_3

    :cond_2
    move-object p1, v1

    move-object v2, p1

    move-object v5, v2

    move-object v6, v5

    :goto_3
    if-eqz v2, :cond_6

    .line 191
    const-string v7, ""

    invoke-static {v2, v7}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_6

    if-eqz v6, :cond_6

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_6

    if-eqz v5, :cond_6

    invoke-static {v5, v7}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_6

    if-eqz p1, :cond_6

    invoke-static {p1, v7}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    .line 194
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v7

    invoke-virtual {v7}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMAuthStateNonce()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 195
    invoke-direct {p0, v1}, Lcom/dropbox/core/android/AuthActivity;->authFinished(Landroid/content/Intent;)V

    return-void

    .line 200
    :cond_3
    sget-object p1, Lcom/dropbox/core/android/internal/TokenType;->OAUTH2:Lcom/dropbox/core/android/internal/TokenType;

    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/TokenType;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 202
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 203
    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 204
    invoke-virtual {v1, v4, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 205
    invoke-virtual {v1, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto/16 :goto_4

    .line 206
    :cond_4
    sget-object p1, Lcom/dropbox/core/android/internal/TokenType;->OAUTH2CODE:Lcom/dropbox/core/android/internal/TokenType;

    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/TokenType;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 208
    new-instance v5, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;

    .line 210
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object p1

    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMPKCEManager()Lcom/dropbox/core/DbxPKCEManager;

    move-result-object v7

    .line 211
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object p1

    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMRequestConfig()Lcom/dropbox/core/DbxRequestConfig;

    move-result-object v8

    invoke-static {v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 212
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object p1

    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMAppKey()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 213
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object p1

    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMHost()Lcom/dropbox/core/DbxHost;

    move-result-object v10

    invoke-static {v10}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 208
    invoke-direct/range {v5 .. v10}, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;-><init>(Ljava/lang/String;Lcom/dropbox/core/DbxPKCEManager;Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/DbxHost;)V

    const/4 p1, 0x0

    .line 216
    :try_start_4
    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {v5, p1}, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dropbox/core/DbxAuthFinish;

    if-nez p1, :cond_5

    goto :goto_4

    .line 220
    :cond_5
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 225
    invoke-virtual {p1}, Lcom/dropbox/core/DbxAuthFinish;->getAccessToken()Ljava/lang/String;

    move-result-object v5

    .line 223
    invoke-virtual {v2, v0, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 229
    invoke-virtual {p1}, Lcom/dropbox/core/DbxAuthFinish;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    .line 227
    invoke-virtual {v2, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 232
    const-string v0, "REFRESH_TOKEN"

    .line 233
    invoke-virtual {p1}, Lcom/dropbox/core/DbxAuthFinish;->getRefreshToken()Ljava/lang/String;

    move-result-object v4

    .line 231
    invoke-virtual {v2, v0, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 236
    const-string v0, "EXPIRES_AT"

    .line 237
    invoke-virtual {p1}, Lcom/dropbox/core/DbxAuthFinish;->getExpiresAt()Ljava/lang/Long;

    move-result-object v4

    const-string v5, "dbxAuthFinish.expiresAt"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    .line 235
    invoke-virtual {v2, v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 239
    invoke-virtual {p1}, Lcom/dropbox/core/DbxAuthFinish;->getUserId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 240
    const-string v0, "CONSUMER_KEY"

    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v3

    invoke-virtual {v3}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMAppKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 241
    const-string v0, "SCOPE"

    invoke-virtual {p1}, Lcom/dropbox/core/DbxAuthFinish;->getScope()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    move-object v1, v2

    .line 253
    :catch_4
    :cond_6
    :goto_4
    invoke-direct {p0, v1}, Lcom/dropbox/core/android/AuthActivity;->authFinished(Landroid/content/Intent;)V

    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 63
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 64
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    .line 67
    invoke-virtual {p0, v0}, Lcom/dropbox/core/android/AuthActivity;->onTopResumedActivityChanged(Z)V

    :cond_0
    return-void
.end method

.method public onTopResumedActivityChanged(Z)V
    .locals 3

    .line 84
    invoke-virtual {p0}, Lcom/dropbox/core/android/AuthActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_5

    if-nez p1, :cond_0

    goto/16 :goto_2

    .line 87
    :cond_0
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object p1

    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMAuthStateNonce()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_4

    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object p1

    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMAppKey()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_1

    goto :goto_1

    .line 98
    :cond_1
    sget-object p1, Lcom/dropbox/core/android/AuthActivity;->Companion:Lcom/dropbox/core/android/AuthActivity$Companion;

    sput-object v0, Lcom/dropbox/core/android/AuthActivity;->result:Landroid/content/Intent;

    .line 99
    iget-boolean v0, p0, Lcom/dropbox/core/android/AuthActivity;->mActivityDispatchHandlerPosted:Z

    if-eqz v0, :cond_2

    .line 100
    sget-object p1, Lcom/dropbox/core/android/AuthActivity;->TAG:Ljava/lang/String;

    const-string v0, "onResume called again before Handler run"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 107
    :cond_2
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMTokenAccessType()Lcom/dropbox/core/TokenAccessType;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 110
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object p1

    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMPKCEManager()Lcom/dropbox/core/DbxPKCEManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxPKCEManager;->getCodeChallenge()Ljava/lang/String;

    move-result-object p1

    const-string v0, "mState.mPKCEManager.codeChallenge"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 111
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMTokenAccessType()Lcom/dropbox/core/TokenAccessType;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 112
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMScope()Ljava/lang/String;

    move-result-object v1

    .line 113
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v2

    invoke-virtual {v2}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMIncludeGrantedScopes()Lcom/dropbox/core/IncludeGrantedScopes;

    move-result-object v2

    .line 109
    invoke-static {p1, v0, v1, v2}, Lcom/dropbox/core/android/internal/AuthUtils;->createPKCEStateNonce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/IncludeGrantedScopes;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 117
    :cond_3
    invoke-static {p1}, Lcom/dropbox/core/android/AuthActivity$Companion;->access$getSecurityProvider(Lcom/dropbox/core/android/AuthActivity$Companion;)Lcom/dropbox/core/android/AuthActivity$SecurityProvider;

    move-result-object p1

    invoke-static {p1}, Lcom/dropbox/core/android/internal/AuthUtils;->createStateNonce(Lcom/dropbox/core/android/AuthActivity$SecurityProvider;)Ljava/lang/String;

    move-result-object p1

    .line 121
    :goto_0
    sget-object v0, Lcom/dropbox/core/android/internal/DropboxAuthIntent;->INSTANCE:Lcom/dropbox/core/android/internal/DropboxAuthIntent;

    .line 123
    invoke-direct {p0}, Lcom/dropbox/core/android/AuthActivity;->getMState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v1

    .line 121
    invoke-virtual {v0, v1, p1, p0}, Lcom/dropbox/core/android/internal/DropboxAuthIntent;->buildOfficialAuthIntent(Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;Ljava/lang/String;Lcom/dropbox/core/android/AuthActivity;)Landroid/content/Intent;

    move-result-object v0

    .line 134
    new-instance v1, Lcom/dropbox/core/android/AuthActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, v0, p1}, Lcom/dropbox/core/android/AuthActivity$$ExternalSyntheticLambda0;-><init>(Lcom/dropbox/core/android/AuthActivity;Landroid/content/Intent;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/dropbox/core/android/AuthActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    const/4 p1, 0x1

    .line 155
    iput-boolean p1, p0, Lcom/dropbox/core/android/AuthActivity;->mActivityDispatchHandlerPosted:Z

    return-void

    .line 95
    :cond_4
    :goto_1
    invoke-direct {p0, v0}, Lcom/dropbox/core/android/AuthActivity;->authFinished(Landroid/content/Intent;)V

    :cond_5
    :goto_2
    return-void
.end method
