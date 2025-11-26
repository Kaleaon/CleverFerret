.class public final Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;
.super Ljava/lang/Object;
.source "AuthSessionViewModel.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/android/internal/AuthSessionViewModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/android/internal/AuthSessionViewModel$State$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000R\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008:\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u0008\u0080\u0008\u0018\u0000 V2\u00020\u0001:\u0001VB\u00a3\u0001\u0012\n\u0008\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u0012\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\t\u0012\n\u0008\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\u0008\u0002\u0010\u000b\u001a\u0004\u0018\u00010\t\u0012\n\u0008\u0002\u0010\u000c\u001a\u0004\u0018\u00010\t\u0012\u000e\u0008\u0002\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\t0\u000e\u0012\n\u0008\u0002\u0010\u000f\u001a\u0004\u0018\u00010\t\u0012\n\u0008\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0011\u0012\n\u0008\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0013\u0012\n\u0008\u0002\u0010\u0014\u001a\u0004\u0018\u00010\t\u0012\n\u0008\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0016\u00a2\u0006\u0002\u0010\u0017J\u000b\u0010B\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003J\u000b\u0010C\u001a\u0004\u0018\u00010\u0011H\u00c6\u0003J\u000b\u0010D\u001a\u0004\u0018\u00010\u0013H\u00c6\u0003J\u000b\u0010E\u001a\u0004\u0018\u00010\tH\u00c6\u0003J\u000b\u0010F\u001a\u0004\u0018\u00010\u0016H\u00c6\u0003J\u000b\u0010G\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\t\u0010H\u001a\u00020\u0007H\u00c6\u0003J\u000b\u0010I\u001a\u0004\u0018\u00010\tH\u00c6\u0003J\u000b\u0010J\u001a\u0004\u0018\u00010\tH\u00c6\u0003J\u000b\u0010K\u001a\u0004\u0018\u00010\tH\u00c6\u0003J\u000b\u0010L\u001a\u0004\u0018\u00010\tH\u00c6\u0003J\u000f\u0010M\u001a\u0008\u0012\u0004\u0012\u00020\t0\u000eH\u00c6\u0003J\u000b\u0010N\u001a\u0004\u0018\u00010\tH\u00c6\u0003J\u00a7\u0001\u0010O\u001a\u00020\u00002\n\u0008\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\t2\n\u0008\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\u0008\u0002\u0010\u000b\u001a\u0004\u0018\u00010\t2\n\u0008\u0002\u0010\u000c\u001a\u0004\u0018\u00010\t2\u000e\u0008\u0002\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\t0\u000e2\n\u0008\u0002\u0010\u000f\u001a\u0004\u0018\u00010\t2\n\u0008\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112\n\u0008\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00132\n\u0008\u0002\u0010\u0014\u001a\u0004\u0018\u00010\t2\n\u0008\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0016H\u00c6\u0001J\u0013\u0010P\u001a\u00020Q2\u0008\u0010R\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010S\u001a\u00020TH\u00d6\u0001J\t\u0010U\u001a\u00020\tH\u00d6\u0001R \u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\t0\u000eX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0018\u0010\u0019\"\u0004\u0008\u001a\u0010\u001bR\u001c\u0010\u000b\u001a\u0004\u0018\u00010\tX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001c\u0010\u001d\"\u0004\u0008\u001e\u0010\u001fR\u001c\u0010\n\u001a\u0004\u0018\u00010\tX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008 \u0010\u001d\"\u0004\u0008!\u0010\u001fR\u001c\u0010\u0008\u001a\u0004\u0018\u00010\tX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\"\u0010\u001d\"\u0004\u0008#\u0010\u001fR\u001c\u0010\u000c\u001a\u0004\u0018\u00010\tX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008$\u0010\u001d\"\u0004\u0008%\u0010\u001fR\u001c\u0010\u0002\u001a\u0004\u0018\u00010\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008&\u0010\'\"\u0004\u0008(\u0010)R\u001c\u0010\u0015\u001a\u0004\u0018\u00010\u0016X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008*\u0010+\"\u0004\u0008,\u0010-R\u001a\u0010\u0006\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008.\u0010/\"\u0004\u00080\u00101R\u001c\u0010\u0012\u001a\u0004\u0018\u00010\u0013X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00082\u00103\"\u0004\u00084\u00105R\u001c\u0010\u0014\u001a\u0004\u0018\u00010\tX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00086\u0010\u001d\"\u0004\u00087\u0010\u001fR\u001c\u0010\u000f\u001a\u0004\u0018\u00010\tX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00088\u0010\u001d\"\u0004\u00089\u0010\u001fR\u001c\u0010\u0010\u001a\u0004\u0018\u00010\u0011X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008:\u0010;\"\u0004\u0008<\u0010=R\u001c\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008>\u0010?\"\u0004\u0008@\u0010A\u00a8\u0006W"
    }
    d2 = {
        "Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;",
        "",
        "mHost",
        "Lcom/dropbox/core/DbxHost;",
        "result",
        "Landroid/content/Intent;",
        "mPKCEManager",
        "Lcom/dropbox/core/DbxPKCEManager;",
        "mAuthStateNonce",
        "",
        "mAppKey",
        "mApiType",
        "mDesiredUid",
        "mAlreadyAuthedUids",
        "",
        "mSessionId",
        "mTokenAccessType",
        "Lcom/dropbox/core/TokenAccessType;",
        "mRequestConfig",
        "Lcom/dropbox/core/DbxRequestConfig;",
        "mScope",
        "mIncludeGrantedScopes",
        "Lcom/dropbox/core/IncludeGrantedScopes;",
        "(Lcom/dropbox/core/DbxHost;Landroid/content/Intent;Lcom/dropbox/core/DbxPKCEManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/IncludeGrantedScopes;)V",
        "getMAlreadyAuthedUids",
        "()Ljava/util/List;",
        "setMAlreadyAuthedUids",
        "(Ljava/util/List;)V",
        "getMApiType",
        "()Ljava/lang/String;",
        "setMApiType",
        "(Ljava/lang/String;)V",
        "getMAppKey",
        "setMAppKey",
        "getMAuthStateNonce",
        "setMAuthStateNonce",
        "getMDesiredUid",
        "setMDesiredUid",
        "getMHost",
        "()Lcom/dropbox/core/DbxHost;",
        "setMHost",
        "(Lcom/dropbox/core/DbxHost;)V",
        "getMIncludeGrantedScopes",
        "()Lcom/dropbox/core/IncludeGrantedScopes;",
        "setMIncludeGrantedScopes",
        "(Lcom/dropbox/core/IncludeGrantedScopes;)V",
        "getMPKCEManager",
        "()Lcom/dropbox/core/DbxPKCEManager;",
        "setMPKCEManager",
        "(Lcom/dropbox/core/DbxPKCEManager;)V",
        "getMRequestConfig",
        "()Lcom/dropbox/core/DbxRequestConfig;",
        "setMRequestConfig",
        "(Lcom/dropbox/core/DbxRequestConfig;)V",
        "getMScope",
        "setMScope",
        "getMSessionId",
        "setMSessionId",
        "getMTokenAccessType",
        "()Lcom/dropbox/core/TokenAccessType;",
        "setMTokenAccessType",
        "(Lcom/dropbox/core/TokenAccessType;)V",
        "getResult",
        "()Landroid/content/Intent;",
        "setResult",
        "(Landroid/content/Intent;)V",
        "component1",
        "component10",
        "component11",
        "component12",
        "component13",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "component7",
        "component8",
        "component9",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "",
        "toString",
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
.field public static final Companion:Lcom/dropbox/core/android/internal/AuthSessionViewModel$State$Companion;


# instance fields
.field private mAlreadyAuthedUids:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mApiType:Ljava/lang/String;

.field private mAppKey:Ljava/lang/String;

.field private mAuthStateNonce:Ljava/lang/String;

.field private mDesiredUid:Ljava/lang/String;

.field private mHost:Lcom/dropbox/core/DbxHost;

.field private mIncludeGrantedScopes:Lcom/dropbox/core/IncludeGrantedScopes;

.field private mPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

.field private mRequestConfig:Lcom/dropbox/core/DbxRequestConfig;

.field private mScope:Ljava/lang/String;

.field private mSessionId:Ljava/lang/String;

.field private mTokenAccessType:Lcom/dropbox/core/TokenAccessType;

.field private result:Landroid/content/Intent;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->Companion:Lcom/dropbox/core/android/internal/AuthSessionViewModel$State$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 16

    const/16 v14, 0x1fff

    const/4 v15, 0x0

    const/4 v1, 0x0

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

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v15}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;-><init>(Lcom/dropbox/core/DbxHost;Landroid/content/Intent;Lcom/dropbox/core/DbxPKCEManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/IncludeGrantedScopes;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/DbxHost;Landroid/content/Intent;Lcom/dropbox/core/DbxPKCEManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/IncludeGrantedScopes;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/DbxHost;",
            "Landroid/content/Intent;",
            "Lcom/dropbox/core/DbxPKCEManager;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/TokenAccessType;",
            "Lcom/dropbox/core/DbxRequestConfig;",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/IncludeGrantedScopes;",
            ")V"
        }
    .end annotation

    const-string v0, "mPKCEManager"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "mAlreadyAuthedUids"

    invoke-static {p8, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mHost:Lcom/dropbox/core/DbxHost;

    .line 14
    iput-object p2, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->result:Landroid/content/Intent;

    .line 15
    iput-object p3, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

    .line 16
    iput-object p4, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAuthStateNonce:Ljava/lang/String;

    .line 17
    iput-object p5, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAppKey:Ljava/lang/String;

    .line 18
    iput-object p6, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mApiType:Ljava/lang/String;

    .line 19
    iput-object p7, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mDesiredUid:Ljava/lang/String;

    .line 20
    iput-object p8, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAlreadyAuthedUids:Ljava/util/List;

    .line 21
    iput-object p9, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mSessionId:Ljava/lang/String;

    .line 22
    iput-object p10, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mTokenAccessType:Lcom/dropbox/core/TokenAccessType;

    .line 23
    iput-object p11, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mRequestConfig:Lcom/dropbox/core/DbxRequestConfig;

    .line 24
    iput-object p12, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mScope:Ljava/lang/String;

    .line 25
    iput-object p13, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mIncludeGrantedScopes:Lcom/dropbox/core/IncludeGrantedScopes;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/dropbox/core/DbxHost;Landroid/content/Intent;Lcom/dropbox/core/DbxPKCEManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/IncludeGrantedScopes;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 13

    move/from16 v0, p14

    and-int/lit8 v1, v0, 0x1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    move-object p1, v2

    :cond_0
    and-int/lit8 v1, v0, 0x2

    if-eqz v1, :cond_1

    move-object v1, v2

    goto :goto_0

    :cond_1
    move-object v1, p2

    :goto_0
    and-int/lit8 v3, v0, 0x4

    if-eqz v3, :cond_2

    .line 15
    new-instance v3, Lcom/dropbox/core/DbxPKCEManager;

    invoke-direct {v3}, Lcom/dropbox/core/DbxPKCEManager;-><init>()V

    goto :goto_1

    :cond_2
    move-object/from16 v3, p3

    :goto_1
    and-int/lit8 v4, v0, 0x8

    if-eqz v4, :cond_3

    move-object v4, v2

    goto :goto_2

    :cond_3
    move-object/from16 v4, p4

    :goto_2
    and-int/lit8 v5, v0, 0x10

    if-eqz v5, :cond_4

    move-object v5, v2

    goto :goto_3

    :cond_4
    move-object/from16 v5, p5

    :goto_3
    and-int/lit8 v6, v0, 0x20

    if-eqz v6, :cond_5

    move-object v6, v2

    goto :goto_4

    :cond_5
    move-object/from16 v6, p6

    :goto_4
    and-int/lit8 v7, v0, 0x40

    if-eqz v7, :cond_6

    move-object v7, v2

    goto :goto_5

    :cond_6
    move-object/from16 v7, p7

    :goto_5
    and-int/lit16 v8, v0, 0x80

    if-eqz v8, :cond_7

    .line 20
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v8

    goto :goto_6

    :cond_7
    move-object/from16 v8, p8

    :goto_6
    and-int/lit16 v9, v0, 0x100

    if-eqz v9, :cond_8

    move-object v9, v2

    goto :goto_7

    :cond_8
    move-object/from16 v9, p9

    :goto_7
    and-int/lit16 v10, v0, 0x200

    if-eqz v10, :cond_9

    move-object v10, v2

    goto :goto_8

    :cond_9
    move-object/from16 v10, p10

    :goto_8
    and-int/lit16 v11, v0, 0x400

    if-eqz v11, :cond_a

    move-object v11, v2

    goto :goto_9

    :cond_a
    move-object/from16 v11, p11

    :goto_9
    and-int/lit16 v12, v0, 0x800

    if-eqz v12, :cond_b

    move-object v12, v2

    goto :goto_a

    :cond_b
    move-object/from16 v12, p12

    :goto_a
    and-int/lit16 v0, v0, 0x1000

    if-eqz v0, :cond_c

    move-object/from16 p14, v2

    goto :goto_b

    :cond_c
    move-object/from16 p14, p13

    :goto_b
    move-object p2, p1

    move-object/from16 p3, v1

    move-object/from16 p4, v3

    move-object/from16 p5, v4

    move-object/from16 p6, v5

    move-object/from16 p7, v6

    move-object/from16 p8, v7

    move-object/from16 p9, v8

    move-object/from16 p10, v9

    move-object/from16 p11, v10

    move-object/from16 p12, v11

    move-object/from16 p13, v12

    move-object p1, p0

    .line 12
    invoke-direct/range {p1 .. p14}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;-><init>(Lcom/dropbox/core/DbxHost;Landroid/content/Intent;Lcom/dropbox/core/DbxPKCEManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/IncludeGrantedScopes;)V

    return-void
.end method

.method public static synthetic copy$default(Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;Lcom/dropbox/core/DbxHost;Landroid/content/Intent;Lcom/dropbox/core/DbxPKCEManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/IncludeGrantedScopes;ILjava/lang/Object;)Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;
    .locals 12

    move/from16 v0, p14

    and-int/lit8 v1, v0, 0x1

    if-eqz v1, :cond_0

    iget-object p1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mHost:Lcom/dropbox/core/DbxHost;

    :cond_0
    and-int/lit8 v1, v0, 0x2

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->result:Landroid/content/Intent;

    goto :goto_0

    :cond_1
    move-object v1, p2

    :goto_0
    and-int/lit8 v2, v0, 0x4

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

    goto :goto_1

    :cond_2
    move-object v2, p3

    :goto_1
    and-int/lit8 v3, v0, 0x8

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAuthStateNonce:Ljava/lang/String;

    goto :goto_2

    :cond_3
    move-object/from16 v3, p4

    :goto_2
    and-int/lit8 v4, v0, 0x10

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAppKey:Ljava/lang/String;

    goto :goto_3

    :cond_4
    move-object/from16 v4, p5

    :goto_3
    and-int/lit8 v5, v0, 0x20

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mApiType:Ljava/lang/String;

    goto :goto_4

    :cond_5
    move-object/from16 v5, p6

    :goto_4
    and-int/lit8 v6, v0, 0x40

    if-eqz v6, :cond_6

    iget-object v6, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mDesiredUid:Ljava/lang/String;

    goto :goto_5

    :cond_6
    move-object/from16 v6, p7

    :goto_5
    and-int/lit16 v7, v0, 0x80

    if-eqz v7, :cond_7

    iget-object v7, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAlreadyAuthedUids:Ljava/util/List;

    goto :goto_6

    :cond_7
    move-object/from16 v7, p8

    :goto_6
    and-int/lit16 v8, v0, 0x100

    if-eqz v8, :cond_8

    iget-object v8, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mSessionId:Ljava/lang/String;

    goto :goto_7

    :cond_8
    move-object/from16 v8, p9

    :goto_7
    and-int/lit16 v9, v0, 0x200

    if-eqz v9, :cond_9

    iget-object v9, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mTokenAccessType:Lcom/dropbox/core/TokenAccessType;

    goto :goto_8

    :cond_9
    move-object/from16 v9, p10

    :goto_8
    and-int/lit16 v10, v0, 0x400

    if-eqz v10, :cond_a

    iget-object v10, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mRequestConfig:Lcom/dropbox/core/DbxRequestConfig;

    goto :goto_9

    :cond_a
    move-object/from16 v10, p11

    :goto_9
    and-int/lit16 v11, v0, 0x800

    if-eqz v11, :cond_b

    iget-object v11, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mScope:Ljava/lang/String;

    goto :goto_a

    :cond_b
    move-object/from16 v11, p12

    :goto_a
    and-int/lit16 v0, v0, 0x1000

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mIncludeGrantedScopes:Lcom/dropbox/core/IncludeGrantedScopes;

    move-object/from16 p15, v0

    goto :goto_b

    :cond_c
    move-object/from16 p15, p13

    :goto_b
    move-object p2, p0

    move-object p3, p1

    move-object/from16 p4, v1

    move-object/from16 p5, v2

    move-object/from16 p6, v3

    move-object/from16 p7, v4

    move-object/from16 p8, v5

    move-object/from16 p9, v6

    move-object/from16 p10, v7

    move-object/from16 p11, v8

    move-object/from16 p12, v9

    move-object/from16 p13, v10

    move-object/from16 p14, v11

    invoke-virtual/range {p2 .. p15}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->copy(Lcom/dropbox/core/DbxHost;Landroid/content/Intent;Lcom/dropbox/core/DbxPKCEManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/IncludeGrantedScopes;)Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Lcom/dropbox/core/DbxHost;
    .locals 1

    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mHost:Lcom/dropbox/core/DbxHost;

    return-object v0
.end method

.method public final component10()Lcom/dropbox/core/TokenAccessType;
    .locals 1

    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mTokenAccessType:Lcom/dropbox/core/TokenAccessType;

    return-object v0
.end method

.method public final component11()Lcom/dropbox/core/DbxRequestConfig;
    .locals 1

    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mRequestConfig:Lcom/dropbox/core/DbxRequestConfig;

    return-object v0
.end method

.method public final component12()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mScope:Ljava/lang/String;

    return-object v0
.end method

.method public final component13()Lcom/dropbox/core/IncludeGrantedScopes;
    .locals 1

    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mIncludeGrantedScopes:Lcom/dropbox/core/IncludeGrantedScopes;

    return-object v0
.end method

.method public final component2()Landroid/content/Intent;
    .locals 1

    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->result:Landroid/content/Intent;

    return-object v0
.end method

.method public final component3()Lcom/dropbox/core/DbxPKCEManager;
    .locals 1

    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

    return-object v0
.end method

.method public final component4()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAuthStateNonce:Ljava/lang/String;

    return-object v0
.end method

.method public final component5()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAppKey:Ljava/lang/String;

    return-object v0
.end method

.method public final component6()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mApiType:Ljava/lang/String;

    return-object v0
.end method

.method public final component7()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mDesiredUid:Ljava/lang/String;

    return-object v0
.end method

.method public final component8()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAlreadyAuthedUids:Ljava/util/List;

    return-object v0
.end method

.method public final component9()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mSessionId:Ljava/lang/String;

    return-object v0
.end method

.method public final copy(Lcom/dropbox/core/DbxHost;Landroid/content/Intent;Lcom/dropbox/core/DbxPKCEManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/IncludeGrantedScopes;)Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/DbxHost;",
            "Landroid/content/Intent;",
            "Lcom/dropbox/core/DbxPKCEManager;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/TokenAccessType;",
            "Lcom/dropbox/core/DbxRequestConfig;",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/IncludeGrantedScopes;",
            ")",
            "Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;"
        }
    .end annotation

    const-string v0, "mPKCEManager"

    move-object/from16 v4, p3

    invoke-static {v4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "mAlreadyAuthedUids"

    move-object/from16 v9, p8

    invoke-static {v9, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    move-object/from16 v14, p13

    invoke-direct/range {v1 .. v14}, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;-><init>(Lcom/dropbox/core/DbxHost;Landroid/content/Intent;Lcom/dropbox/core/DbxPKCEManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/dropbox/core/TokenAccessType;Lcom/dropbox/core/DbxRequestConfig;Ljava/lang/String;Lcom/dropbox/core/IncludeGrantedScopes;)V

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;

    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mHost:Lcom/dropbox/core/DbxHost;

    iget-object v3, p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mHost:Lcom/dropbox/core/DbxHost;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->result:Landroid/content/Intent;

    iget-object v3, p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->result:Landroid/content/Intent;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    :cond_3
    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

    iget-object v3, p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAuthStateNonce:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAuthStateNonce:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    :cond_5
    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAppKey:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAppKey:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    :cond_6
    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mApiType:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mApiType:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mDesiredUid:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mDesiredUid:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    return v2

    :cond_8
    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAlreadyAuthedUids:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAlreadyAuthedUids:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    return v2

    :cond_9
    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mSessionId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mSessionId:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    return v2

    :cond_a
    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mTokenAccessType:Lcom/dropbox/core/TokenAccessType;

    iget-object v3, p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mTokenAccessType:Lcom/dropbox/core/TokenAccessType;

    if-eq v1, v3, :cond_b

    return v2

    :cond_b
    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mRequestConfig:Lcom/dropbox/core/DbxRequestConfig;

    iget-object v3, p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mRequestConfig:Lcom/dropbox/core/DbxRequestConfig;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    return v2

    :cond_c
    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mScope:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mScope:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    return v2

    :cond_d
    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mIncludeGrantedScopes:Lcom/dropbox/core/IncludeGrantedScopes;

    iget-object p1, p1, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mIncludeGrantedScopes:Lcom/dropbox/core/IncludeGrantedScopes;

    if-eq v1, p1, :cond_e

    return v2

    :cond_e
    return v0
.end method

.method public final getMAlreadyAuthedUids()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 20
    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAlreadyAuthedUids:Ljava/util/List;

    return-object v0
.end method

.method public final getMApiType()Ljava/lang/String;
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mApiType:Ljava/lang/String;

    return-object v0
.end method

.method public final getMAppKey()Ljava/lang/String;
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAppKey:Ljava/lang/String;

    return-object v0
.end method

.method public final getMAuthStateNonce()Ljava/lang/String;
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAuthStateNonce:Ljava/lang/String;

    return-object v0
.end method

.method public final getMDesiredUid()Ljava/lang/String;
    .locals 1

    .line 19
    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mDesiredUid:Ljava/lang/String;

    return-object v0
.end method

.method public final getMHost()Lcom/dropbox/core/DbxHost;
    .locals 1

    .line 13
    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mHost:Lcom/dropbox/core/DbxHost;

    return-object v0
.end method

.method public final getMIncludeGrantedScopes()Lcom/dropbox/core/IncludeGrantedScopes;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mIncludeGrantedScopes:Lcom/dropbox/core/IncludeGrantedScopes;

    return-object v0
.end method

.method public final getMPKCEManager()Lcom/dropbox/core/DbxPKCEManager;
    .locals 1

    .line 15
    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

    return-object v0
.end method

.method public final getMRequestConfig()Lcom/dropbox/core/DbxRequestConfig;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mRequestConfig:Lcom/dropbox/core/DbxRequestConfig;

    return-object v0
.end method

.method public final getMScope()Ljava/lang/String;
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mScope:Ljava/lang/String;

    return-object v0
.end method

.method public final getMSessionId()Ljava/lang/String;
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mSessionId:Ljava/lang/String;

    return-object v0
.end method

.method public final getMTokenAccessType()Lcom/dropbox/core/TokenAccessType;
    .locals 1

    .line 22
    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mTokenAccessType:Lcom/dropbox/core/TokenAccessType;

    return-object v0
.end method

.method public final getResult()Landroid/content/Intent;
    .locals 1

    .line 14
    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->result:Landroid/content/Intent;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mHost:Lcom/dropbox/core/DbxHost;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/dropbox/core/DbxHost;->hashCode()I

    move-result v0

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->result:Landroid/content/Intent;

    if-nez v2, :cond_1

    const/4 v2, 0x0

    goto :goto_1

    :cond_1
    invoke-virtual {v2}, Landroid/content/Intent;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

    invoke-virtual {v2}, Lcom/dropbox/core/DbxPKCEManager;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAuthStateNonce:Ljava/lang/String;

    if-nez v2, :cond_2

    const/4 v2, 0x0

    goto :goto_2

    :cond_2
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAppKey:Ljava/lang/String;

    if-nez v2, :cond_3

    const/4 v2, 0x0

    goto :goto_3

    :cond_3
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_3
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mApiType:Ljava/lang/String;

    if-nez v2, :cond_4

    const/4 v2, 0x0

    goto :goto_4

    :cond_4
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_4
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mDesiredUid:Ljava/lang/String;

    if-nez v2, :cond_5

    const/4 v2, 0x0

    goto :goto_5

    :cond_5
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_5
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAlreadyAuthedUids:Ljava/util/List;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mSessionId:Ljava/lang/String;

    if-nez v2, :cond_6

    const/4 v2, 0x0

    goto :goto_6

    :cond_6
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_6
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mTokenAccessType:Lcom/dropbox/core/TokenAccessType;

    if-nez v2, :cond_7

    const/4 v2, 0x0

    goto :goto_7

    :cond_7
    invoke-virtual {v2}, Lcom/dropbox/core/TokenAccessType;->hashCode()I

    move-result v2

    :goto_7
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mRequestConfig:Lcom/dropbox/core/DbxRequestConfig;

    if-nez v2, :cond_8

    const/4 v2, 0x0

    goto :goto_8

    :cond_8
    invoke-virtual {v2}, Lcom/dropbox/core/DbxRequestConfig;->hashCode()I

    move-result v2

    :goto_8
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mScope:Ljava/lang/String;

    if-nez v2, :cond_9

    const/4 v2, 0x0

    goto :goto_9

    :cond_9
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_9
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mIncludeGrantedScopes:Lcom/dropbox/core/IncludeGrantedScopes;

    if-nez v2, :cond_a

    goto :goto_a

    :cond_a
    invoke-virtual {v2}, Lcom/dropbox/core/IncludeGrantedScopes;->hashCode()I

    move-result v1

    :goto_a
    add-int/2addr v0, v1

    return v0
.end method

.method public final setMAlreadyAuthedUids(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    iput-object p1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAlreadyAuthedUids:Ljava/util/List;

    return-void
.end method

.method public final setMApiType(Ljava/lang/String;)V
    .locals 0

    .line 18
    iput-object p1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mApiType:Ljava/lang/String;

    return-void
.end method

.method public final setMAppKey(Ljava/lang/String;)V
    .locals 0

    .line 17
    iput-object p1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAppKey:Ljava/lang/String;

    return-void
.end method

.method public final setMAuthStateNonce(Ljava/lang/String;)V
    .locals 0

    .line 16
    iput-object p1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAuthStateNonce:Ljava/lang/String;

    return-void
.end method

.method public final setMDesiredUid(Ljava/lang/String;)V
    .locals 0

    .line 19
    iput-object p1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mDesiredUid:Ljava/lang/String;

    return-void
.end method

.method public final setMHost(Lcom/dropbox/core/DbxHost;)V
    .locals 0

    .line 13
    iput-object p1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mHost:Lcom/dropbox/core/DbxHost;

    return-void
.end method

.method public final setMIncludeGrantedScopes(Lcom/dropbox/core/IncludeGrantedScopes;)V
    .locals 0

    .line 25
    iput-object p1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mIncludeGrantedScopes:Lcom/dropbox/core/IncludeGrantedScopes;

    return-void
.end method

.method public final setMPKCEManager(Lcom/dropbox/core/DbxPKCEManager;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    iput-object p1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

    return-void
.end method

.method public final setMRequestConfig(Lcom/dropbox/core/DbxRequestConfig;)V
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mRequestConfig:Lcom/dropbox/core/DbxRequestConfig;

    return-void
.end method

.method public final setMScope(Ljava/lang/String;)V
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mScope:Ljava/lang/String;

    return-void
.end method

.method public final setMSessionId(Ljava/lang/String;)V
    .locals 0

    .line 21
    iput-object p1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mSessionId:Ljava/lang/String;

    return-void
.end method

.method public final setMTokenAccessType(Lcom/dropbox/core/TokenAccessType;)V
    .locals 0

    .line 22
    iput-object p1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mTokenAccessType:Lcom/dropbox/core/TokenAccessType;

    return-void
.end method

.method public final setResult(Landroid/content/Intent;)V
    .locals 0

    .line 14
    iput-object p1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->result:Landroid/content/Intent;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "State(mHost="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mHost:Lcom/dropbox/core/DbxHost;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", result="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->result:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mPKCEManager="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mPKCEManager:Lcom/dropbox/core/DbxPKCEManager;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mAuthStateNonce="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAuthStateNonce:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mAppKey="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAppKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mApiType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mApiType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mDesiredUid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mDesiredUid:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mAlreadyAuthedUids="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mAlreadyAuthedUids:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mSessionId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mSessionId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mTokenAccessType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mTokenAccessType:Lcom/dropbox/core/TokenAccessType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mRequestConfig="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mRequestConfig:Lcom/dropbox/core/DbxRequestConfig;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mScope="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mScope:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mIncludeGrantedScopes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dropbox/core/android/internal/AuthSessionViewModel$State;->mIncludeGrantedScopes:Lcom/dropbox/core/IncludeGrantedScopes;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
