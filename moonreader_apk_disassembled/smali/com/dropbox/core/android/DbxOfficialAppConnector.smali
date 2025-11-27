.class public final Lcom/dropbox/core/android/DbxOfficialAppConnector;
.super Ljava/lang/Object;
.source "DbxOfficialAppConnector.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/android/DbxOfficialAppConnector$DbxOfficialAppInstallInfo;,
        Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0018\u0000 \u00152\u00020\u0001:\u0002\u0015\u0016B\u000f\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0002\u0010\u0004J\u0018\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\rH\u0004J$\u0010\u000e\u001a\u0004\u0018\u00010\r2\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u00032\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0003J\u000e\u0010\u0011\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\u000bJ\u000e\u0010\u0012\u001a\u00020\u00132\u0006\u0010\n\u001a\u00020\u000bJ\u0012\u0010\u0014\u001a\u0004\u0018\u00010\r2\u0006\u0010\n\u001a\u00020\u000bH\u0004R\u001c\u0010\u0002\u001a\u0004\u0018\u00010\u0003X\u0084\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\"\u0004\u0008\u0007\u0010\u0004\u00a8\u0006\u0017"
    }
    d2 = {
        "Lcom/dropbox/core/android/DbxOfficialAppConnector;",
        "",
        "uid",
        "",
        "(Ljava/lang/String;)V",
        "getUid",
        "()Ljava/lang/String;",
        "setUid",
        "addExtrasToIntent",
        "",
        "context",
        "Landroid/content/Context;",
        "intent",
        "Landroid/content/Intent;",
        "getPreviewFileIntent",
        "path",
        "lastRev",
        "getUpgradeAccountIntent",
        "isSignedIn",
        "",
        "launchDropbox",
        "Companion",
        "DbxOfficialAppInstallInfo",
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
.field public static final ACTION_DBXC_EDIT:Ljava/lang/String; = "com.dropbox.android.intent.action.DBXC_EDIT"

.field public static final ACTION_DBXC_VIEW:Ljava/lang/String; = "com.dropbox.android.intent.action.DBXC_VIEW"

.field public static final ACTION_SHOW_DROPBOX_PREVIEW:Ljava/lang/String; = "com.dropbox.android.intent.action.SHOW_PREVIEW"

.field public static final ACTION_SHOW_UPGRADE:Ljava/lang/String; = "com.dropbox.android.intent.action.SHOW_UPGRADE"

.field private static final CORRECT_USER:I = 0x1

.field public static final Companion:Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;

.field private static final DROPBOX_APP_SIGNATURES:[Ljava/lang/String;

.field public static final EXTRA_CALLING_PACKAGE:Ljava/lang/String; = "com.dropbox.android.intent.extra.CALLING_PACKAGE"

.field public static final EXTRA_DROPBOX_PATH:Ljava/lang/String; = "com.dropbox.android.intent.extra.DROPBOX_PATH"

.field public static final EXTRA_DROPBOX_READ_ONLY:Ljava/lang/String; = "com.dropbox.android.intent.extra.READ_ONLY"

.field public static final EXTRA_DROPBOX_REV:Ljava/lang/String; = "com.dropbox.android.intent.extra.DROPBOX_REV"

.field public static final EXTRA_DROPBOX_SESSION_ID:Ljava/lang/String; = "com.dropbox.android.intent.extra.SESSION_ID"

.field public static final EXTRA_DROPBOX_UID:Ljava/lang/String; = "com.dropbox.android.intent.extra.DROPBOX_UID"

.field private static final LOGGED_IN_URI:Landroid/net/Uri;

.field private static final MIN_OPENWITH_VERSION:I = 0x3abdf

.field private static final NO_USER:I = 0x0

.field private static final WRONG_USER:I = -0x1


# instance fields
.field private uid:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->Companion:Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;

    .line 186
    const-string v0, "content://com.dropbox.android.provider.SDK/is_user_logged_in/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->LOGGED_IN_URI:Landroid/net/Uri;

    .line 238
    const-string v0, "308202223082018b02044bd207bd300d06092a864886f70d01010405003058310b3009060355040613025553310b3009060355040813024341311630140603550407130d53616e204672616e636973636f3110300e060355040a130744726f70626f783112301006035504031309546f6d204d65796572301e170d3130303432333230343930315a170d3430303431353230343930315a3058310b3009060355040613025553310b3009060355040813024341311630140603550407130d53616e204672616e636973636f3110300e060355040a130744726f70626f783112301006035504031309546f6d204d6579657230819f300d06092a864886f70d010101050003818d0030818902818100ac1595d0ab278a9577f0ca5a14144f96eccde75f5616f36172c562fab0e98c48ad7d64f1091c6cc11ce084a4313d522f899378d312e112a748827545146a779defa7c31d8c00c2ed73135802f6952f59798579859e0214d4e9c0554b53b26032a4d2dfc2f62540d776df2ea70e2a6152945fb53fef5bac5344251595b729d4810203010001300d06092a864886f70d01010405000381810055c425d94d036153203dc0bbeb3516f94563b102fff39c3d4ed91278db24fc4424a244c2e59f03bbfea59404512b8bf74662f2a32e37eafa2ac904c31f99cfc21c9ff375c977c432d3b6ec22776f28767d0f292144884538c3d5669b568e4254e4ed75d9054f75229ac9d4ccd0b7c3c74a34f07b7657083b2aa76225c0c56ffc"

    .line 255
    const-string v1, "308201e53082014ea00302010202044e17e115300d06092a864886f70d01010505003037310b30090603550406130255533110300e060355040a1307416e64726f6964311630140603550403130d416e64726f6964204465627567301e170d3131303730393035303331375a170d3431303730313035303331375a3037310b30090603550406130255533110300e060355040a1307416e64726f6964311630140603550403130d416e64726f696420446562756730819f300d06092a864886f70d010101050003818d003081890281810096759fe5abea6a0757039b92adc68d672efa84732c3f959408e12efa264545c61f23141026a6d01eceeeaa13ec7087087e5894a3363da8bf5c69ed93657a6890738a80998e4ca22dc94848f30e2d0e1890000ae2cddf543b20c0c3828deca6c7944b5ecd21a9d18c988b2b3e54517dafbc34b48e801bb1321e0fa49e4d575d7f0203010001300d06092a864886f70d0101050500038181002b6d4b65bcfa6ec7bac97ae6d878064d47b3f9f8da654995b8ef4c385bc4fbfbb7a987f60783ef0348760c0708acd4b7e63f0235c35a4fbcd5ec41b3b4cb295feaa7d5c27fa562a02562b7e1f4776b85147be3e295714986c4a9a07183f48ea09ae4d3ea31b88d0016c65b93526b9c45f2967c3d28dee1aff5a5b29b9c2c8639"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    .line 237
    sput-object v0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->DROPBOX_APP_SIGNATURES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 113
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    iput-object p1, p0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->uid:Ljava/lang/String;

    return-void

    .line 114
    :cond_0
    new-instance p1, Lcom/dropbox/core/android/DropboxUidNotInitializedException;

    .line 115
    const-string v0, "Must initialize session\'s uid before constructing DbxOfficialAppConnector"

    .line 114
    invoke-direct {p1, v0}, Lcom/dropbox/core/android/DropboxUidNotInitializedException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static final synthetic access$getDROPBOX_APP_SIGNATURES$cp()[Ljava/lang/String;
    .locals 1

    .line 38
    sget-object v0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->DROPBOX_APP_SIGNATURES:[Ljava/lang/String;

    return-object v0
.end method

.method public static final synthetic access$getLOGGED_IN_URI$cp()Landroid/net/Uri;
    .locals 1

    .line 38
    sget-object v0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->LOGGED_IN_URI:Landroid/net/Uri;

    return-object v0
.end method

.method public static final generateOpenWithIntentFromUtmContent(Ljava/lang/String;)Landroid/content/Intent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/android/DropboxParseException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->Companion:Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;

    invoke-virtual {v0, p0}, Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;->generateOpenWithIntentFromUtmContent(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method public static final getDropboxPlayStoreIntent()Landroid/content/Intent;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->Companion:Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;

    invoke-virtual {v0}, Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;->getDropboxPlayStoreIntent()Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static final isAnySignedIn(Landroid/content/Context;)Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->Companion:Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;

    invoke-virtual {v0, p0}, Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;->isAnySignedIn(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method public static final isInstalled(Landroid/content/Context;)Lcom/dropbox/core/android/DbxOfficialAppConnector$DbxOfficialAppInstallInfo;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->Companion:Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;

    invoke-virtual {v0, p0}, Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;->isInstalled(Landroid/content/Context;)Lcom/dropbox/core/android/DbxOfficialAppConnector$DbxOfficialAppInstallInfo;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method protected final addExtrasToIntent(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "intent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 68
    const-string v0, "com.dropbox.android.intent.extra.DROPBOX_UID"

    iget-object v1, p0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->uid:Ljava/lang/String;

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    const-string v0, "com.dropbox.android.intent.extra.CALLING_PACKAGE"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-void
.end method

.method public final getPreviewFileIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 137
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.dropbox.android.intent.action.SHOW_PREVIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 138
    invoke-virtual {p0, p1, v0}, Lcom/dropbox/core/android/DbxOfficialAppConnector;->addExtrasToIntent(Landroid/content/Context;Landroid/content/Intent;)V

    .line 139
    const-string v1, "com.dropbox.android.intent.extra.DROPBOX_PATH"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 140
    const-string p2, "com.dropbox.android.intent.extra.DROPBOX_REV"

    invoke-virtual {v0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 141
    sget-object p2, Lcom/dropbox/core/android/DbxOfficialAppConnector;->Companion:Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;

    invoke-virtual {p2, p1, v0}, Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;->getDropboxAppPackage$android_release(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/pm/PackageInfo;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 142
    move-object p2, p1

    check-cast p2, Landroid/content/Intent;

    return-object p1

    :cond_0
    return-object v0
.end method

.method protected final getUid()Ljava/lang/String;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->uid:Ljava/lang/String;

    return-object v0
.end method

.method public final getUpgradeAccountIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 94
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.dropbox.android.intent.action.SHOW_UPGRADE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 95
    invoke-virtual {p0, p1, v0}, Lcom/dropbox/core/android/DbxOfficialAppConnector;->addExtrasToIntent(Landroid/content/Context;Landroid/content/Intent;)V

    .line 96
    sget-object v1, Lcom/dropbox/core/android/DbxOfficialAppConnector;->Companion:Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;

    invoke-virtual {v1, p1, v0}, Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;->getDropboxAppPackage$android_release(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/pm/PackageInfo;

    move-result-object p1

    if-eqz p1, :cond_0

    return-object v0

    .line 100
    :cond_0
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 101
    const-string v0, "https://www.dropbox.com/upgrade?oqa=upeaoq"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    return-object p1
.end method

.method public final isSignedIn(Landroid/content/Context;)Z
    .locals 2

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 76
    sget-object v0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->Companion:Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;

    iget-object v1, p0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->uid:Ljava/lang/String;

    invoke-static {v0, p1, v1}, Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;->access$getLoggedinState(Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    return v0

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected final launchDropbox(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 82
    const-string v1, "com.dropbox.android"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 83
    sget-object v1, Lcom/dropbox/core/android/DbxOfficialAppConnector;->Companion:Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;

    invoke-virtual {v1, p1, v0}, Lcom/dropbox/core/android/DbxOfficialAppConnector$Companion;->getDropboxAppPackage$android_release(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/pm/PackageInfo;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 84
    move-object v0, p1

    check-cast v0, Landroid/content/Intent;

    return-object p1

    :cond_0
    return-object v0
.end method

.method protected final setUid(Ljava/lang/String;)V
    .locals 0

    .line 42
    iput-object p1, p0, Lcom/dropbox/core/android/DbxOfficialAppConnector;->uid:Ljava/lang/String;

    return-void
.end method
