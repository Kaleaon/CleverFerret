.class Lcom/flyersoft/opds/N$4;
.super Ljava/lang/Object;
.source "N.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/opds/N;->addNewCatalog(Lcom/flyersoft/moonreaderp/ActivityMain;ZLjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 325
    iput-object p1, p0, Lcom/flyersoft/opds/N$4;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 9

    .line 327
    iget-object p1, p0, Lcom/flyersoft/opds/N$4;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->add_calibre:I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 329
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->header:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    move-object v3, p2

    check-cast v3, Landroid/widget/EditText;

    .line 330
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->ip1:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    move-object v4, p2

    check-cast v4, Landroid/widget/EditText;

    .line 331
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->ip2:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    move-object v5, p2

    check-cast v5, Landroid/widget/EditText;

    .line 332
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->ip3:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    move-object v6, p2

    check-cast v6, Landroid/widget/EditText;

    .line 333
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->ip4:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    move-object v7, p2

    check-cast v7, Landroid/widget/EditText;

    .line 334
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->port:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    move-object v8, p2

    check-cast v8, Landroid/widget/EditText;

    .line 335
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->tip:I

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const/16 v1, 0x8

    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 336
    const-string p2, "http://"

    invoke-virtual {v3, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 337
    invoke-virtual {v7}, Landroid/widget/EditText;->requestFocus()Z

    .line 338
    new-instance p2, Lcom/flyersoft/components/MyDialog;

    iget-object v1, p0, Lcom/flyersoft/opds/N$4;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p2, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    const-string v1, "Calibre IP"

    invoke-virtual {p2, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v1, Lcom/flyersoft/opds/N$4$1;

    move-object v2, p0

    invoke-direct/range {v1 .. v8}, Lcom/flyersoft/opds/N$4$1;-><init>(Lcom/flyersoft/opds/N$4;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V

    const p2, 0x104000a

    .line 339
    invoke-virtual {p1, p2, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 p2, 0x1040000

    .line 351
    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
