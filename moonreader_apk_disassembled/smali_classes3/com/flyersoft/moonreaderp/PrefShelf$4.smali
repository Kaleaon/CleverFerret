.class Lcom/flyersoft/moonreaderp/PrefShelf$4;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf;->initView()V
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

    .line 209
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$4;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 212
    sget-boolean p1, Lcom/flyersoft/tools/A;->sysHasDynamicColors:Z

    if-eqz p1, :cond_0

    .line 213
    new-instance p1, Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$4;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 214
    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->dynamic_color_tip:I

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 215
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$4;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->alertDialogDynamicColor(Landroid/content/Context;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->use_dynamic_color:I

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(I)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefShelf$4$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$4$1;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf$4;)V

    const v1, 0x104000a

    .line 216
    invoke-virtual {p1, v1, v0}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 223
    invoke-virtual {p1, v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    .line 224
    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog;->show()V

    .line 225
    invoke-static {p1}, Lcom/flyersoft/components/MyDialog;->setDialogDynamicBackground(Landroid/app/Dialog;)V

    .line 226
    invoke-static {p1}, Lcom/flyersoft/components/MyDialog;->setDialogButtonDynamicColor(Landroidx/appcompat/app/AlertDialog;)V

    return-void

    .line 228
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$4;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->-$$Nest$mshowCustomDynamicPicker(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    return-void
.end method
