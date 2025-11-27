.class Lcom/flyersoft/opds/N$6;
.super Ljava/lang/Object;
.source "N.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/opds/N;->openLibraryEditDialog(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/opds/OpdsSite;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$library:Lcom/flyersoft/opds/OpdsSite;

.field final synthetic val$nameEdit:Landroid/widget/EditText;

.field final synthetic val$passEdit:Landroid/widget/EditText;

.field final synthetic val$siteImage:Landroid/widget/ImageView;

.field final synthetic val$sp:Landroid/content/SharedPreferences;

.field final synthetic val$urlEdit:Landroid/widget/EditText;

.field final synthetic val$userEdit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/ImageView;Lcom/flyersoft/opds/OpdsSite;Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 392
    iput-object p1, p0, Lcom/flyersoft/opds/N$6;->val$sp:Landroid/content/SharedPreferences;

    iput-object p2, p0, Lcom/flyersoft/opds/N$6;->val$nameEdit:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/opds/N$6;->val$urlEdit:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/flyersoft/opds/N$6;->val$userEdit:Landroid/widget/EditText;

    iput-object p5, p0, Lcom/flyersoft/opds/N$6;->val$passEdit:Landroid/widget/EditText;

    iput-object p6, p0, Lcom/flyersoft/opds/N$6;->val$siteImage:Landroid/widget/ImageView;

    iput-object p7, p0, Lcom/flyersoft/opds/N$6;->val$library:Lcom/flyersoft/opds/OpdsSite;

    iput-object p8, p0, Lcom/flyersoft/opds/N$6;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 396
    iget-object p1, p0, Lcom/flyersoft/opds/N$6;->val$sp:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/opds/N$6;->val$nameEdit:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "title"

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/opds/N$6;->val$nameEdit:Landroid/widget/EditText;

    .line 397
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "title_cn"

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/opds/N$6;->val$urlEdit:Landroid/widget/EditText;

    .line 398
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "main"

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/opds/N$6;->val$userEdit:Landroid/widget/EditText;

    .line 399
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "username"

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object p2, p0, Lcom/flyersoft/opds/N$6;->val$passEdit:Landroid/widget/EditText;

    .line 400
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/flyersoft/tools/A;->getEncryptText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "password"

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 401
    iget-object p2, p0, Lcom/flyersoft/opds/N$6;->val$siteImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/flyersoft/opds/N$6;->val$siteImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/flyersoft/opds/N$6;->val$library:Lcom/flyersoft/opds/OpdsSite;

    iget-object p2, p2, Lcom/flyersoft/opds/OpdsSite;->image:Ljava/lang/String;

    :goto_0
    const-string v0, "image"

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 402
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 404
    iget-object p1, p0, Lcom/flyersoft/opds/N$6;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->refreshLibraryList()V

    return-void
.end method
