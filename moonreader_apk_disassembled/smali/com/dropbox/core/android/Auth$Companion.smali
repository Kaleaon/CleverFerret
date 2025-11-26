.class public final Lcom/dropbox/core/android/Auth$Companion;
.super Ljava/lang/Object;
.source "Auth.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/android/Auth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAuth.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Auth.kt\ncom/dropbox/core/android/Auth$Companion\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,345:1\n1#2:346\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u001e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\n\u0010\u0003\u001a\u0004\u0018\u00010\u0004H\u0007J\n\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0007J\n\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0007J\n\u0010\u0008\u001a\u0004\u0018\u00010\u0006H\u0007J\u001a\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u0006H\u0007JC\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u00062\u000e\u0010\u000f\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00102\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0006H\u0007\u00a2\u0006\u0002\u0010\u0012JM\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u00062\u000e\u0010\u000f\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00102\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0006H\u0007\u00a2\u0006\u0002\u0010\u0014J\u008b\u0001\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u00062\u000e\u0010\u000f\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00102\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u00162\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u00182\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u001a2\u0012\u0008\u0002\u0010\u001b\u001a\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0018\u00010\u001c2\n\u0008\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001eH\u0002\u00a2\u0006\u0002\u0010\u001fJ.\u0010 \u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u00182\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u001aH\u0007J@\u0010 \u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u00182\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u001a2\u0010\u0010\u001b\u001a\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0018\u00010\u001cH\u0007JJ\u0010 \u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u00182\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u001a2\u0010\u0010\u001b\u001a\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0018\u00010\u001c2\u0008\u0010\u001d\u001a\u0004\u0018\u00010\u001eH\u0007J8\u0010 \u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u00182\u0012\u0008\u0002\u0010\u001b\u001a\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0018\u00010\u001cH\u0007\u00a8\u0006!"
    }
    d2 = {
        "Lcom/dropbox/core/android/Auth$Companion;",
        "",
        "()V",
        "getDbxCredential",
        "Lcom/dropbox/core/oauth/DbxCredential;",
        "getOAuth2Token",
        "",
        "getScope",
        "getUid",
        "startOAuth2Authentication",
        "",
        "context",
        "Landroid/content/Context;",
        "appKey",
        "desiredUid",
        "alreadyAuthedUids",
        "",
        "sessionId",
        "(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V",
        "webHost",
        "(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
        "tokenAccessType",
        "Lcom/dropbox/core/TokenAccessType;",
        "requestConfig",
        "Lcom/dropbox/core/DbxRequestConfig;",
        "host",
        "Lcom/dropbox/core/DbxHost;",
        "scope",
        "",
        "includeGrantedScopes",
        "Lcom/dropbox/core/IncludeGrantedScopes;",
        "(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;Lcom/dropbox/core/IncludeGrantedScopes;)V",
        "startOAuth2PKCE",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/dropbox/core/android/Auth$Companion;-><init>()V

    return-void
.end method

.method private final startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;Lcom/dropbox/core/IncludeGrantedScopes;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/TokenAccessType;",
            "Lcom/dropbox/core/DbxRequestConfig;",
            "Lcom/dropbox/core/DbxHost;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/dropbox/core/IncludeGrantedScopes;",
            ")V"
        }
    .end annotation

    move-object/from16 v4, p4

    move-object/from16 v0, p10

    .line 267
    sget-object v1, Lcom/dropbox/core/android/AuthActivity;->Companion:Lcom/dropbox/core/android/AuthActivity$Companion;

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v2, 0x1

    invoke-virtual {v1, p1, p2, v2}, Lcom/dropbox/core/android/AuthActivity$Companion;->checkAppBeforeAuth(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    if-eqz v4, :cond_2

    .line 271
    array-length v1, v4

    invoke-static {v4, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    move-object/from16 v3, p3

    .line 272
    invoke-interface {v1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 270
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "desiredUid cannot be present in alreadyAuthedUids"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    move-object/from16 v3, p3

    :goto_0
    if-eqz v0, :cond_3

    .line 276
    const-string v1, " "

    invoke-static {v0, v1}, Lcom/dropbox/core/util/StringUtil;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    :goto_1
    move-object v11, v0

    .line 280
    const-string v7, "1"

    .line 281
    sget-object v0, Lcom/dropbox/core/android/AuthActivity;->Companion:Lcom/dropbox/core/android/AuthActivity$Companion;

    move-object v1, p1

    move-object v2, p2

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v12, p11

    invoke-virtual/range {v0 .. v12}, Lcom/dropbox/core/android/AuthActivity$Companion;->makeIntent$android_release(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/lang/String;Lcom/dropbox/core/IncludeGrantedScopes;)Landroid/content/Intent;

    move-result-object p2

    .line 285
    instance-of v0, p1, Landroid/app/Activity;

    if-nez v0, :cond_4

    const/high16 v0, 0x10000000

    .line 289
    invoke-virtual {p2, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 291
    :cond_4
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic startOAuth2Authentication$default(Lcom/dropbox/core/android/Auth$Companion;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;Lcom/dropbox/core/IncludeGrantedScopes;ILjava/lang/Object;)V
    .locals 1

    and-int/lit16 p13, p12, 0x200

    const/4 v0, 0x0

    if-eqz p13, :cond_0

    move-object p10, v0

    :cond_0
    and-int/lit16 p12, p12, 0x400

    if-eqz p12, :cond_1

    move-object p11, v0

    .line 254
    :cond_1
    invoke-direct/range {p0 .. p11}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;Lcom/dropbox/core/IncludeGrantedScopes;)V

    return-void
.end method

.method public static synthetic startOAuth2PKCE$default(Lcom/dropbox/core/android/Auth$Companion;Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Ljava/util/Collection;ILjava/lang/Object;)V
    .locals 0

    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_0

    const/4 p4, 0x0

    .line 69
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Ljava/util/Collection;)V

    return-void
.end method


# virtual methods
.method public final getDbxCredential()Lcom/dropbox/core/oauth/DbxCredential;
    .locals 9
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 316
    sget-object v0, Lcom/dropbox/core/android/AuthActivity;->result:Landroid/content/Intent;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 317
    :cond_0
    const-string v2, "ACCESS_TOKEN"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 318
    const-string v3, "ACCESS_SECRET"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 319
    const-string v4, "UID"

    invoke-virtual {v0, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v2, :cond_3

    .line 320
    const-string v5, ""

    invoke-static {v5, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    if-eqz v3, :cond_3

    invoke-static {v5, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    if-eqz v4, :cond_3

    invoke-static {v5, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 323
    :cond_1
    const-string v2, "CONSUMER_KEY"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 324
    const-string v4, "REFRESH_TOKEN"

    invoke-virtual {v0, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 325
    const-string v5, "EXPIRES_AT"

    const-wide/16 v6, -0x1

    invoke-virtual {v0, v5, v6, v7}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v0, v5, v7

    if-ltz v0, :cond_2

    .line 326
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 327
    :cond_2
    new-instance v0, Lcom/dropbox/core/oauth/DbxCredential;

    invoke-direct {v0, v3, v1, v4, v2}, Lcom/dropbox/core/oauth/DbxCredential;-><init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_3
    :goto_0
    return-object v1
.end method

.method public final getOAuth2Token()Ljava/lang/String;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 296
    invoke-virtual {p0}, Lcom/dropbox/core/android/Auth$Companion;->getDbxCredential()Lcom/dropbox/core/oauth/DbxCredential;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 297
    :cond_0
    invoke-virtual {v0}, Lcom/dropbox/core/oauth/DbxCredential;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getScope()Ljava/lang/String;
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 341
    sget-object v0, Lcom/dropbox/core/android/AuthActivity;->result:Landroid/content/Intent;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 342
    :cond_0
    const-string v1, "SCOPE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getUid()Ljava/lang/String;
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 302
    invoke-virtual {p0}, Lcom/dropbox/core/android/Auth$Companion;->getDbxCredential()Lcom/dropbox/core/oauth/DbxCredential;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 305
    :cond_0
    sget-object v0, Lcom/dropbox/core/android/AuthActivity;->result:Landroid/content/Intent;

    .line 306
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const-string v1, "UID"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;)V
    .locals 7
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    .line 31
    invoke-virtual/range {v1 .. v6}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    const-string v7, "www.dropbox.com"

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    .line 51
    invoke-virtual/range {v1 .. v7}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 15
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    move-object/from16 v2, p1

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v13, 0x600

    const/4 v14, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v1, p0

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    .line 238
    invoke-static/range {v1 .. v14}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2Authentication$default(Lcom/dropbox/core/android/Auth$Companion;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;Lcom/dropbox/core/IncludeGrantedScopes;ILjava/lang/Object;)V

    return-void
.end method

.method public final startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;)V
    .locals 8
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v6, 0x8

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-static/range {v1 .. v7}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2PKCE$default(Lcom/dropbox/core/android/Auth$Companion;Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Ljava/util/Collection;ILjava/lang/Object;)V

    return-void
.end method

.method public final startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;)V
    .locals 15
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    move-object/from16 v2, p1

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p3, :cond_0

    .line 112
    sget-object v8, Lcom/dropbox/core/TokenAccessType;->OFFLINE:Lcom/dropbox/core/TokenAccessType;

    const/16 v13, 0x600

    const/4 v14, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v1, p0

    move-object/from16 v3, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    .line 105
    invoke-static/range {v1 .. v14}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2Authentication$default(Lcom/dropbox/core/android/Auth$Companion;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;Lcom/dropbox/core/IncludeGrantedScopes;ILjava/lang/Object;)V

    return-void

    .line 104
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid Dbx requestConfig for PKCE flow."

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/DbxRequestConfig;",
            "Lcom/dropbox/core/DbxHost;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p3, :cond_0

    .line 139
    sget-object v8, Lcom/dropbox/core/TokenAccessType;->OFFLINE:Lcom/dropbox/core/TokenAccessType;

    const/4 v12, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p5

    .line 132
    invoke-direct/range {v1 .. v12}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;Lcom/dropbox/core/IncludeGrantedScopes;)V

    return-void

    .line 131
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Invalid Dbx requestConfig for PKCE flow."

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;Lcom/dropbox/core/IncludeGrantedScopes;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/DbxRequestConfig;",
            "Lcom/dropbox/core/DbxHost;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/dropbox/core/IncludeGrantedScopes;",
            ")V"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p3, :cond_2

    if-eqz p6, :cond_1

    if-eqz p5, :cond_0

    goto :goto_0

    .line 178
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "If you are using includeGrantedScope, you must ask for specific new scopes"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    const/4 v6, 0x0

    .line 189
    sget-object v7, Lcom/dropbox/core/TokenAccessType;->OFFLINE:Lcom/dropbox/core/TokenAccessType;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v8, p3

    move-object/from16 v9, p4

    move-object/from16 v10, p5

    move-object/from16 v11, p6

    .line 182
    invoke-direct/range {v0 .. v11}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;Lcom/dropbox/core/IncludeGrantedScopes;)V

    return-void

    .line 177
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Invalid Dbx requestConfig for PKCE flow."

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Ljava/util/Collection;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/DbxRequestConfig;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v6, p4

    .line 75
    invoke-virtual/range {v1 .. v6}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;)V

    return-void
.end method
