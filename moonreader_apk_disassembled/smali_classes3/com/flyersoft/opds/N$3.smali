.class Lcom/flyersoft/opds/N$3;
.super Ljava/lang/Object;
.source "N.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/opds/N;->addNewCatalog(Lcom/flyersoft/moonreaderp/ActivityMain;ZLjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$nameEdit:Landroid/widget/EditText;

.field final synthetic val$siteImage:Landroid/widget/ImageView;

.field final synthetic val$urlEdit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/ImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 309
    iput-object p1, p0, Lcom/flyersoft/opds/N$3;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/opds/N$3;->val$nameEdit:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/opds/N$3;->val$urlEdit:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/flyersoft/opds/N$3;->val$siteImage:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 312
    iget-object p1, p0, Lcom/flyersoft/opds/N$3;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/opds/N$3;->val$nameEdit:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_name:Ljava/lang/String;

    .line 313
    iget-object p1, p0, Lcom/flyersoft/opds/N$3;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/opds/N$3;->val$urlEdit:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_url:Ljava/lang/String;

    .line 314
    iget-object p1, p0, Lcom/flyersoft/opds/N$3;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x0

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_username:Ljava/lang/String;

    .line 315
    iget-object p1, p0, Lcom/flyersoft/opds/N$3;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_password:Ljava/lang/String;

    .line 316
    iget-object p1, p0, Lcom/flyersoft/opds/N$3;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/opds/N$3;->val$siteImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/flyersoft/opds/N$3;->val$siteImage:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string p2, ""

    :goto_0
    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_image:Ljava/lang/String;

    .line 317
    iget-object p1, p0, Lcom/flyersoft/opds/N$3;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_url:Ljava/lang/String;

    sput-object p1, Lcom/flyersoft/tools/A;->last_catalog_url:Ljava/lang/String;

    .line 318
    iget-object p1, p0, Lcom/flyersoft/opds/N$3;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_url:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    const/16 p2, 0xa

    if-ge p1, p2, :cond_1

    return-void

    .line 320
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/opds/N$3;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->addNewCatalogThread()V

    return-void
.end method
