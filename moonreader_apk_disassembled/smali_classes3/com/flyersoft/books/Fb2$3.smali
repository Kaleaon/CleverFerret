.class Lcom/flyersoft/books/Fb2$3;
.super Ljava/lang/Thread;
.source "Fb2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/books/Fb2;->checkCoverAndInitImages(Ljava/lang/String;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/books/Fb2;

.field final synthetic val$binary:Ljava/lang/String;

.field final synthetic val$coverName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/books/Fb2;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 366
    iput-object p1, p0, Lcom/flyersoft/books/Fb2$3;->this$0:Lcom/flyersoft/books/Fb2;

    iput-object p2, p0, Lcom/flyersoft/books/Fb2$3;->val$coverName:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/books/Fb2$3;->val$binary:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 369
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 370
    iget-object v2, p0, Lcom/flyersoft/books/Fb2$3;->this$0:Lcom/flyersoft/books/Fb2;

    iget-object v3, p0, Lcom/flyersoft/books/Fb2$3;->val$coverName:Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/books/Fb2$3;->val$binary:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v5}, Lcom/flyersoft/books/Fb2;->-$$Nest$mcheckDownloadBookCover2(Lcom/flyersoft/books/Fb2;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 371
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "extract cover time:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v0, v1, v5

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method
