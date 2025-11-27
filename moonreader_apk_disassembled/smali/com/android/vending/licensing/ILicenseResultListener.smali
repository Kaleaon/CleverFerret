.class public interface abstract Lcom/android/vending/licensing/ILicenseResultListener;
.super Ljava/lang/Object;
.source "ILicenseResultListener.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/vending/licensing/ILicenseResultListener$Stub;,
        Lcom/android/vending/licensing/ILicenseResultListener$Default;
    }
.end annotation


# static fields
.field public static final DESCRIPTOR:Ljava/lang/String; = "com.android.vending.licensing.ILicenseResultListener"


# virtual methods
.method public abstract verifyLicense(ILjava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
