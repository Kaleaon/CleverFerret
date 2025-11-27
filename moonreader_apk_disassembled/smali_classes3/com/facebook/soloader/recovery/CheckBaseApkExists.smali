.class public Lcom/facebook/soloader/recovery/CheckBaseApkExists;
.super Ljava/lang/Object;
.source "CheckBaseApkExists.java"

# interfaces
.implements Lcom/facebook/soloader/recovery/RecoveryStrategy;


# static fields
.field private static final TAG:Ljava/lang/String; = "soloader.recovery.CheckBaseApkExists"


# instance fields
.field private final mBaseApkPathHistory:Lcom/facebook/soloader/recovery/BaseApkPathHistory;

.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/facebook/soloader/recovery/BaseApkPathHistory;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/facebook/soloader/recovery/CheckBaseApkExists;->mContext:Landroid/content/Context;

    .line 38
    iput-object p2, p0, Lcom/facebook/soloader/recovery/CheckBaseApkExists;->mBaseApkPathHistory:Lcom/facebook/soloader/recovery/BaseApkPathHistory;

    return-void
.end method


# virtual methods
.method public recover(Ljava/lang/UnsatisfiedLinkError;[Lcom/facebook/soloader/SoSource;)Z
    .locals 2

    .line 43
    iget-object p2, p0, Lcom/facebook/soloader/recovery/CheckBaseApkExists;->mContext:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p2

    iget-object p2, p2, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 45
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Base apk exists: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "soloader.recovery.CheckBaseApkExists"

    invoke-static {p2, p1}, Lcom/facebook/soloader/LogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    .line 46
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Base apk does not exist: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ". "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    iget-object p2, p0, Lcom/facebook/soloader/recovery/CheckBaseApkExists;->mBaseApkPathHistory:Lcom/facebook/soloader/recovery/BaseApkPathHistory;

    invoke-virtual {p2, v0}, Lcom/facebook/soloader/recovery/BaseApkPathHistory;->report(Ljava/lang/StringBuilder;)V

    .line 49
    new-instance p2, Lcom/facebook/soloader/NoBaseApkException;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0, p1}, Lcom/facebook/soloader/NoBaseApkException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method
