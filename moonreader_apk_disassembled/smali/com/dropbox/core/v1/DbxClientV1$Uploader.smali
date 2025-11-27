.class public abstract Lcom/dropbox/core/v1/DbxClientV1$Uploader;
.super Ljava/lang/Object;
.source "DbxClientV1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v1/DbxClientV1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Uploader"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2253
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract abort()V
.end method

.method public abstract close()V
.end method

.method public abstract finish()Lcom/dropbox/core/v1/DbxEntry$File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation
.end method

.method public abstract getBody()Ljava/io/OutputStream;
.end method
