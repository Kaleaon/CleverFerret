.class public Lcom/facebook/soloader/recovery/DetectDataAppMove;
.super Ljava/lang/Object;
.source "DetectDataAppMove.java"

# interfaces
.implements Lcom/facebook/soloader/recovery/RecoveryStrategy;


# static fields
.field private static final TAG:Ljava/lang/String; = "soloader.recovery.DetectDataAppMove"


# instance fields
.field private final mBaseApkPathHistory:Lcom/facebook/soloader/recovery/BaseApkPathHistory;

.field private final mContext:Landroid/content/Context;

.field private final mInitialHistorySize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/facebook/soloader/recovery/BaseApkPathHistory;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/facebook/soloader/recovery/DetectDataAppMove;->mContext:Landroid/content/Context;

    .line 34
    iput-object p2, p0, Lcom/facebook/soloader/recovery/DetectDataAppMove;->mBaseApkPathHistory:Lcom/facebook/soloader/recovery/BaseApkPathHistory;

    .line 35
    invoke-virtual {p2}, Lcom/facebook/soloader/recovery/BaseApkPathHistory;->size()I

    move-result p1

    iput p1, p0, Lcom/facebook/soloader/recovery/DetectDataAppMove;->mInitialHistorySize:I

    return-void
.end method

.method private detectMove()Z
    .locals 2

    .line 54
    invoke-direct {p0}, Lcom/facebook/soloader/recovery/DetectDataAppMove;->getBaseApkPath()Ljava/lang/String;

    move-result-object v0

    .line 55
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/facebook/soloader/recovery/DetectDataAppMove;->mBaseApkPathHistory:Lcom/facebook/soloader/recovery/BaseApkPathHistory;

    invoke-virtual {v1, v0}, Lcom/facebook/soloader/recovery/BaseApkPathHistory;->recordPathIfNew(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private getBaseApkPath()Ljava/lang/String;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/facebook/soloader/recovery/DetectDataAppMove;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    return-object v0
.end method

.method private recoverSoSources([Lcom/facebook/soloader/SoSource;)V
    .locals 3

    const/4 v0, 0x0

    .line 59
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 60
    aget-object v1, p1, v0

    instance-of v2, v1, Lcom/facebook/soloader/RecoverableSoSource;

    if-eqz v2, :cond_0

    .line 61
    check-cast v1, Lcom/facebook/soloader/RecoverableSoSource;

    .line 62
    iget-object v2, p0, Lcom/facebook/soloader/recovery/DetectDataAppMove;->mContext:Landroid/content/Context;

    invoke-interface {v1, v2}, Lcom/facebook/soloader/RecoverableSoSource;->recover(Landroid/content/Context;)Lcom/facebook/soloader/SoSource;

    move-result-object v1

    aput-object v1, p1, v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public recover(Ljava/lang/UnsatisfiedLinkError;[Lcom/facebook/soloader/SoSource;)Z
    .locals 1

    .line 40
    invoke-direct {p0}, Lcom/facebook/soloader/recovery/DetectDataAppMove;->detectMove()Z

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    .line 41
    invoke-direct {p0, p2}, Lcom/facebook/soloader/recovery/DetectDataAppMove;->recoverSoSources([Lcom/facebook/soloader/SoSource;)V

    return v0

    .line 45
    :cond_0
    iget p1, p0, Lcom/facebook/soloader/recovery/DetectDataAppMove;->mInitialHistorySize:I

    iget-object p2, p0, Lcom/facebook/soloader/recovery/DetectDataAppMove;->mBaseApkPathHistory:Lcom/facebook/soloader/recovery/BaseApkPathHistory;

    invoke-virtual {p2}, Lcom/facebook/soloader/recovery/BaseApkPathHistory;->size()I

    move-result p2

    if-eq p1, p2, :cond_1

    .line 46
    const-string p1, "soloader.recovery.DetectDataAppMove"

    const-string p2, "Context was updated (perhaps by another thread)"

    invoke-static {p1, p2}, Lcom/facebook/soloader/LogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_1
    const/4 p1, 0x0

    return p1
.end method
