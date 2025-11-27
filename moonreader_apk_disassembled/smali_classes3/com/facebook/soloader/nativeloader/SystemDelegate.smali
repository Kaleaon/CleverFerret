.class public Lcom/facebook/soloader/nativeloader/SystemDelegate;
.super Ljava/lang/Object;
.source "SystemDelegate.java"

# interfaces
.implements Lcom/facebook/soloader/nativeloader/NativeLoaderDelegate;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getLibraryPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getSoSourcesVersion()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public loadLibrary(Ljava/lang/String;I)Z
    .locals 0

    .line 24
    invoke-static {p1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1
.end method
