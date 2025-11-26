.class Lcom/flyersoft/moonreaderp/ActivityMain$66;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->doUnauthorizedDownload()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$cb:Landroid/widget/CheckBox;

.field final synthetic val$passEdit:Landroid/widget/EditText;

.field final synthetic val$sp:Landroid/content/SharedPreferences;

.field final synthetic val$userEdit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/CheckBox;Landroid/content/SharedPreferences;)V
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

    .line 6583
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$66;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$66;->val$userEdit:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$66;->val$passEdit:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$66;->val$cb:Landroid/widget/CheckBox;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$66;->val$sp:Landroid/content/SharedPreferences;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 6586
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$66;->val$userEdit:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 6587
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$66;->val$passEdit:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    .line 6588
    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 6589
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$66;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 6590
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$66;->val$sp:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "username"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "password"

    .line 6591
    invoke-static {p2}, Lcom/flyersoft/tools/A;->getEncryptText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 6593
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$66;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$fputloginStart(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    .line 6594
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$66;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_username:Ljava/lang/String;

    .line 6595
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$66;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->hc_password:Ljava/lang/String;

    .line 6596
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$66;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->doDownloadThreadWithLogin()V

    :cond_1
    return-void
.end method
