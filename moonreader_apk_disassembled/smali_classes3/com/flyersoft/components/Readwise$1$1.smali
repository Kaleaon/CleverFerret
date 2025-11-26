.class Lcom/flyersoft/components/Readwise$1$1;
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

.field final synthetic val$code:I

.field final synthetic val$msg:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/Readwise$1;ILjava/lang/String;)V
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

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 110
    iput-object p1, p0, Lcom/flyersoft/components/Readwise$1$1;->this$0:Lcom/flyersoft/components/Readwise$1;

    iput p2, p0, Lcom/flyersoft/components/Readwise$1$1;->val$code:I

    iput-object p3, p0, Lcom/flyersoft/components/Readwise$1$1;->val$msg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 113
    iget-object v0, p0, Lcom/flyersoft/components/Readwise$1$1;->this$0:Lcom/flyersoft/components/Readwise$1;

    iget-object v0, v0, Lcom/flyersoft/components/Readwise$1;->val$onResult:Lcom/flyersoft/components/Readwise$UploadResult;

    iget v1, p0, Lcom/flyersoft/components/Readwise$1$1;->val$code:I

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lcom/flyersoft/components/Readwise$1$1;->val$msg:Ljava/lang/String;

    invoke-interface {v0, v2, v3, v1}, Lcom/flyersoft/components/Readwise$UploadResult;->done(ZLjava/lang/String;I)V

    return-void
.end method
