.class Lcom/flyersoft/moonreaderp/NetBookInfo$4;
.super Landroid/os/Handler;
.source "NetBookInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/NetBookInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/NetBookInfo;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 379
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$4;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 382
    sget-object v0, Lcom/flyersoft/moonreaderp/NetBookInfo;->selfPref:Lcom/flyersoft/moonreaderp/NetBookInfo;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 384
    :cond_0
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v0, 0x3f3

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$4;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->-$$Nest$mgetDownloadTo(Lcom/flyersoft/moonreaderp/NetBookInfo;Z)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 385
    sget-object p1, Lcom/flyersoft/moonreaderp/NetBookInfo;->selfPref:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/NetBookInfo;->downloadB:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 386
    sget-object p1, Lcom/flyersoft/moonreaderp/NetBookInfo;->selfPref:Lcom/flyersoft/moonreaderp/NetBookInfo;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/NetBookInfo;->readB:Landroid/widget/Button;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 387
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/NetBookInfo$4;->this$0:Lcom/flyersoft/moonreaderp/NetBookInfo;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->progressBar1:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/NetBookInfo;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method
