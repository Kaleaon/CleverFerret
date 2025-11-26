.class public Lcom/dropbox/core/RateLimitException;
.super Lcom/dropbox/core/RetryException;
.source "RateLimitException.java"


# static fields
.field private static final serialVersionUID:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)V
    .locals 0

    .line 13
    invoke-direct/range {p0 .. p5}, Lcom/dropbox/core/RetryException;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)V

    return-void
.end method
