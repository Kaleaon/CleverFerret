.class public Lcom/dropbox/core/RetryException;
.super Lcom/dropbox/core/DbxException;
.source "RetryException.java"


# static fields
.field private static final serialVersionUID:J


# instance fields
.field private final backoffMillis:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    const-wide/16 v3, 0x0

    .line 21
    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/RetryException;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2}, Lcom/dropbox/core/DbxException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    invoke-virtual {p5, p3, p4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/dropbox/core/RetryException;->backoffMillis:J

    return-void
.end method


# virtual methods
.method public getBackoffMillis()J
    .locals 2

    .line 45
    iget-wide v0, p0, Lcom/dropbox/core/RetryException;->backoffMillis:J

    return-wide v0
.end method
