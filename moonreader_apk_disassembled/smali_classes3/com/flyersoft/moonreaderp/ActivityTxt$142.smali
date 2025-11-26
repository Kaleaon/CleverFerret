.class Lcom/flyersoft/moonreaderp/ActivityTxt$142;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->createProgressDlgDelay(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$info:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V
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

    .line 14349
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$142;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$142;->val$info:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 14352
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "createProgressDlgDelay(2):"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$142;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->stopTryingCreateDlg:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 14353
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$142;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->stopTryingCreateDlg:Z

    if-nez v0, :cond_0

    .line 14354
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$142;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->loading:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$142;->val$info:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcreateProgressDlg(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
