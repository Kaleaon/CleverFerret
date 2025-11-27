.class Lcom/flyersoft/moonreaderp/PrefMisc$104;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->backupProc(Landroid/app/Dialog;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$autoCb:Landroid/widget/CheckBox;

.field final synthetic val$cloudType:I

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$timeRange:[Ljava/lang/String;


# direct methods
.method constructor <init>(ILandroid/widget/CheckBox;Landroid/content/Context;[Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2834
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$104;->val$cloudType:I

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$104;->val$autoCb:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$104;->val$con:Landroid/content/Context;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$104;->val$timeRange:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 5

    .line 2837
    sget p1, Lcom/flyersoft/tools/A;->autobackupCloud:I

    .line 2838
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$104;->val$cloudType:I

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2839
    sput-boolean p2, Lcom/flyersoft/tools/A;->autobackupLocal:Z

    goto :goto_1

    :cond_0
    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 2841
    :goto_0
    sput v0, Lcom/flyersoft/tools/A;->autobackupCloud:I

    .line 2842
    :goto_1
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$104;->val$cloudType:I

    if-eqz v0, :cond_2

    sget v0, Lcom/flyersoft/tools/A;->autobackupCloud:I

    if-eq p1, v0, :cond_2

    const-wide/16 v2, 0x0

    .line 2843
    sput-wide v2, Lcom/flyersoft/tools/A;->lastAutoBackupTime:J

    .line 2844
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$104;->val$autoCb:Landroid/widget/CheckBox;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$104;->val$con:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->auto_backup:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2845
    sget v2, Lcom/flyersoft/tools/A;->autobackupCloud:I

    const-string v3, " | "

    if-lez v2, :cond_3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v4, Lcom/flyersoft/tools/A;->autobackupCloud:I

    invoke-static {v4}, Lcom/flyersoft/components/cloud/Cloud;->getCloudName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_3
    const-string v2, ""

    :goto_2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$104;->val$timeRange:[Ljava/lang/String;

    sget v3, Lcom/flyersoft/tools/A;->autobackupType:I

    aget-object v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2844
    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    if-eqz p2, :cond_4

    .line 2847
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$104;->val$con:Landroid/content/Context;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$104;->val$con:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->auto_backup:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "..."

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x1

    const/4 v2, 0x0

    invoke-static {p1, v2, p2, v0, v1}, Lcom/flyersoft/tools/A;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/app/ProgressDialog;

    move-result-object p1

    .line 2848
    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->doAutoBackup(Landroid/app/ProgressDialog;)V

    :cond_4
    return-void
.end method
