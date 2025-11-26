.class public final Lcom/dropbox/core/android/internal/DropboxAuthIntent;
.super Ljava/lang/Object;
.source "DropboxAuthIntent.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDropboxAuthIntent.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DropboxAuthIntent.kt\ncom/dropbox/core/android/internal/DropboxAuthIntent\n+ 2 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n*L\n1#1,152:1\n37#2:153\n36#2,3:154\n*S KotlinDebug\n*F\n+ 1 DropboxAuthIntent.kt\ncom/dropbox/core/android/internal/DropboxAuthIntent\n*L\n46#1:153\n46#1:154,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\u0015\u001a\u00020\u0016J\u001e\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u00042\u0006\u0010\u001b\u001a\u00020\u001cJ\u0011\u0010\u001d\u001a\u0004\u0018\u00010\u001e*\u00020\u001f\u00a2\u0006\u0002\u0010 R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006!"
    }
    d2 = {
        "Lcom/dropbox/core/android/internal/DropboxAuthIntent;",
        "",
        "()V",
        "EXTRA_ACCESS_SECRET",
        "",
        "EXTRA_ACCESS_TOKEN",
        "EXTRA_ALREADY_AUTHED_UIDS",
        "EXTRA_AUTH_QUERY_PARAMS",
        "EXTRA_AUTH_STATE",
        "EXTRA_CALLING_CLASS",
        "EXTRA_CALLING_PACKAGE",
        "EXTRA_CONSUMER_KEY",
        "EXTRA_CONSUMER_SIG",
        "EXTRA_DESIRED_UID",
        "EXTRA_DROPBOX_SDK_JAVA_VERSION",
        "EXTRA_EXPIRES_AT",
        "EXTRA_REFRESH_TOKEN",
        "EXTRA_SCOPE",
        "EXTRA_SESSION_ID",
        "EXTRA_TARGET_SDK_VERSION",
        "EXTRA_UID",
        "buildActionAuthenticateIntent",
        "Landroid/content/Intent;",
        "buildOfficialAuthIntent",
        "mState",
        "Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;",
        "stateNonce",
        "authActivity",
        "Lcom/dropbox/core/android/AuthActivity;",
        "getTargetSdkVersion",
        "",
        "Landroid/content/Context;",
        "(Landroid/content/Context;)Ljava/lang/Integer;",
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
.field public static final EXTRA_ACCESS_SECRET:Ljava/lang/String; = "ACCESS_SECRET"

.field public static final EXTRA_ACCESS_TOKEN:Ljava/lang/String; = "ACCESS_TOKEN"

.field public static final EXTRA_ALREADY_AUTHED_UIDS:Ljava/lang/String; = "ALREADY_AUTHED_UIDS"

.field public static final EXTRA_AUTH_QUERY_PARAMS:Ljava/lang/String; = "AUTH_QUERY_PARAMS"

.field public static final EXTRA_AUTH_STATE:Ljava/lang/String; = "AUTH_STATE"

.field public static final EXTRA_CALLING_CLASS:Ljava/lang/String; = "CALLING_CLASS"

.field public static final EXTRA_CALLING_PACKAGE:Ljava/lang/String; = "CALLING_PACKAGE"

.field public static final EXTRA_CONSUMER_KEY:Ljava/lang/String; = "CONSUMER_KEY"

.field public static final EXTRA_CONSUMER_SIG:Ljava/lang/String; = "CONSUMER_SIG"

.field public static final EXTRA_DESIRED_UID:Ljava/lang/String; = "DESIRED_UID"

.field public static final EXTRA_DROPBOX_SDK_JAVA_VERSION:Ljava/lang/String; = "DROPBOX_SDK_JAVA_VERSION"

.field public static final EXTRA_EXPIRES_AT:Ljava/lang/String; = "EXPIRES_AT"

.field public static final EXTRA_REFRESH_TOKEN:Ljava/lang/String; = "REFRESH_TOKEN"

.field public static final EXTRA_SCOPE:Ljava/lang/String; = "SCOPE"

.field public static final EXTRA_SESSION_ID:Ljava/lang/String; = "SESSION_ID"

.field public static final EXTRA_TARGET_SDK_VERSION:Ljava/lang/String; = "TARGET_SDK_VERSION"

.field public static final EXTRA_UID:Ljava/lang/String; = "UID"

.field public static final INSTANCE:Lcom/dropbox/core/android/internal/DropboxAuthIntent;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/dropbox/core/android/internal/DropboxAuthIntent;

    invoke-direct {v0}, Lcom/dropbox/core/android/internal/DropboxAuthIntent;-><init>()V

    sput-object v0, Lcom/dropbox/core/android/internal/DropboxAuthIntent;->INSTANCE:Lcom/dropbox/core/android/internal/DropboxAuthIntent;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final buildActionAuthenticateIntent()Landroid/content/Intent;
    .locals 2

    .line 12
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.dropbox.android.AUTHENTICATE_V2"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 14
    const-string v1, "com.dropbox.android"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    return-object v0
.end method

.method public final buildOfficialAuthIntent(Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;Ljava/lang/String;Lcom/dropbox/core/android/AuthActivity;)Landroid/content/Intent;
    .locals 5

    const-string v0, "mState"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "stateNonce"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "authActivity"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 39
    invoke-virtual {p3}, Lcom/dropbox/core/android/AuthActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 41
    invoke-virtual {p0}, Lcom/dropbox/core/android/internal/DropboxAuthIntent;->buildActionAuthenticateIntent()Landroid/content/Intent;

    move-result-object v2

    .line 42
    const-string v3, "CONSUMER_KEY"

    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMAppKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 43
    const-string v3, "CONSUMER_SIG"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 44
    const-string v3, "CALLING_CLASS"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 45
    const-string v0, "DESIRED_UID"

    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMDesiredUid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 46
    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMAlreadyAuthedUids()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    const/4 v3, 0x0

    .line 156
    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    check-cast v0, [Ljava/lang/String;

    .line 46
    const-string v3, "ALREADY_AUTHED_UIDS"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    const-string v0, "SESSION_ID"

    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMSessionId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 48
    const-string v0, "CALLING_PACKAGE"

    invoke-virtual {v2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 49
    const-string v0, "AUTH_STATE"

    invoke-virtual {v2, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 50
    const-string p2, "DROPBOX_SDK_JAVA_VERSION"

    const-string v0, "7.0.0"

    invoke-virtual {v2, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 51
    sget-object p2, Lcom/dropbox/core/android/internal/DropboxAuthIntent;->INSTANCE:Lcom/dropbox/core/android/internal/DropboxAuthIntent;

    check-cast p3, Landroid/content/Context;

    invoke-virtual {p2, p3}, Lcom/dropbox/core/android/internal/DropboxAuthIntent;->getTargetSdkVersion(Landroid/content/Context;)Ljava/lang/Integer;

    move-result-object p2

    if-eqz p2, :cond_0

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    .line 52
    const-string p3, "TARGET_SDK_VERSION"

    invoke-virtual {v2, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 55
    :cond_0
    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMTokenAccessType()Lcom/dropbox/core/TokenAccessType;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 56
    sget-object p2, Lcom/dropbox/core/android/internal/QueryParamsUtil;->INSTANCE:Lcom/dropbox/core/android/internal/QueryParamsUtil;

    .line 57
    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMTokenAccessType()Lcom/dropbox/core/TokenAccessType;

    move-result-object p3

    .line 58
    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMScope()Ljava/lang/String;

    move-result-object v0

    .line 59
    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMIncludeGrantedScopes()Lcom/dropbox/core/IncludeGrantedScopes;

    move-result-object v1

    .line 60
    invoke-virtual {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->getMPKCEManager()Lcom/dropbox/core/DbxPKCEManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/dropbox/core/DbxPKCEManager;->getCodeChallenge()Ljava/lang/String;

    move-result-object p1

    const-string v3, "mState.mPKCEManager.codeChallenge"

    invoke-static {p1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    invoke-virtual {p2, p3, v0, v1, p1}, Lcom/dropbox/core/android/internal/QueryParamsUtil;->createExtraQueryParams$android_release(Lcom/dropbox/core/TokenAccessType;Ljava/lang/String;Lcom/dropbox/core/IncludeGrantedScopes;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 63
    const-string p2, "AUTH_QUERY_PARAMS"

    invoke-virtual {v2, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_1
    return-object v2

    .line 156
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "null cannot be cast to non-null type kotlin.Array<T of kotlin.collections.ArraysKt__ArraysJVMKt.toTypedArray>"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final getTargetSdkVersion(Landroid/content/Context;)Ljava/lang/Integer;
    .locals 2

    const-string v0, "<this>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p1

    const-string v0, "packageManager.getPackageInfo(packageName, 0)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    iget-object p1, p1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget p1, p1, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 22
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    const/4 p1, 0x0

    .line 24
    move-object v0, p1

    check-cast v0, Ljava/lang/Integer;

    return-object p1
.end method
