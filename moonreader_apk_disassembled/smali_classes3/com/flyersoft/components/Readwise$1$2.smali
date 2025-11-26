.class Lcom/flyersoft/components/Readwise$1$2;
.super Ljava/lang/Object;
.source "Readwise.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/Readwise$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/Readwise$1;

.field final synthetic val$e:Ljava/lang/Exception;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/Readwise$1;Ljava/lang/Exception;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 122
    iput-object p1, p0, Lcom/flyersoft/components/Readwise$1$2;->this$0:Lcom/flyersoft/components/Readwise$1;

    iput-object p2, p0, Lcom/flyersoft/components/Readwise$1$2;->val$e:Ljava/lang/Exception;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 125
    iget-object v0, p0, Lcom/flyersoft/components/Readwise$1$2;->this$0:Lcom/flyersoft/components/Readwise$1;

    iget-object v0, v0, Lcom/flyersoft/components/Readwise$1;->val$onResult:Lcom/flyersoft/components/Readwise$UploadResult;

    iget-object v1, p0, Lcom/flyersoft/components/Readwise$1$2;->val$e:Ljava/lang/Exception;

    invoke-static {v1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, -0x1

    const/4 v3, 0x0

    invoke-interface {v0, v3, v1, v2}, Lcom/flyersoft/components/Readwise$UploadResult;->done(ZLjava/lang/String;I)V

    return-void
.end method
