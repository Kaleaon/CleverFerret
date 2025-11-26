.class Lcom/flyersoft/moonreaderp/ActivityTxt$203$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$203;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$203;

.field final synthetic val$result:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$203;Ljava/lang/String;)V
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

    .line 19240
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$203;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203$1;->val$result:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 19243
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203$1;->val$result:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 19244
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$203;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$203;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203$1;->val$result:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$203;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$203;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->invalid_file:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203$1;->val$result:Ljava/lang/String;

    :goto_0
    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$merror_and_exit(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;Z)V

    return-void

    .line 19246
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$203;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$203;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$203$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$203;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$203;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf_filename:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdjvuOpen2(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    return-void
.end method
