.class Lcom/flyersoft/components/Readwise$4$1;
.super Ljava/lang/Object;
.source "Readwise.java"

# interfaces
.implements Lcom/flyersoft/components/Readwise$UploadResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/Readwise$4;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/Readwise$4;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/Readwise$4;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 161
    iput-object p1, p0, Lcom/flyersoft/components/Readwise$4$1;->this$0:Lcom/flyersoft/components/Readwise$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(ZLjava/lang/String;I)V
    .locals 3

    if-eqz p1, :cond_0

    .line 164
    iget-object v0, p0, Lcom/flyersoft/components/Readwise$4$1;->this$0:Lcom/flyersoft/components/Readwise$4;

    iget-object v0, v0, Lcom/flyersoft/components/Readwise$4;->val$syncCb:Landroid/widget/CheckBox;

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/flyersoft/components/Readwise$4$1;->this$0:Lcom/flyersoft/components/Readwise$4;

    iget-object v0, v0, Lcom/flyersoft/components/Readwise$4;->val$syncCb:Landroid/widget/CheckBox;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    :cond_0
    if-nez p1, :cond_1

    .line 167
    iget-object p1, p0, Lcom/flyersoft/components/Readwise$4$1;->this$0:Lcom/flyersoft/components/Readwise$4;

    iget-object p1, p1, Lcom/flyersoft/components/Readwise$4;->val$context:Landroid/content/Context;

    iget-object v0, p0, Lcom/flyersoft/components/Readwise$4$1;->this$0:Lcom/flyersoft/components/Readwise$4;

    iget-object v0, v0, Lcom/flyersoft/components/Readwise$4;->val$context:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Responese Code: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, "\n"

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, v0, p2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method
