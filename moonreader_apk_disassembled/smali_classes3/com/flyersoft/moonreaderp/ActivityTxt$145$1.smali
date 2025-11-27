.class Lcom/flyersoft/moonreaderp/ActivityTxt$145$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$145;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$145;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$145;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 14477
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$145$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$145;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    const-string v0, ""

    .line 14481
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    sput-wide v1, Lcom/flyersoft/tools/A;->invokeRemind1Time:J

    .line 14482
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$145$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$145;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt$145;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-wide v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->remind1StartTime:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x3e8

    div-long/2addr v1, v3

    const-wide/16 v3, 0x3c

    cmp-long v5, v1, v3

    if-ltz v5, :cond_1

    .line 14484
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$145$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$145;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$145;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->reminderDlg:Lcom/flyersoft/components/MyDialog;

    if-eqz v0, :cond_0

    .line 14485
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$145$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$145;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$145;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->reminderDlg:Lcom/flyersoft/components/MyDialog;

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->dismiss()V

    .line 14486
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$145$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$145;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$145;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->reminderDlg:Lcom/flyersoft/components/MyDialog;

    .line 14488
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$145$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$145;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt$145;->cancel()Z

    return-void

    .line 14489
    :cond_1
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$145$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$145;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityTxt$145;->val$timeTv:Landroid/widget/TextView;

    if-eqz v5, :cond_2

    .line 14490
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$145$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$145;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/ActivityTxt$145;->val$timeTv:Landroid/widget/TextView;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sub-long/2addr v3, v1

    invoke-virtual {v6, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 14492
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_2
    return-void
.end method
