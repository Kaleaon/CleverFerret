.class public interface abstract Lcom/android/vending/licensing/ILicenseV2ResultListener;
.super Ljava/lang/Object;
.source "ILicenseV2ResultListener.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/vending/licensing/ILicenseV2ResultListener$_Parcel;,
        Lcom/android/vending/licensing/ILicenseV2ResultListener$Stub;,
        Lcom/android/vending/licensing/ILicenseV2ResultListener$Default;
    }
.end annotation


# static fields
.field public static final DESCRIPTOR:Ljava/lang/String; = "com.android.vending.licensing.ILicenseV2ResultListener"


# virtual methods
.method public abstract verifyLicense(ILandroid/os/Bundle;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
