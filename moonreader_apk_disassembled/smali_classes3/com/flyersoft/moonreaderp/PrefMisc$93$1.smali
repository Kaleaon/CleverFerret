.class Lcom/flyersoft/moonreaderp/PrefMisc$93$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$93;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc$93;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$93;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2440
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$93;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 5

    .line 2443
    check-cast p1, Ljava/lang/String;

    .line 2444
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2445
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smcloudTmpBackupFilename()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    .line 2446
    sget-object v0, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {p1, v0, v2}, Lcom/flyersoft/tools/T;->moveFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 2447
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const-string v3, "size: "

    aput-object v3, v0, v1

    aput-object p1, v0, v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 2448
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$93;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$93;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$93;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$handler:Landroid/os/Handler;

    const/16 v2, 0xc8

    invoke-virtual {v0, v2, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    .line 2450
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$93;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$handler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$93$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$93;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc$93;->val$handler:Landroid/os/Handler;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->invalid_file:I

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
