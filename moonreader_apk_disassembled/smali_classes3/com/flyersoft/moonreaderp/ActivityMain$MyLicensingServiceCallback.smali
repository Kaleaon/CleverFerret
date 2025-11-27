.class Lcom/flyersoft/moonreaderp/ActivityMain$MyLicensingServiceCallback;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/google/licensingservicehelper/LicensingServiceCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyLicensingServiceCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method private constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 791
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MyLicensingServiceCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/moonreaderp/ActivityMain-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$MyLicensingServiceCallback;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method


# virtual methods
.method public allow(Ljava/lang/String;)V
    .locals 4

    .line 793
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MyLicensingServiceCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->isFinishing()Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 794
    :cond_0
    sget-wide v0, Lcom/flyersoft/tools/A;->license_state:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-gtz p1, :cond_1

    .line 795
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/flyersoft/tools/A;->license_state:J

    :cond_1
    const/4 p1, 0x1

    .line 796
    new-array p1, p1, [Ljava/lang/Object;

    const-string v0, "**license validated: allow"

    const/4 v1, 0x0

    aput-object v0, p1, v1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method

.method public applicationError(Ljava/lang/String;)V
    .locals 2

    .line 818
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MyLicensingServiceCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 819
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "**license error: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method

.method public dontAllow(Landroid/app/PendingIntent;)V
    .locals 4

    .line 800
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MyLicensingServiceCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 801
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "**license validated: dontAllow"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 803
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MyLicensingServiceCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fgetlicensingServiceHelper(Lcom/flyersoft/moonreaderp/ActivityMain;)Lcom/google/licensingservicehelper/LicensingServiceHelper;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/google/licensingservicehelper/LicensingServiceHelper;->showPaywall(Landroid/app/PendingIntent;)V

    .line 804
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 805
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->finish()V

    .line 806
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MyLicensingServiceCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->restoreTipDlg:Lcom/flyersoft/components/MyDialog;

    if-eqz p1, :cond_2

    .line 807
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MyLicensingServiceCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->restoreTipDlg:Lcom/flyersoft/components/MyDialog;

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->dismiss()V

    .line 808
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MyLicensingServiceCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->prefAbout:Lcom/flyersoft/moonreaderp/PrefAbout;

    if-eqz p1, :cond_3

    .line 809
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MyLicensingServiceCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->prefAbout:Lcom/flyersoft/moonreaderp/PrefAbout;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefAbout;->dismiss()V

    .line 810
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$MyLicensingServiceCallback;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->finish()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 812
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "---------Error launching paywall---------"

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 813
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
