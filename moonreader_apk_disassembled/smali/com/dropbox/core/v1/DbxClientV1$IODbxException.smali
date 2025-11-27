.class public final Lcom/dropbox/core/v1/DbxClientV1$IODbxException;
.super Ljava/io/IOException;
.source "DbxClientV1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v1/DbxClientV1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IODbxException"
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field public final underlying:Lcom/dropbox/core/DbxException;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/DbxException;)V
    .locals 0

    .line 1449
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 1450
    iput-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1$IODbxException;->underlying:Lcom/dropbox/core/DbxException;

    return-void
.end method
