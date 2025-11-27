.class Lorg/apache/http/impl/conn/CPool;
.super Lorg/apache/http/pool/AbstractConnPool;
.source "CPool.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/http/pool/AbstractConnPool<",
        "Lorg/apache/http/conn/routing/HttpRoute;",
        "Lorg/apache/http/conn/ManagedHttpClientConnection;",
        "Lorg/apache/http/impl/conn/CPoolEntry;",
        ">;"
    }
.end annotation


# static fields
.field private static final COUNTER:Ljava/util/concurrent/atomic/AtomicLong;


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;

.field private final timeToLive:J

.field private final timeUnit:Ljava/util/concurrent/TimeUnit;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v0, Lorg/apache/http/impl/conn/CPool;->COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/pool/ConnFactory;IIJLjava/util/concurrent/TimeUnit;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/pool/ConnFactory<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Lorg/apache/http/conn/ManagedHttpClientConnection;",
            ">;IIJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")V"
        }
    .end annotation

    .line 58
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/http/pool/AbstractConnPool;-><init>(Lorg/apache/http/pool/ConnFactory;II)V

    .line 50
    const-class p1, Lorg/apache/http/impl/conn/CPool;

    invoke-static {p1}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/http/impl/conn/CPool;->log:Lorg/apache/commons/logging/Log;

    .line 59
    iput-wide p4, p0, Lorg/apache/http/impl/conn/CPool;->timeToLive:J

    .line 60
    iput-object p6, p0, Lorg/apache/http/impl/conn/CPool;->timeUnit:Ljava/util/concurrent/TimeUnit;

    return-void
.end method


# virtual methods
.method protected createEntry(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;)Lorg/apache/http/impl/conn/CPoolEntry;
    .locals 10

    .line 65
    sget-object v0, Lorg/apache/http/impl/conn/CPool;->COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    .line 66
    new-instance v2, Lorg/apache/http/impl/conn/CPoolEntry;

    iget-object v3, p0, Lorg/apache/http/impl/conn/CPool;->log:Lorg/apache/commons/logging/Log;

    iget-wide v7, p0, Lorg/apache/http/impl/conn/CPool;->timeToLive:J

    iget-object v9, p0, Lorg/apache/http/impl/conn/CPool;->timeUnit:Ljava/util/concurrent/TimeUnit;

    move-object v5, p1

    move-object v6, p2

    invoke-direct/range {v2 .. v9}, Lorg/apache/http/impl/conn/CPoolEntry;-><init>(Lorg/apache/commons/logging/Log;Ljava/lang/String;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;JLjava/util/concurrent/TimeUnit;)V

    return-object v2
.end method

.method protected bridge synthetic createEntry(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/http/pool/PoolEntry;
    .locals 0

    .line 45
    check-cast p1, Lorg/apache/http/conn/routing/HttpRoute;

    check-cast p2, Lorg/apache/http/conn/ManagedHttpClientConnection;

    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/conn/CPool;->createEntry(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;)Lorg/apache/http/impl/conn/CPoolEntry;

    move-result-object p1

    return-object p1
.end method

.method protected enumAvailable(Lorg/apache/http/pool/PoolEntryCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/pool/PoolEntryCallback<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Lorg/apache/http/conn/ManagedHttpClientConnection;",
            ">;)V"
        }
    .end annotation

    .line 76
    invoke-super {p0, p1}, Lorg/apache/http/pool/AbstractConnPool;->enumAvailable(Lorg/apache/http/pool/PoolEntryCallback;)V

    return-void
.end method

.method protected enumLeased(Lorg/apache/http/pool/PoolEntryCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/pool/PoolEntryCallback<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Lorg/apache/http/conn/ManagedHttpClientConnection;",
            ">;)V"
        }
    .end annotation

    .line 81
    invoke-super {p0, p1}, Lorg/apache/http/pool/AbstractConnPool;->enumLeased(Lorg/apache/http/pool/PoolEntryCallback;)V

    return-void
.end method

.method protected validate(Lorg/apache/http/impl/conn/CPoolEntry;)Z
    .locals 0

    .line 71
    invoke-virtual {p1}, Lorg/apache/http/impl/conn/CPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/http/conn/ManagedHttpClientConnection;

    invoke-interface {p1}, Lorg/apache/http/conn/ManagedHttpClientConnection;->isStale()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method protected bridge synthetic validate(Lorg/apache/http/pool/PoolEntry;)Z
    .locals 0

    .line 45
    check-cast p1, Lorg/apache/http/impl/conn/CPoolEntry;

    invoke-virtual {p0, p1}, Lorg/apache/http/impl/conn/CPool;->validate(Lorg/apache/http/impl/conn/CPoolEntry;)Z

    move-result p1

    return p1
.end method
