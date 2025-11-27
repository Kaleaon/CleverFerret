.class Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;
.super Ljava/lang/Object;
.source "PrefImageBrowser1.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->showOverflowMenu(Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

.field final synthetic val$di:Lcom/flyersoft/tools/A$MyDrawable;

.field final synthetic val$filename:Ljava/lang/String;

.field final synthetic val$items:[Ljava/lang/String;

.field final synthetic val$original:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/tools/A$MyDrawable;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 136
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->val$original:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->val$items:[Ljava/lang/String;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->val$filename:Ljava/lang/String;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->val$di:Lcom/flyersoft/tools/A$MyDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 4

    if-nez p1, :cond_0

    .line 140
    new-instance v0, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 141
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->val$original:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 142
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->val$items:[Ljava/lang/String;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;

    invoke-direct {v2, p0, v0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;-><init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;Landroid/widget/EditText;)V

    const v0, 0x104000a

    .line 143
    invoke-virtual {v1, v0, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->cancel:I

    const/4 v2, 0x0

    .line 159
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 162
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->val$filename:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 163
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->images:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->val$di:Lcom/flyersoft/tools/A$MyDrawable;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 164
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageGrid:Landroid/widget/GridView;

    invoke-virtual {p1}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Landroid/widget/BaseAdapter;

    invoke-virtual {p1}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    return-void

    .line 166
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_2
    return-void
.end method
