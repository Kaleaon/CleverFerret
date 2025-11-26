.class public final Lcom/dropbox/core/util/IOUtil$ReadException;
.super Lcom/dropbox/core/util/IOUtil$WrappedException;
.source "IOUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/util/IOUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ReadException"
.end annotation


# static fields
.field private static final serialVersionUID:J


# direct methods
.method public constructor <init>(Ljava/io/IOException;)V
    .locals 0

    .line 196
    invoke-direct {p0, p1}, Lcom/dropbox/core/util/IOUtil$WrappedException;-><init>(Ljava/io/IOException;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/IOException;)V
    .locals 0

    .line 192
    invoke-direct {p0, p1, p2}, Lcom/dropbox/core/util/IOUtil$WrappedException;-><init>(Ljava/lang/String;Ljava/io/IOException;)V

    return-void
.end method
