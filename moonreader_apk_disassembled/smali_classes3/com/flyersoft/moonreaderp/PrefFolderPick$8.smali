.class Lcom/flyersoft/moonreaderp/PrefFolderPick$8;
.super Ljava/lang/Object;
.source "PrefFolderPick.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFolderPick;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

.field final synthetic val$edit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFolderPick;Landroid/widget/EditText;)V
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

    .line 380
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$8;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$8;->val$edit:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 382
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$8;->val$edit:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 383
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-lez p2, :cond_1

    .line 385
    :try_start_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$8;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 386
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_0

    invoke-static {p1}, Lcom/flyersoft/tools/T;->createFolder(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 387
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$8;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iput-object p1, p2, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    .line 388
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$8;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object p2, p1, Lcom/flyersoft/moonreaderp/PrefFolderPick;->folder:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->-$$Nest$mcreateAdapter(Lcom/flyersoft/moonreaderp/PrefFolderPick;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 391
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 392
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$8;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefFolderPick$8;->this$0:Lcom/flyersoft/moonreaderp/PrefFolderPick;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, v0, p1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method
