.class Lcom/google/licensingservicehelper/LicensingServiceHelper$2;
.super Lcom/android/vending/licensing/ILicenseV2ResultListener$Stub;
.source "LicensingServiceHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/licensingservicehelper/LicensingServiceHelper;->callLicensingService()V
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

    .line 117
    iput-object p1, p0, Lcom/google/licensingservicehelper/LicensingServiceHelper$2;->this$0:Lcom/google/licensingservicehelper/LicensingServiceHelper;

    invoke-direct {p0}, Lcom/android/vending/licensing/ILicenseV2ResultListener$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public verifyLicense(ILandroid/os/Bundle;)V
    .locals 4

    .line 120
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const-string v0, "responseCode: %d"

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "LicensingServiceHelper"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p1, :cond_0

    .line 124
    const-string p1, "LICENSE_DATA"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 126
    :try_start_0
    iget-object p2, p0, Lcom/google/licensingservicehelper/LicensingServiceHelper$2;->this$0:Lcom/google/licensingservicehelper/LicensingServiceHelper;

    .line 127
    invoke-static {p2}, Lcom/google/licensingservicehelper/LicensingServiceHelper;->access$200(Lcom/google/licensingservicehelper/LicensingServiceHelper;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/google/licensingservicehelper/LicensingServiceHelper;->access$300(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 128
    iget-object p2, p0, Lcom/google/licensingservicehelper/LicensingServiceHelper$2;->this$0:Lcom/google/licensingservicehelper/LicensingServiceHelper;

    invoke-static {p2}, Lcom/google/licensingservicehelper/LicensingServiceHelper;->access$400(Lcom/google/licensingservicehelper/LicensingServiceHelper;)Lcom/google/licensingservicehelper/LicensingServiceCallback;

    move-result-object p2

    invoke-interface {p2, p1}, Lcom/google/licensingservicehelper/LicensingServiceCallback;->allow(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 130
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    iget-object p1, p0, Lcom/google/licensingservicehelper/LicensingServiceHelper$2;->this$0:Lcom/google/licensingservicehelper/LicensingServiceHelper;

    invoke-static {p1}, Lcom/google/licensingservicehelper/LicensingServiceHelper;->access$400(Lcom/google/licensingservicehelper/LicensingServiceHelper;)Lcom/google/licensingservicehelper/LicensingServiceCallback;

    move-result-object p1

    const-string p2, "Error verifying payload response signature"

    invoke-interface {p1, p2}, Lcom/google/licensingservicehelper/LicensingServiceCallback;->applicationError(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    if-ne p1, v1, :cond_1

    .line 137
    iget-object p1, p0, Lcom/google/licensingservicehelper/LicensingServiceHelper$2;->this$0:Lcom/google/licensingservicehelper/LicensingServiceHelper;

    invoke-static {p1}, Lcom/google/licensingservicehelper/LicensingServiceHelper;->access$400(Lcom/google/licensingservicehelper/LicensingServiceHelper;)Lcom/google/licensingservicehelper/LicensingServiceCallback;

    move-result-object p1

    const-string p2, "Unsupported response code (LICENSED_WITH_NONCE)"

    invoke-interface {p1, p2}, Lcom/google/licensingservicehelper/LicensingServiceCallback;->applicationError(Ljava/lang/String;)V

    return-void

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 140
    const-string p1, "PAYWALL_INTENT"

    .line 141
    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/app/PendingIntent;

    .line 142
    iget-object p2, p0, Lcom/google/licensingservicehelper/LicensingServiceHelper$2;->this$0:Lcom/google/licensingservicehelper/LicensingServiceHelper;

    invoke-static {p2}, Lcom/google/licensingservicehelper/LicensingServiceHelper;->access$400(Lcom/google/licensingservicehelper/LicensingServiceHelper;)Lcom/google/licensingservicehelper/LicensingServiceCallback;

    move-result-object p2

    invoke-interface {p2, p1}, Lcom/google/licensingservicehelper/LicensingServiceCallback;->dontAllow(Landroid/app/PendingIntent;)V

    return-void

    :cond_2
    const/4 p2, 0x3

    if-ne p1, p2, :cond_3

    .line 144
    iget-object p1, p0, Lcom/google/licensingservicehelper/LicensingServiceHelper$2;->this$0:Lcom/google/licensingservicehelper/LicensingServiceHelper;

    invoke-static {p1}, Lcom/google/licensingservicehelper/LicensingServiceHelper;->access$400(Lcom/google/licensingservicehelper/LicensingServiceHelper;)Lcom/google/licensingservicehelper/LicensingServiceCallback;

    move-result-object p1

    const-string p2, "Application uid doesn\'t match uid of requester"

    invoke-interface {p1, p2}, Lcom/google/licensingservicehelper/LicensingServiceCallback;->applicationError(Ljava/lang/String;)V

    return-void

    :cond_3
    const/4 p2, 0x4

    if-ne p1, p2, :cond_4

    .line 147
    iget-object p1, p0, Lcom/google/licensingservicehelper/LicensingServiceHelper$2;->this$0:Lcom/google/licensingservicehelper/LicensingServiceHelper;

    invoke-static {p1}, Lcom/google/licensingservicehelper/LicensingServiceHelper;->access$400(Lcom/google/licensingservicehelper/LicensingServiceHelper;)Lcom/google/licensingservicehelper/LicensingServiceCallback;

    move-result-object p1

    const-string p2, "Requested package not found on device"

    invoke-interface {p1, p2}, Lcom/google/licensingservicehelper/LicensingServiceCallback;->applicationError(Ljava/lang/String;)V

    return-void

    .line 150
    :cond_4
    iget-object p2, p0, Lcom/google/licensingservicehelper/LicensingServiceHelper$2;->this$0:Lcom/google/licensingservicehelper/LicensingServiceHelper;

    invoke-static {p2}, Lcom/google/licensingservicehelper/LicensingServiceHelper;->access$400(Lcom/google/licensingservicehelper/LicensingServiceHelper;)Lcom/google/licensingservicehelper/LicensingServiceCallback;

    move-result-object p2

    .line 151
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/Object;

    aput-object p1, v0, v3

    const-string p1, "Unknown response code: %d"

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 150
    invoke-interface {p2, p1}, Lcom/google/licensingservicehelper/LicensingServiceCallback;->applicationError(Ljava/lang/String;)V

    return-void
.end method
