.class Lcom/flyersoft/moonreaderp/PrefMisc$68;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->createTtsFiltersView(Landroid/content/Context;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$base:Landroid/widget/LinearLayout;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1747
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$68;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$68;->val$base:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1750
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$68;->val$context:Landroid/content/Context;

    invoke-direct {p1, v0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$68;->val$context:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->clear_dict_history:I

    .line 1751
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$68$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$68$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$68;)V

    const v1, 0x104000a

    .line 1752
    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 1759
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
