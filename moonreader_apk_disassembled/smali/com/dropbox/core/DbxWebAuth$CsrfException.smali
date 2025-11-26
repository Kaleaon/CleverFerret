.class public final Lcom/dropbox/core/DbxWebAuth$CsrfException;
.super Lcom/dropbox/core/DbxWebAuth$Exception;
.source "DbxWebAuth.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/DbxWebAuth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CsrfException"
.end annotation


# static fields
.field private static final serialVersionUID:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 618
    invoke-direct {p0, p1}, Lcom/dropbox/core/DbxWebAuth$Exception;-><init>(Ljava/lang/String;)V

    return-void
.end method
