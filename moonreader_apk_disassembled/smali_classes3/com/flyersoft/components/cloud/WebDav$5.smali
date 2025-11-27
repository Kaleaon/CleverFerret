.class Lcom/flyersoft/components/cloud/WebDav$5;
.super Ljava/lang/Object;
.source "WebDav.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/WebDav;->showLogin(Landroid/content/Context;ZLcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/WebDav;

.field final synthetic val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$manulB:Landroid/widget/CheckBox;

.field final synthetic val$passEt:Landroid/widget/EditText;

.field final synthetic val$pathEt:Landroid/widget/EditText;

.field final synthetic val$syncMenuB:Landroid/widget/CheckBox;

.field final synthetic val$syncMsg:Landroid/widget/CheckBox;

.field final synthetic val$syncProgress:Landroid/widget/CheckBox;

.field final synthetic val$syncShelf:Landroid/widget/CheckBox;

.field final synthetic val$syncWiFiB:Landroid/widget/CheckBox;

.field final synthetic val$urlEt:Landroid/widget/EditText;

.field final synthetic val$userEt:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/WebDav;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/EditText;Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
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

    .line 168
    iput-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$5;->this$0:Lcom/flyersoft/components/cloud/WebDav;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$urlEt:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$userEt:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$passEt:Landroid/widget/EditText;

    iput-object p5, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$syncProgress:Landroid/widget/CheckBox;

    iput-object p6, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$syncShelf:Landroid/widget/CheckBox;

    iput-object p7, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$syncMsg:Landroid/widget/CheckBox;

    iput-object p8, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$manulB:Landroid/widget/CheckBox;

    iput-object p9, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$syncMenuB:Landroid/widget/CheckBox;

    iput-object p10, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$syncWiFiB:Landroid/widget/CheckBox;

    iput-object p11, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$pathEt:Landroid/widget/EditText;

    iput-object p12, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$context:Landroid/content/Context;

    iput-object p13, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 8

    .line 170
    iget-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$urlEt:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 171
    iget-object p2, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$userEt:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    .line 172
    iget-object v0, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$passEt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 174
    sget-boolean v1, Lcom/flyersoft/tools/A;->syncShelf:Z

    .line 175
    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$syncProgress:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    sput-boolean v2, Lcom/flyersoft/tools/A;->syncProgress:Z

    .line 176
    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$syncShelf:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    sput-boolean v2, Lcom/flyersoft/tools/A;->syncShelf:Z

    .line 177
    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$syncMsg:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    sput-boolean v2, Lcom/flyersoft/tools/A;->showSyncMsg:Z

    .line 178
    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$manulB:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    sput-boolean v2, Lcom/flyersoft/tools/A;->syncManually:Z

    .line 179
    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$syncMenuB:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    sput-boolean v2, Lcom/flyersoft/tools/A;->syncShelfViaMenuOnly:Z

    .line 180
    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$syncWiFiB:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    sput-boolean v2, Lcom/flyersoft/tools/A;->syncBookInWiFiOnly:Z

    .line 182
    iget-object v2, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$pathEt:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 183
    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 184
    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 185
    :cond_0
    sget-object v4, Lcom/flyersoft/tools/A;->webDavBookPath:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 186
    sput-object v2, Lcom/flyersoft/tools/A;->webDavBookPath:Ljava/lang/String;

    :cond_1
    const/4 v2, 0x0

    .line 189
    invoke-static {v2}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->initWebDav(Z)Z

    move-result v3

    .line 190
    sget-object v4, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->webDavUrl:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_3

    sget-object v4, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->user:Ljava/lang/String;

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    sget-object v4, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->pass:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    goto :goto_0

    :cond_2
    const/4 v4, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v4, 0x1

    :goto_1
    if-eqz v4, :cond_4

    .line 193
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v6

    const-string v7, "webdav"

    invoke-virtual {v6, v7, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v6, "url"

    .line 194
    invoke-interface {v2, v6, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v6, "user"

    .line 195
    invoke-interface {v2, v6, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v6, "pass"

    .line 196
    invoke-static {v0}, Lcom/flyersoft/tools/T;->mySimpleEncript(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v6, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 197
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 198
    invoke-static {v5}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->initWebDav(Z)Z

    :cond_4
    if-nez v4, :cond_6

    if-nez v3, :cond_5

    .line 201
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_5

    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_5

    goto :goto_2

    .line 204
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

    if-eqz p1, :cond_7

    .line 205
    const-string p2, "UNDO"

    invoke-interface {p1, v3, p2}, Lcom/flyersoft/components/cloud/Cloud$AfterLogin;->afterLogin(ZLjava/lang/String;)V

    goto :goto_3

    .line 202
    :cond_6
    :goto_2
    iget-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$context:Landroid/content/Context;

    sget p2, Lcom/flyersoft/moonreaderp/R$string;->connect_wait:I

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 203
    iget-object p1, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$context:Landroid/content/Context;

    iget-object p2, p0, Lcom/flyersoft/components/cloud/WebDav$5;->val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

    invoke-static {p1, p2}, Lcom/flyersoft/components/cloud/WebDav;->-$$Nest$smverifyWebDav(Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    .line 207
    :cond_7
    :goto_3
    sget-boolean p1, Lcom/flyersoft/tools/A;->syncManually:Z

    if-eqz p1, :cond_8

    .line 208
    invoke-static {v5}, Lcom/flyersoft/components/DragSort/ReaderBar;->setCloudButtons(Z)V

    .line 210
    :cond_8
    sget-boolean p1, Lcom/flyersoft/tools/A;->syncShelf:Z

    if-eq v1, p1, :cond_9

    .line 211
    sget-boolean p1, Lcom/flyersoft/tools/A;->syncShelf:Z

    if-eqz p1, :cond_9

    .line 212
    invoke-static {v5}, Lcom/flyersoft/components/cloud/Sync;->doSyncShelf(Z)V

    :cond_9
    return-void
.end method
