.class Lcom/flyersoft/moonreaderp/ActivityMain$139;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->deleteCloudFiles(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$confirmAagain:Z

.field final synthetic val$list:Ljava/util/ArrayList;

.field final synthetic val$sb:Ljava/lang/StringBuilder;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;ZLjava/lang/StringBuilder;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 13264
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$139;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$139;->val$confirmAagain:Z

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$139;->val$sb:Ljava/lang/StringBuilder;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$139;->val$list:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 13266
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$139;->val$confirmAagain:Z

    if-eqz p1, :cond_0

    .line 13267
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$139;->val$sb:Ljava/lang/StringBuilder;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "<b><big>"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$139;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->confirm_delete_folder:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "</big></b><br><br>"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p2}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 13268
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$139;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p1, p2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$139;->val$sb:Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$string;->delete:I

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityMain$139$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$139$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$139;)V

    .line 13269
    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const p2, 0x1040009

    const/4 v0, 0x0

    .line 13273
    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 13275
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$139;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$139;->val$list:Ljava/util/ArrayList;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdeleteCloudFilesFinial(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/util/ArrayList;)V

    return-void
.end method
