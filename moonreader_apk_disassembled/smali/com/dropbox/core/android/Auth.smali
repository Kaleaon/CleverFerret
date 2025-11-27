.class public final Lcom/dropbox/core/android/Auth;
.super Ljava/lang/Object;
.source "Auth.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/android/Auth$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0018\u0000 \u00032\u00020\u0001:\u0001\u0003B\u0005\u00a2\u0006\u0002\u0010\u0002\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/dropbox/core/android/Auth;",
        "",
        "()V",
        "Companion",
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
.field public static final Companion:Lcom/dropbox/core/android/Auth$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/dropbox/core/android/Auth$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/dropbox/core/android/Auth$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/dropbox/core/android/Auth;->Companion:Lcom/dropbox/core/android/Auth$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getDbxCredential()Lcom/dropbox/core/oauth/DbxCredential;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/Auth;->Companion:Lcom/dropbox/core/android/Auth$Companion;

    invoke-virtual {v0}, Lcom/dropbox/core/android/Auth$Companion;->getDbxCredential()Lcom/dropbox/core/oauth/DbxCredential;

    move-result-object v0

    return-object v0
.end method

.method public static final getOAuth2Token()Ljava/lang/String;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/Auth;->Companion:Lcom/dropbox/core/android/Auth$Companion;

    invoke-virtual {v0}, Lcom/dropbox/core/android/Auth$Companion;->getOAuth2Token()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final getScope()Ljava/lang/String;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/Auth;->Companion:Lcom/dropbox/core/android/Auth$Companion;

    invoke-virtual {v0}, Lcom/dropbox/core/android/Auth$Companion;->getScope()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final getUid()Ljava/lang/String;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/Auth;->Companion:Lcom/dropbox/core/android/Auth$Companion;

    invoke-virtual {v0}, Lcom/dropbox/core/android/Auth$Companion;->getUid()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/Auth;->Companion:Lcom/dropbox/core/android/Auth$Companion;

    invoke-virtual {v0, p0, p1}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static final startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/Auth;->Companion:Lcom/dropbox/core/android/Auth$Companion;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static final startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/Auth;->Companion:Lcom/dropbox/core/android/Auth$Companion;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2Authentication(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static final startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/Auth;->Companion:Lcom/dropbox/core/android/Auth$Companion;

    invoke-virtual {v0, p0, p1, p2}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;)V

    return-void
.end method

.method public static final startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;)V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/Auth;->Companion:Lcom/dropbox/core/android/Auth$Companion;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;)V

    return-void
.end method

.method public static final startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;)V
    .locals 6
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

    sget-object v0, Lcom/dropbox/core/android/Auth;->Companion:Lcom/dropbox/core/android/Auth$Companion;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;)V

    return-void
.end method

.method public static final startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;Lcom/dropbox/core/IncludeGrantedScopes;)V
    .locals 7
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

    sget-object v0, Lcom/dropbox/core/android/Auth;->Companion:Lcom/dropbox/core/android/Auth$Companion;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Lcom/dropbox/core/DbxHost;Ljava/util/Collection;Lcom/dropbox/core/IncludeGrantedScopes;)V

    return-void
.end method

.method public static final startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Ljava/util/Collection;)V
    .locals 1
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

    sget-object v0, Lcom/dropbox/core/android/Auth;->Companion:Lcom/dropbox/core/android/Auth$Companion;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/dropbox/core/android/Auth$Companion;->startOAuth2PKCE(Landroid/content/Context;Ljava/lang/String;Lcom/dropbox/core/DbxRequestConfig;Ljava/util/Collection;)V

    return-void
.end method
