.class public Lcom/flyersoft/books/chmlib/Logger;
.super Ljava/lang/Object;
.source "Logger.java"


# static fields
.field public static logProtoType:Lcom/flyersoft/books/chmlib/Logger;


# instance fields
.field public name:Ljava/lang/String;

.field private previousTime:J

.field private startTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 4
    new-instance v0, Lcom/flyersoft/books/chmlib/Logger;

    invoke-direct {v0}, Lcom/flyersoft/books/chmlib/Logger;-><init>()V

    sput-object v0, Lcom/flyersoft/books/chmlib/Logger;->logProtoType:Lcom/flyersoft/books/chmlib/Logger;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/flyersoft/books/chmlib/Logger;->name:Ljava/lang/String;

    return-void
.end method

.method public static getLogger(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/Logger;
    .locals 1

    .line 5
    sget-object v0, Lcom/flyersoft/books/chmlib/Logger;->logProtoType:Lcom/flyersoft/books/chmlib/Logger;

    invoke-virtual {v0, p0}, Lcom/flyersoft/books/chmlib/Logger;->makeCopy(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/Logger;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public log(Ljava/lang/String;)V
    .locals 3

    .line 16
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "["

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/Logger;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "]: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public logTime(Ljava/lang/String;)V
    .locals 5

    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 28
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "; timeDelta="

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v3, p0, Lcom/flyersoft/books/chmlib/Logger;->previousTime:J

    sub-long v3, v0, v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, "; time="

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v3, p0, Lcom/flyersoft/books/chmlib/Logger;->startTime:J

    sub-long v3, v0, v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/Logger;->log(Ljava/lang/String;)V

    .line 29
    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/Logger;->previousTime:J

    return-void
.end method

.method public logTimeStart(Ljava/lang/String;)V
    .locals 2

    .line 22
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/Logger;->log(Ljava/lang/String;)V

    .line 23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/Logger;->previousTime:J

    .line 24
    iput-wide v0, p0, Lcom/flyersoft/books/chmlib/Logger;->startTime:J

    return-void
.end method

.method public makeCopy(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/Logger;
    .locals 1

    .line 19
    new-instance v0, Lcom/flyersoft/books/chmlib/Logger;

    invoke-direct {v0, p1}, Lcom/flyersoft/books/chmlib/Logger;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
