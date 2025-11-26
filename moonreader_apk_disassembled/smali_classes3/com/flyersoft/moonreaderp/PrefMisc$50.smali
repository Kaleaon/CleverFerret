.class Lcom/flyersoft/moonreaderp/PrefMisc$50;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->showImageOptions(Landroid/content/Context;Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cb0:Landroid/widget/CheckBox;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1402
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$50;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$50;->val$cb0:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1405
    new-instance p1, Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$50;->val$context:Landroid/content/Context;

    invoke-direct {p1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1406
    new-instance v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$50;->val$context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x2

    .line 1407
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 1408
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v2, Lcom/flyersoft/tools/A;->nightImageBright:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, -0x1

    const/4 v2, -0x2

    .line 1409
    invoke-virtual {p1, v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    .line 1410
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$50;->val$context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->brightness:I

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefMisc$50$1;

    invoke-direct {v1, p0, v0}, Lcom/flyersoft/moonreaderp/PrefMisc$50$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$50;Landroid/widget/EditText;)V

    const v0, 0x104000a

    .line 1411
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 1420
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
