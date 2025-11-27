.class public interface abstract Lcom/android/vending/licensing/ILicensingService;
.super Ljava/lang/Object;
.source "ILicensingService.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/vending/licensing/ILicensingService$_Parcel;,
        Lcom/android/vending/licensing/ILicensingService$Stub;,
        Lcom/android/vending/licensing/ILicensingService$Default;
    }
.end annotation


# static fields
.field public static final DESCRIPTOR:Ljava/lang/String; = "com.android.vending.licensing.ILicensingService"


# virtual methods
.method public abstract checkLicense(JLjava/lang/String;Lcom/android/vending/licensing/ILicenseResultListener;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract checkLicenseV2(Ljava/lang/String;Lcom/android/vending/licensing/ILicenseV2ResultListener;Landroid/os/Bundle;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
