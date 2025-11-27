.class Lcom/flyersoft/moonreaderp/ActivityMain$24$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$24;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$24;

.field final synthetic val$cb:Landroid/widget/CheckBox;

.field final synthetic val$passEdit:Landroid/widget/EditText;

.field final synthetic val$saveName:Ljava/lang/String;

.field final synthetic val$sp:Landroid/content/SharedPreferences;

.field final synthetic val$url_str:Ljava/lang/String;

.field final synthetic val$userEdit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$24;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/CheckBox;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
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

    .line 2697
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$24;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->val$userEdit:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->val$passEdit:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->val$cb:Landroid/widget/CheckBox;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->val$sp:Landroid/content/SharedPreferences;

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->val$url_str:Ljava/lang/String;

    iput-object p7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->val$saveName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6

    .line 2700
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->val$userEdit:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 2701
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->val$passEdit:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    .line 2702
    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2704
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    const-string v1, "password"

    const-string v2, "username"

    if-eqz v0, :cond_0

    .line 2705
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->val$sp:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 2706
    invoke-static {p2}, Lcom/flyersoft/tools/A;->getEncryptText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2709
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$24;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$24;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v3, Landroid/content/Intent;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$24;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$24;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const-class v5, Lcom/flyersoft/moonreaderp/BookDownloadService;

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v4, "url"

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->val$url_str:Ljava/lang/String;

    .line 2710
    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$24;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$24;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->lastLibrary:Lcom/flyersoft/opds/OpdsSite;

    iget-object v4, v4, Lcom/flyersoft/opds/OpdsSite;->useragent:Ljava/lang/String;

    .line 2711
    const-string v5, "user_agent"

    invoke-virtual {v3, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$24;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$24;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain;->lastLibrary:Lcom/flyersoft/opds/OpdsSite;

    iget-object v4, v4, Lcom/flyersoft/opds/OpdsSite;->xmlFile:Ljava/lang/String;

    .line 2712
    const-string v5, "library_xml"

    invoke-virtual {v3, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->val$url_str:Ljava/lang/String;

    .line 2713
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v4

    const-string v5, "id"

    invoke-virtual {v3, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 2714
    invoke-virtual {p1, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "saveName"

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$24$1;->val$saveName:Ljava/lang/String;

    invoke-virtual {p1, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 2709
    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_1
    return-void
.end method
