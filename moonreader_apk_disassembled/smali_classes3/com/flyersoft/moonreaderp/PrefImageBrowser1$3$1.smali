.class Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;
.super Ljava/lang/Object;
.source "PrefImageBrowser1.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;Landroid/widget/EditText;)V
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

    .line 143
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;->this$1:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 146
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->deleteSpecialChar(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 147
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_2

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;->this$1:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->val$original:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    .line 148
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;->this$1:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->val$filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;->this$1:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->val$filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 149
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;->this$1:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->val$filename:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-static {v0, p2, v1}, Lcom/flyersoft/tools/T;->renameFile(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 150
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;->this$1:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->val$filename:Ljava/lang/String;

    sget-object v1, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 151
    sput-object p1, Lcom/flyersoft/tools/A;->backgroundImage:Ljava/lang/String;

    .line 152
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;->this$1:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->val$di:Lcom/flyersoft/tools/A$MyDrawable;

    iput-object p1, v0, Lcom/flyersoft/tools/A$MyDrawable;->imageName:Ljava/lang/String;

    .line 153
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;->this$1:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->val$di:Lcom/flyersoft/tools/A$MyDrawable;

    iput-object p2, p1, Lcom/flyersoft/tools/A$MyDrawable;->filename:Ljava/lang/String;

    .line 154
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;->this$1:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->imageGrid:Landroid/widget/GridView;

    invoke-virtual {p1}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Landroid/widget/BaseAdapter;

    invoke-virtual {p1}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    return-void

    .line 156
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;->this$1:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3$1;->this$1:Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefImageBrowser1$3;->this$0:Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->getContext()Landroid/content/Context;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_2
    return-void
.end method
