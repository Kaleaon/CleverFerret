.class Lcom/flyersoft/moonreaderp/PrefShelf$11;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefShelf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelf;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 382
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 5

    .line 384
    check-cast p1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    const/16 v0, 0x8

    if-eqz p2, :cond_0

    .line 386
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->add_catalog:I

    const/4 v2, 0x0

    .line 387
    invoke-virtual {p2, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout;

    .line 388
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cat_name:I

    invoke-virtual {p2, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 389
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->cat_url:I

    invoke-virtual {p2, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 392
    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v3

    .line 391
    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 394
    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v3

    .line 393
    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    const v3, 0x80090

    .line 396
    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setInputType(I)V

    .line 397
    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setInputType(I)V

    .line 398
    sget-object v3, Lcom/flyersoft/tools/A;->startPassword:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 399
    sget-object v3, Lcom/flyersoft/tools/A;->startPassword:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 401
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->cat_login_line:I

    invoke-virtual {p2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 402
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->sitebookImage:I

    invoke-virtual {p2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 403
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->tv1:I

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->password_input1:I

    .line 404
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 403
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 405
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->TextView02:I

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->password_input2:I

    .line 406
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 405
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 408
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    .line 409
    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->password_protect:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 410
    invoke-virtual {v0, p2}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    const/4 v0, 0x0

    .line 411
    invoke-virtual {p2, v0}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;

    invoke-direct {v0, p0, v1, v2, p1}, Lcom/flyersoft/moonreaderp/PrefShelf$11$2;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf$11;Landroid/widget/EditText;Landroid/widget/EditText;Lcom/google/android/material/materialswitch/MaterialSwitch;)V

    const v1, 0x104000a

    .line 412
    invoke-virtual {p2, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefShelf$11$1;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/moonreaderp/PrefShelf$11$1;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf$11;Lcom/google/android/material/materialswitch/MaterialSwitch;)V

    const/high16 p1, 0x1040000

    .line 443
    invoke-virtual {p2, p1, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 450
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 452
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->-$$Nest$mfingerCheckSetVisible(Lcom/flyersoft/moonreaderp/PrefShelf;I)V

    return-void
.end method
