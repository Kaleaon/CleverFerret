.class Lcom/flyersoft/components/cloud/Ftp$5;
.super Ljava/lang/Object;
.source "Ftp.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

.field final synthetic val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$manulB:Landroid/widget/CheckBox;

.field final synthetic val$passEt:Landroid/widget/EditText;

.field final synthetic val$pathEt:Landroid/widget/EditText;

.field final synthetic val$portEt:Landroid/widget/EditText;

.field final synthetic val$syncMenuB:Landroid/widget/CheckBox;

.field final synthetic val$syncMsg:Landroid/widget/CheckBox;

.field final synthetic val$syncProgress:Landroid/widget/CheckBox;

.field final synthetic val$syncShelf:Landroid/widget/CheckBox;

.field final synthetic val$syncWiFiB:Landroid/widget/CheckBox;

.field final synthetic val$urlEt:Landroid/widget/EditText;

.field final synthetic val$userEt:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Ftp;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/EditText;Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V
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
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 261
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$5;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iput-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$urlEt:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$userEt:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$passEt:Landroid/widget/EditText;

    iput-object p5, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$portEt:Landroid/widget/EditText;

    iput-object p6, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$syncProgress:Landroid/widget/CheckBox;

    iput-object p7, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$syncShelf:Landroid/widget/CheckBox;

    iput-object p8, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$syncMsg:Landroid/widget/CheckBox;

    iput-object p9, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$manulB:Landroid/widget/CheckBox;

    iput-object p10, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$syncMenuB:Landroid/widget/CheckBox;

    iput-object p11, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$syncWiFiB:Landroid/widget/CheckBox;

    iput-object p12, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$pathEt:Landroid/widget/EditText;

    iput-object p13, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$context:Landroid/content/Context;

    iput-object p14, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 9

    .line 263
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$urlEt:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 264
    iget-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$userEt:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    .line 265
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$passEt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 268
    :try_start_0
    iget-object v1, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$portEt:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/16 v1, 0x15

    .line 273
    :goto_0
    sget-boolean v2, Lcom/flyersoft/tools/A;->syncShelf:Z

    .line 274
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$syncProgress:Landroid/widget/CheckBox;

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    sput-boolean v3, Lcom/flyersoft/tools/A;->syncProgress:Z

    .line 275
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$syncShelf:Landroid/widget/CheckBox;

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    sput-boolean v3, Lcom/flyersoft/tools/A;->syncShelf:Z

    .line 276
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$syncMsg:Landroid/widget/CheckBox;

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    sput-boolean v3, Lcom/flyersoft/tools/A;->showSyncMsg:Z

    .line 277
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$manulB:Landroid/widget/CheckBox;

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    sput-boolean v3, Lcom/flyersoft/tools/A;->syncManually:Z

    .line 278
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$syncMenuB:Landroid/widget/CheckBox;

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    sput-boolean v3, Lcom/flyersoft/tools/A;->syncShelfViaMenuOnly:Z

    .line 279
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$syncWiFiB:Landroid/widget/CheckBox;

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    sput-boolean v3, Lcom/flyersoft/tools/A;->syncBookInWiFiOnly:Z

    .line 281
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$pathEt:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 282
    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 283
    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 284
    :cond_0
    sget-object v5, Lcom/flyersoft/tools/A;->ftpBookPath:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 285
    sput-object v3, Lcom/flyersoft/tools/A;->ftpBookPath:Ljava/lang/String;

    .line 288
    :cond_1
    iget-object v3, p0, Lcom/flyersoft/components/cloud/Ftp$5;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/flyersoft/components/cloud/Ftp;->initConfig(Z)Z

    move-result v3

    .line 289
    sget-object v5, Lcom/flyersoft/components/cloud/Ftp;->ftpUrl:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_3

    sget-object v5, Lcom/flyersoft/components/cloud/Ftp;->user:Ljava/lang/String;

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    sget-object v5, Lcom/flyersoft/components/cloud/Ftp;->pass:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    sget v5, Lcom/flyersoft/components/cloud/Ftp;->port:I

    if-eq v1, v5, :cond_2

    goto :goto_1

    :cond_2
    const/4 v5, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    const/4 v5, 0x1

    :goto_2
    if-eqz v5, :cond_4

    .line 292
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v7

    const-string v8, "ftp"

    invoke-virtual {v7, v8, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v7, "url"

    .line 293
    invoke-interface {v4, v7, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v7, "user"

    .line 294
    invoke-interface {v4, v7, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v7, "pass"

    .line 295
    invoke-static {v0}, Lcom/flyersoft/tools/T;->mySimpleEncript(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v4, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v7, "port"

    .line 296
    invoke-interface {v4, v7, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 297
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 299
    sput-object p1, Lcom/flyersoft/components/cloud/Ftp;->ftpUrl:Ljava/lang/String;

    .line 300
    sput-object p2, Lcom/flyersoft/components/cloud/Ftp;->user:Ljava/lang/String;

    .line 301
    sput-object v0, Lcom/flyersoft/components/cloud/Ftp;->pass:Ljava/lang/String;

    .line 302
    sput v1, Lcom/flyersoft/components/cloud/Ftp;->port:I

    :cond_4
    if-nez v5, :cond_6

    if-nez v3, :cond_5

    .line 305
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_5

    invoke-static {p2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_5

    goto :goto_3

    .line 309
    :cond_5
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

    if-eqz p1, :cond_7

    .line 310
    const-string p2, "UNDO"

    invoke-interface {p1, v3, p2}, Lcom/flyersoft/components/cloud/Cloud$AfterLogin;->afterLogin(ZLjava/lang/String;)V

    goto :goto_4

    .line 307
    :cond_6
    :goto_3
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$5;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$context:Landroid/content/Context;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->connect_wait:I

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/components/cloud/Ftp;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;

    .line 308
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Ftp$5;->this$0:Lcom/flyersoft/components/cloud/Ftp;

    iget-object p2, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$context:Landroid/content/Context;

    iget-object v0, p0, Lcom/flyersoft/components/cloud/Ftp$5;->val$afterLogin:Lcom/flyersoft/components/cloud/Cloud$AfterLogin;

    invoke-static {p1, p2, v0}, Lcom/flyersoft/components/cloud/Ftp;->-$$Nest$mverifyFtp(Lcom/flyersoft/components/cloud/Ftp;Landroid/content/Context;Lcom/flyersoft/components/cloud/Cloud$AfterLogin;)V

    .line 312
    :cond_7
    :goto_4
    sget-boolean p1, Lcom/flyersoft/tools/A;->syncManually:Z

    if-eqz p1, :cond_8

    .line 313
    invoke-static {v6}, Lcom/flyersoft/components/DragSort/ReaderBar;->setCloudButtons(Z)V

    .line 315
    :cond_8
    sget-boolean p1, Lcom/flyersoft/tools/A;->syncShelf:Z

    if-eq v2, p1, :cond_9

    .line 316
    sget-boolean p1, Lcom/flyersoft/tools/A;->syncShelf:Z

    if-eqz p1, :cond_9

    .line 317
    invoke-static {v6}, Lcom/flyersoft/components/cloud/Sync;->doSyncShelf(Z)V

    :cond_9
    return-void
.end method
