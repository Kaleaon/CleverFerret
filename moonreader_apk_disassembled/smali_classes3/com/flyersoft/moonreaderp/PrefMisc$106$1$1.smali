.class Lcom/flyersoft/moonreaderp/PrefMisc$106$1$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$106$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefMisc$106$1;

.field final synthetic val$size:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$106$1;Ljava/lang/String;)V
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

    .line 2879
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$106$1$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$106$1;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$106$1$1;->val$size:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 2882
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$106$1$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$106$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc$106$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$106;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc$106;->val$coverCb:Landroid/widget/CheckBox;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$106$1$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$106$1;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefMisc$106$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$106;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefMisc$106;->val$con:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->include_covers:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " ("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$106$1$1;->val$size:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 2883
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$106$1$1;->this$1:Lcom/flyersoft/moonreaderp/PrefMisc$106$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc$106$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$106;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc$106;->val$progressBar1:Landroid/widget/ProgressBar;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method
