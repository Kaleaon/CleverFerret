.class Lcom/flyersoft/tools/RemoveHistory$1;
.super Ljava/lang/Object;
.source "RemoveHistory.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/tools/RemoveHistory;->removeHistory(Landroid/content/Context;Ljava/lang/String;Ljava/util/ArrayList;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$onClearButton:Landroid/content/DialogInterface$OnClickListener;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 33
    iput-object p1, p0, Lcom/flyersoft/tools/RemoveHistory$1;->val$con:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/tools/RemoveHistory$1;->val$onClearButton:Landroid/content/DialogInterface$OnClickListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 35
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object p2, p0, Lcom/flyersoft/tools/RemoveHistory$1;->val$con:Landroid/content/Context;

    invoke-direct {p1, p2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/tools/RemoveHistory$1;->val$con:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->clear_dict_history:I

    .line 36
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "?"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance p2, Lcom/flyersoft/tools/RemoveHistory$1$1;

    invoke-direct {p2, p0}, Lcom/flyersoft/tools/RemoveHistory$1$1;-><init>(Lcom/flyersoft/tools/RemoveHistory$1;)V

    const v0, 0x104000a

    .line 37
    invoke-virtual {p1, v0, p2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 p2, 0x1040000

    const/4 v0, 0x0

    .line 43
    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
