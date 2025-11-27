.class public abstract Lcom/android/vending/licensing/ILicenseV2ResultListener$Stub;
.super Landroid/os/Binder;
.source "ILicenseV2ResultListener.java"

# interfaces
.implements Lcom/android/vending/licensing/ILicenseV2ResultListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/vending/licensing/ILicenseV2ResultListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/vending/licensing/ILicenseV2ResultListener$Stub$Proxy;
    }
.end annotation


# static fields
.field static final TRANSACTION_verifyLicense:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 60
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 61
    const-string v0, "com.android.vending.licensing.ILicenseV2ResultListener"

    invoke-virtual {p0, p0, v0}, Lcom/android/vending/licensing/ILicenseV2ResultListener$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/android/vending/licensing/ILicenseV2ResultListener;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 72
    :cond_0
    const-string v0, "com.android.vending.licensing.ILicenseV2ResultListener"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 73
    instance-of v1, v0, Lcom/android/vending/licensing/ILicenseV2ResultListener;

    if-eqz v1, :cond_1

    .line 74
    check-cast v0, Lcom/android/vending/licensing/ILicenseV2ResultListener;

    return-object v0

    .line 76
    :cond_1
    new-instance v0, Lcom/android/vending/licensing/ILicenseV2ResultListener$Stub$Proxy;

    invoke-direct {v0, p0}, Lcom/android/vending/licensing/ILicenseV2ResultListener$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 85
    const-string v0, "com.android.vending.licensing.ILicenseV2ResultListener"

    const/4 v1, 0x1

    if-lt p1, v1, :cond_0

    const v2, 0xffffff

    if-gt p1, v2, :cond_0

    .line 86
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    :cond_0
    const v2, 0x5f4e5446

    if-ne p1, v2, :cond_1

    .line 89
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v1

    :cond_1
    if-eq p1, v1, :cond_2

    .line 105
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p1

    return p1

    .line 97
    :cond_2
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    .line 99
    sget-object p3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, p3}, Lcom/android/vending/licensing/ILicenseV2ResultListener$_Parcel;->access$000(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/os/Bundle;

    .line 100
    invoke-virtual {p0, p1, p2}, Lcom/android/vending/licensing/ILicenseV2ResultListener$Stub;->verifyLicense(ILandroid/os/Bundle;)V

    return v1
.end method
