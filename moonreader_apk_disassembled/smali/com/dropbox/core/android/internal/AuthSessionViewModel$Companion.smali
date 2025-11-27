.class public final Lcom/dropbox/core/android/internal/AuthSessionViewModel$Companion;
.super Ljava/lang/Object;
.source "AuthSessionViewModel.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/android/internal/AuthSessionViewModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\n\u001a\u00020\u000bJ\u0006\u0010\u000c\u001a\u00020\u0006J\u000e\u0010\r\u001a\u00020\u000b2\u0006\u0010\u0007\u001a\u00020\u0004R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0007\u001a\u00020\u00048F\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\t\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/dropbox/core/android/internal/AuthSessionViewModel$Companion;",
        "",
        "()V",
        "_state",
        "Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;",
        "authInProgress",
        "",
        "state",
        "getState",
        "()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;",
        "endAuthSession",
        "",
        "isAuthInProgress",
        "startAuthSession",
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

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final endAuthSession()V
    .locals 17

    const/4 v0, 0x0

    .line 62
    invoke-static {v0}, Lcom/dropbox/core/android/internal/AuthSessionViewModel;->access$setAuthInProgress$cp(Z)V

    .line 63
    new-instance v1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    const/16 v15, 0x1fff

    const/16 v16, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v1 .. v16}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;-><init>(Lcom/dropbox/core/DbxHost;Landroid/content/Intent;Lcom/dropbox/core/DbxPKCEManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/IncludeGrantedScopes;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-static {v1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel;->access$set_state$cp(Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;)V

    return-void
.end method

.method public final getState()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;
    .locals 1

    .line 50
    invoke-static {}, Lcom/dropbox/core/android/internal/AuthSessionViewModel;->access$get_state$cp()Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object v0

    return-object v0
.end method

.method public final isAuthInProgress()Z
    .locals 1

    .line 53
    invoke-static {}, Lcom/dropbox/core/android/internal/AuthSessionViewModel;->access$getAuthInProgress$cp()Z

    move-result v0

    return v0
.end method

.method public final startAuthSession(Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;)V
    .locals 1

    const-string v0, "state"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 57
    invoke-static {v0}, Lcom/dropbox/core/android/internal/AuthSessionViewModel;->access$setAuthInProgress$cp(Z)V

    .line 58
    invoke-static {p1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel;->access$set_state$cp(Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;)V

    return-void
.end method
