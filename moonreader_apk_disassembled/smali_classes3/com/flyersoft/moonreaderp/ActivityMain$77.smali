.class Lcom/flyersoft/moonreaderp/ActivityMain$77;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->createNewFolder()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$edit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/EditText;)V
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

    .line 7095
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$77;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$77;->val$edit:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 7097
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$77;->val$edit:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 7098
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    .line 7100
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$77;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->isLocal()Z

    move-result p2

    const-string v0, "/"

    if-nez p2, :cond_2

    .line 7101
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$77;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getCurrentPath()Ljava/lang/String;

    move-result-object p2

    .line 7102
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$77;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    const-string v0, ""

    :cond_1
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->showCloudFolder(Ljava/lang/String;)V

    return-void

    .line 7105
    :cond_2
    :try_start_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 7106
    invoke-static {p1}, Lcom/flyersoft/tools/T;->createFolder(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 7107
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$77;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p2, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->showFileList(Ljava/lang/String;)V

    return-void

    .line 7109
    :cond_3
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$77;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->ifRequestGrantSD(Ljava/lang/String;Z)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 7111
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 7112
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$77;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, v0, p1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method
