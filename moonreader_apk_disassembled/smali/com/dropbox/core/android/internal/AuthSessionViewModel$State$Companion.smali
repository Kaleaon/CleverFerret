.class public final Lcom/dropbox/core/android/internal/AuthSessionViewModel$State$Companion;
.super Ljava/lang/Object;
.source "AuthSessionViewModel.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0010\u0010\u0003\u001a\u00020\u00042\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/dropbox/core/android/internal/AuthSessionViewModel$State$Companion;",
        "",
        "()V",
        "fromAuthParams",
        "Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;",
        "sAuthParams",
        "Lcom/dropbox/core/android/internal/AuthParameters;",
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

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final fromAuthParams(Lcom/dropbox/core/android/internal/AuthParameters;)Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;
    .locals 18

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 30
    invoke-virtual/range {p1 .. p1}, Lcom/dropbox/core/android/internal/AuthParameters;->getSAppKey()Ljava/lang/String;

    move-result-object v1

    move-object v7, v1

    goto :goto_0

    :cond_0
    move-object v7, v0

    :goto_0
    if-eqz p1, :cond_1

    .line 31
    invoke-virtual/range {p1 .. p1}, Lcom/dropbox/core/android/internal/AuthParameters;->getSApiType()Ljava/lang/String;

    move-result-object v1

    move-object v8, v1

    goto :goto_1

    :cond_1
    move-object v8, v0

    :goto_1
    if-eqz p1, :cond_2

    .line 32
    invoke-virtual/range {p1 .. p1}, Lcom/dropbox/core/android/internal/AuthParameters;->getSDesiredUid()Ljava/lang/String;

    move-result-object v1

    move-object v9, v1

    goto :goto_2

    :cond_2
    move-object v9, v0

    :goto_2
    if-eqz p1, :cond_3

    .line 33
    invoke-virtual/range {p1 .. p1}, Lcom/dropbox/core/android/internal/AuthParameters;->getSAlreadyAuthedUids()Ljava/util/List;

    move-result-object v1

    if-nez v1, :cond_4

    :cond_3
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v1

    :cond_4
    move-object v10, v1

    if-eqz p1, :cond_5

    .line 34
    invoke-virtual/range {p1 .. p1}, Lcom/dropbox/core/android/internal/AuthParameters;->getSSessionId()Ljava/lang/String;

    move-result-object v1

    move-object v11, v1

    goto :goto_3

    :cond_5
    move-object v11, v0

    :goto_3
    if-eqz p1, :cond_6

    .line 35
    invoke-virtual/range {p1 .. p1}, Lcom/dropbox/core/android/internal/AuthParameters;->getSTokenAccessType()Lcom/dropbox/core/TokenAccessType;

    move-result-object v1

    move-object v12, v1

    goto :goto_4

    :cond_6
    move-object v12, v0

    :goto_4
    if-eqz p1, :cond_7

    .line 36
    invoke-virtual/range {p1 .. p1}, Lcom/dropbox/core/android/internal/AuthParameters;->getSRequestConfig()Lcom/dropbox/core/DbxRequestConfig;

    move-result-object v1

    move-object v13, v1

    goto :goto_5

    :cond_7
    move-object v13, v0

    :goto_5
    if-eqz p1, :cond_8

    .line 37
    invoke-virtual/range {p1 .. p1}, Lcom/dropbox/core/android/internal/AuthParameters;->getSHost()Lcom/dropbox/core/DbxHost;

    move-result-object v1

    move-object v3, v1

    goto :goto_6

    :cond_8
    move-object v3, v0

    :goto_6
    if-eqz p1, :cond_9

    .line 38
    invoke-virtual/range {p1 .. p1}, Lcom/dropbox/core/android/internal/AuthParameters;->getSScope()Ljava/lang/String;

    move-result-object v1

    move-object v14, v1

    goto :goto_7

    :cond_9
    move-object v14, v0

    :goto_7
    if-eqz p1, :cond_a

    .line 39
    invoke-virtual/range {p1 .. p1}, Lcom/dropbox/core/android/internal/AuthParameters;->getSIncludeGrantedScopes()Lcom/dropbox/core/IncludeGrantedScopes;

    move-result-object v0

    :cond_a
    move-object v15, v0

    .line 29
    new-instance v2, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    const/16 v16, 0xe

    const/16 v17, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v2 .. v17}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;-><init>(Lcom/dropbox/core/DbxHost;Landroid/content/Intent;Lcom/dropbox/core/DbxPKCEManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/IncludeGrantedScopes;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v2
.end method
