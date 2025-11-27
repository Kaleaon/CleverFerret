.class public Lcom/radaee/util/CaptureSignature$CaptureSignatureListener;
.super Ljava/lang/Object;
.source "CaptureSignature.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/CaptureSignature;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CaptureSignatureListener"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/util/CaptureSignature$CaptureSignatureListener$OnSignatureCapturedListener;
    }
.end annotation


# static fields
.field private static mListener:Lcom/radaee/util/CaptureSignature$CaptureSignatureListener$OnSignatureCapturedListener;

.field private static mSignature:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static OnSignatureCaptured(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 148
    sget-object v0, Lcom/radaee/util/CaptureSignature$CaptureSignatureListener;->mListener:Lcom/radaee/util/CaptureSignature$CaptureSignatureListener$OnSignatureCapturedListener;

    if-eqz v0, :cond_0

    .line 149
    invoke-interface {v0, p0}, Lcom/radaee/util/CaptureSignature$CaptureSignatureListener$OnSignatureCapturedListener;->OnSignatureCaptured(Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method

.method public static getSignature()Landroid/graphics/Bitmap;
    .locals 1

    .line 153
    sget-object v0, Lcom/radaee/util/CaptureSignature$CaptureSignatureListener;->mSignature:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public static setListener(Lcom/radaee/util/CaptureSignature$CaptureSignatureListener$OnSignatureCapturedListener;)V
    .locals 0

    .line 140
    sput-object p0, Lcom/radaee/util/CaptureSignature$CaptureSignatureListener;->mListener:Lcom/radaee/util/CaptureSignature$CaptureSignatureListener$OnSignatureCapturedListener;

    return-void
.end method

.method public static setSignature(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 144
    sput-object p0, Lcom/radaee/util/CaptureSignature$CaptureSignatureListener;->mSignature:Landroid/graphics/Bitmap;

    return-void
.end method
