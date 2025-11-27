.class Lcom/flyersoft/moonreaderp/ActivityTxt$178;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefDownloadCover$OnSaveImage;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->downloadFont(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$font:Ljava/lang/String;

.field final synthetic val$restartTip:Z


# direct methods
.method static bridge synthetic -$$Nest$mrestartForFont(Lcom/flyersoft/moonreaderp/ActivityTxt$178;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$178;->restartForFont()V

    return-void
.end method

.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 17890
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$178;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$178;->val$font:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$178;->val$restartTip:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private restartForFont()V
    .locals 3

    .line 17915
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$178;->val$restartTip:Z

    if-eqz v0, :cond_0

    .line 17916
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$178;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->use_css_font_now:I

    .line 17918
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setMessage(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityTxt$178$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$178$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$178;)V

    const v2, 0x104000a

    .line 17920
    invoke-virtual {v0, v2, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    .line 17926
    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 17927
    invoke-virtual {v0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 17929
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$178;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->saveLastPostion(Z)V

    .line 17930
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$178;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderToTxt()V

    return-void
.end method


# virtual methods
.method public onGetImageFile(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 2

    if-eqz p1, :cond_1

    .line 17893
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$178;->val$font:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 17894
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$178;->restartForFont()V

    return-void

    .line 17896
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "\"<b>"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "</b>\" "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$178;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->rename_file:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \"<b>"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$178;->val$font:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17897
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "</b>\"?"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 17898
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$178;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 17899
    invoke-static {p2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    const/4 v0, 0x0

    .line 17900
    invoke-virtual {p2, v0}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityTxt$178$1;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt$178$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$178;Ljava/lang/String;)V

    const p1, 0x104000a

    .line 17901
    invoke-virtual {p2, p1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 p2, 0x1040000

    const/4 v0, 0x0

    .line 17907
    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 17908
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    :cond_1
    return-void
.end method
