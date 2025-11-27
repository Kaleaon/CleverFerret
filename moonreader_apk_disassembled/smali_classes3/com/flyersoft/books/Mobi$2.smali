.class Lcom/flyersoft/books/Mobi$2;
.super Ljava/lang/Thread;
.source "Mobi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/Mobi;->getBookCover(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/Mobi;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/Mobi;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 400
    iput-object p1, p0, Lcom/flyersoft/books/Mobi$2;->this$0:Lcom/flyersoft/books/Mobi;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 403
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 404
    iget-object v2, p0, Lcom/flyersoft/books/Mobi$2;->this$0:Lcom/flyersoft/books/Mobi;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/flyersoft/books/Mobi;->-$$Nest$mgetBookCover2(Lcom/flyersoft/books/Mobi;Z)V

    .line 405
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "extract cover time:"

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method
