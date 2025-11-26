.class public Lcom/facebook/soloader/recovery/DefaultRecoveryStrategyFactory;
.super Ljava/lang/Object;
.source "DefaultRecoveryStrategyFactory.java"

# interfaces
.implements Lcom/facebook/soloader/recovery/RecoveryStrategyFactory;


# instance fields
.field private final mBaseApkPathHistory:Lcom/facebook/soloader/recovery/BaseApkPathHistory;

.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/facebook/soloader/recovery/DefaultRecoveryStrategyFactory;->mContext:Landroid/content/Context;

    .line 27
    new-instance v0, Lcom/facebook/soloader/recovery/BaseApkPathHistory;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lcom/facebook/soloader/recovery/BaseApkPathHistory;-><init>(I)V

    iput-object v0, p0, Lcom/facebook/soloader/recovery/DefaultRecoveryStrategyFactory;->mBaseApkPathHistory:Lcom/facebook/soloader/recovery/BaseApkPathHistory;

    .line 28
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p1

    iget-object p1, p1, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/facebook/soloader/recovery/BaseApkPathHistory;->recordPathIfNew(Ljava/lang/String;)Z

    return-void
.end method


# virtual methods
.method public get()Lcom/facebook/soloader/recovery/RecoveryStrategy;
    .locals 5

    .line 33
    new-instance v0, Lcom/facebook/soloader/recovery/CompositeRecoveryStrategy;

    const/4 v1, 0x6

    new-array v1, v1, [Lcom/facebook/soloader/recovery/RecoveryStrategy;

    new-instance v2, Lcom/facebook/soloader/recovery/WaitForAsyncInit;

    invoke-direct {v2}, Lcom/facebook/soloader/recovery/WaitForAsyncInit;-><init>()V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/facebook/soloader/recovery/DetectDataAppMove;

    iget-object v3, p0, Lcom/facebook/soloader/recovery/DefaultRecoveryStrategyFactory;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/facebook/soloader/recovery/DefaultRecoveryStrategyFactory;->mBaseApkPathHistory:Lcom/facebook/soloader/recovery/BaseApkPathHistory;

    invoke-direct {v2, v3, v4}, Lcom/facebook/soloader/recovery/DetectDataAppMove;-><init>(Landroid/content/Context;Lcom/facebook/soloader/recovery/BaseApkPathHistory;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-instance v2, Lcom/facebook/soloader/recovery/ReunpackBackupSoSources;

    invoke-direct {v2}, Lcom/facebook/soloader/recovery/ReunpackBackupSoSources;-><init>()V

    const/4 v3, 0x2

    aput-object v2, v1, v3

    new-instance v2, Lcom/facebook/soloader/recovery/ReunpackNonBackupSoSources;

    invoke-direct {v2}, Lcom/facebook/soloader/recovery/ReunpackNonBackupSoSources;-><init>()V

    const/4 v3, 0x3

    aput-object v2, v1, v3

    new-instance v2, Lcom/facebook/soloader/recovery/WaitForAsyncInit;

    invoke-direct {v2}, Lcom/facebook/soloader/recovery/WaitForAsyncInit;-><init>()V

    const/4 v3, 0x4

    aput-object v2, v1, v3

    new-instance v2, Lcom/facebook/soloader/recovery/CheckBaseApkExists;

    iget-object v3, p0, Lcom/facebook/soloader/recovery/DefaultRecoveryStrategyFactory;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/facebook/soloader/recovery/DefaultRecoveryStrategyFactory;->mBaseApkPathHistory:Lcom/facebook/soloader/recovery/BaseApkPathHistory;

    invoke-direct {v2, v3, v4}, Lcom/facebook/soloader/recovery/CheckBaseApkExists;-><init>(Landroid/content/Context;Lcom/facebook/soloader/recovery/BaseApkPathHistory;)V

    const/4 v3, 0x5

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/facebook/soloader/recovery/CompositeRecoveryStrategy;-><init>([Lcom/facebook/soloader/recovery/RecoveryStrategy;)V

    return-object v0
.end method
