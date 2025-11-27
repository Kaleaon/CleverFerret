.class Lcom/flyersoft/moonreaderp/ActivityTxt$210;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfCheckPassword(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$cb:Landroid/widget/CheckBox;

.field final synthetic val$filename:Ljava/lang/String;

.field final synthetic val$uEdit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/EditText;Ljava/lang/String;Landroid/widget/CheckBox;)V
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

    .line 19458
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$210;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$210;->val$uEdit:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$210;->val$filename:Ljava/lang/String;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$210;->val$cb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 19460
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$210;->val$uEdit:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 19461
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$210;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf_doc:Lcom/radaee/pdf/Document;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$210;->val$filename:Ljava/lang/String;

    invoke-virtual {p2, v0, p1}, Lcom/radaee/pdf/Document;->Open(Ljava/lang/String;Ljava/lang/String;)I

    move-result p2

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 19463
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$210;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-string v1, "pdf"

    invoke-virtual {p2, v1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$210;->val$filename:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "u"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getEncryptText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$210;->val$filename:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "s"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$210;->val$cb:Landroid/widget/CheckBox;

    .line 19464
    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 19465
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$210;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    return-void

    .line 19467
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$210;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const-string p2, "Invalidated password."

    invoke-static {p1, p2, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$merror_and_exit(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;Z)V

    return-void
.end method
