.class Lcom/flyersoft/components/cloud/Ftp$3;
.super Ljava/lang/Object;
.source "Ftp.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Ftp;->showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Ftp;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/content/Context;)V
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

    .line 225
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$3;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$3;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 5

    .line 228
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isPressed()Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p2, :cond_2

    .line 229
    invoke-static {}, Lcom/flyersoft/tools/A;->isPro()Z

    move-result p2

    if-nez p2, :cond_0

    .line 230
    iget-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$3;->val$context:Landroid/content/Context;

    invoke-static {p2}, Lcom/flyersoft/tools/A;->showBuyDialog(Landroid/content/Context;)V

    const/4 p2, 0x0

    .line 231
    invoke-virtual {p1, p2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    return-void

    .line 235
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllBooks()Ljava/util/ArrayList;

    move-result-object p2

    .line 237
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const-wide/16 v0, 0x0

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 238
    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileSize(Ljava/lang/String;)J

    move-result-wide v2

    add-long/2addr v0, v2

    goto :goto_0

    .line 239
    :cond_1
    new-instance p2, Lcom/flyersoft/components/MyDialog;

    iget-object v2, p0, Lcom/flyersoft/components/cloud/Ftp$3;->val$context:Landroid/content/Context;

    invoke-direct {p2, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->confirmation:I

    invoke-virtual {p2, v2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$3;->val$context:Landroid/content/Context;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->sync_shelf:I

    .line 240
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "?<br><br><b><big>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$3;->val$context:Landroid/content/Context;

    .line 241
    invoke-static {v3, v0, v1}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "</big></b>"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 240
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/components/cloud/Ftp$3$2;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/components/cloud/Ftp$3$2;-><init>(Lcom/flyersoft/components/cloud/Ftp$3;Landroid/widget/CompoundButton;)V

    const/high16 v1, 0x1040000

    .line 242
    invoke-virtual {p2, v1, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    const v0, 0x104000a

    const/4 v1, 0x0

    .line 247
    invoke-virtual {p2, v0, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/components/cloud/Ftp$3$1;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/components/cloud/Ftp$3$1;-><init>(Lcom/flyersoft/components/cloud/Ftp$3;Landroid/widget/CompoundButton;)V

    .line 248
    invoke-virtual {p2, v0}, Lcom/flyersoft/components/MyDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/4 p2, 0x1

    .line 253
    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_2
    return-void
.end method
