.class Lcom/google/licensingservicehelper/LicensingServiceHelper$1;
.super Ljava/lang/Object;
.source "LicensingServiceHelper.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/licensingservicehelper/LicensingServiceHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/licensingservicehelper/LicensingServiceHelper;


# direct methods
.method constructor <init>(Lcom/google/licensingservicehelper/LicensingServiceHelper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 54
    iput-object p1, p0, Lcom/google/licensingservicehelper/LicensingServiceHelper$1;->this$0:Lcom/google/licensingservicehelper/LicensingServiceHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 0

    .line 57
    iget-object p1, p0, Lcom/google/licensingservicehelper/LicensingServiceHelper$1;->this$0:Lcom/google/licensingservicehelper/LicensingServiceHelper;

    invoke-static {p2}, Lcom/android/vending/licensing/ILicensingService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/vending/licensing/ILicensingService;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/google/licensingservicehelper/LicensingServiceHelper;->access$002(Lcom/google/licensingservicehelper/LicensingServiceHelper;Lcom/android/vending/licensing/ILicensingService;)Lcom/android/vending/licensing/ILicensingService;

    .line 58
    const-string p1, "LicensingServiceHelper"

    const-string p2, "Service connected"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    iget-object p1, p0, Lcom/google/licensingservicehelper/LicensingServiceHelper$1;->this$0:Lcom/google/licensingservicehelper/LicensingServiceHelper;

    invoke-static {p1}, Lcom/google/licensingservicehelper/LicensingServiceHelper;->access$100(Lcom/google/licensingservicehelper/LicensingServiceHelper;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 63
    iget-object p1, p0, Lcom/google/licensingservicehelper/LicensingServiceHelper$1;->this$0:Lcom/google/licensingservicehelper/LicensingServiceHelper;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/google/licensingservicehelper/LicensingServiceHelper;->access$002(Lcom/google/licensingservicehelper/LicensingServiceHelper;Lcom/android/vending/licensing/ILicensingService;)Lcom/android/vending/licensing/ILicensingService;

    .line 64
    const-string p1, "LicensingServiceHelper"

    const-string v0, "Service disconnected"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
