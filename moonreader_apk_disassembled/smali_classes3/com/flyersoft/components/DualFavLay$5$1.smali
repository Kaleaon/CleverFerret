.class Lcom/flyersoft/components/DualFavLay$5$1;
.super Ljava/lang/Object;
.source "DualFavLay.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DualFavLay$5;->onLongClick(Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/components/DualFavLay$5;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DualFavLay$5;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 248
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$5$1;->this$1:Lcom/flyersoft/components/DualFavLay$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 4

    .line 251
    new-instance p1, Lcom/flyersoft/views/ClearableEditText;

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/flyersoft/views/ClearableEditText;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    .line 252
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 253
    sget-object v0, Lcom/flyersoft/tools/A;->dualKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 254
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/flyersoft/components/DualFavLay;->-$$Nest$sfgetmContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->search:I

    .line 255
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/components/DualFavLay$5$1;->this$1:Lcom/flyersoft/components/DualFavLay$5;

    iget-object v2, v2, Lcom/flyersoft/components/DualFavLay$5;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v2, v2, Lcom/flyersoft/components/DualFavLay;->selectedName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 256
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/components/DualFavLay$5$1$1;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/components/DualFavLay$5$1$1;-><init>(Lcom/flyersoft/components/DualFavLay$5$1;Landroid/widget/EditText;)V

    const p1, 0x104000a

    .line 257
    invoke-virtual {v0, p1, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->cancel:I

    const/4 v1, 0x0

    .line 265
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
