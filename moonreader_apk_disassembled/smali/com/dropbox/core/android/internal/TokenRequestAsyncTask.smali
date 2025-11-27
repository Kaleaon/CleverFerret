.class public final Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;
.super Landroid/os/AsyncTask;
.source "TokenRequestAsyncTask.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/android/internal/TokenRequestAsyncTask$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/dropbox/core/DbxAuthFinish;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0008\u0003\u0008\u0000\u0018\u0000 \u00122\u0014\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0012B-\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u0005\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u00a2\u0006\u0002\u0010\rJ\'\u0010\u000e\u001a\u0004\u0018\u00010\u00032\u0016\u0010\u000f\u001a\u000c\u0012\u0008\u0008\u0001\u0012\u0004\u0018\u00010\u00020\u0010\"\u0004\u0018\u00010\u0002H\u0014\u00a2\u0006\u0002\u0010\u0011R\u000e\u0010\n\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;",
        "Landroid/os/AsyncTask;",
        "Ljava/lang/Void;",
        "Lcom/dropbox/core/DbxAuthFinish;",
        "code",
        "",
        "mPKCEManager",
        "Lcom/dropbox/core/DbxPKCEManager;",
        "requestConfig",
        "Lcom/dropbox/core/DbxRequestConfig;",
        "appKey",
        "host",
        "Lcom/dropbox/core/DbxHost;",
        "(Ljava/lang/String;Lcom/dropbox/core/DbxPKCEManager;Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/DbxHost;)V",
        "doInBackground",
        "params",
        "",
        "([Ljava/lang/Void;)Lcom/dropbox/core/DbxAuthFinish;",
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
.field public static final Companion:Lcom/dropbox/core/android/internal/TokenRequestAsyncTask$Companion;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final appKey:Ljava/lang/String;

.field private final code:Ljava/lang/String;

.field private final host:Lcom/dropbox/core/DbxHost;

.field private final mPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

.field private final requestConfig:Lcom/dropbox/core/DbxRequestConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;->Companion:Lcom/dropbox/core/android/internal/TokenRequestAsyncTask$Companion;

    .line 30
    const-string v0, "TokenRequestAsyncTask::class.java.simpleName"

    const-string v1, "TokenRequestAsyncTask"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sput-object v1, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/dropbox/core/DbxPKCEManager;Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/DbxHost;)V
    .locals 1

    const-string v0, "code"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "mPKCEManager"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "requestConfig"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "appKey"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "host"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;->code:Ljava/lang/String;

    .line 13
    iput-object p2, p0, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;->mPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

    .line 14
    iput-object p3, p0, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    .line 15
    iput-object p4, p0, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;->appKey:Ljava/lang/String;

    .line 16
    iput-object p5, p0, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;->host:Lcom/dropbox/core/DbxHost;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/dropbox/core/DbxAuthFinish;
    .locals 7

    const-string v0, "params"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    :try_start_0
    iget-object v1, p0, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;->mPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

    iget-object v2, p0, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;->requestConfig:Lcom/dropbox/core/DbxRequestConfig;

    iget-object v3, p0, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;->code:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;->appKey:Ljava/lang/String;

    const/4 v5, 0x0

    move-object p1, v5

    check-cast p1, Ljava/lang/String;

    iget-object v6, p0, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;->host:Lcom/dropbox/core/DbxHost;

    invoke-virtual/range {v1 .. v6}, Lcom/dropbox/core/DbxPKCEManager;->makeTokenRequest(Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/DbxHost;)Lcom/dropbox/core/DbxAuthFinish;

    move-result-object p1
    :try_end_0
    .catch Lcom/dropbox/core/DbxException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 24
    sget-object v0, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Token Request Failed: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/dropbox/core/DbxException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    .line 25
    move-object v0, p1

    check-cast v0, Lcom/dropbox/core/DbxAuthFinish;

    return-object p1
.end method

.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 11
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/dropbox/core/android/internal/TokenRequestAsyncTask;->doInBackground([Ljava/lang/Void;)Lcom/dropbox/core/DbxAuthFinish;

    move-result-object p1

    return-object p1
.end method
