.class Lcom/flyersoft/opds/N$4$1;
.super Ljava/lang/Object;
.source "N.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/opds/N$4;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/opds/N$4;

.field final synthetic val$header:Landroid/widget/EditText;

.field final synthetic val$ip1Edit:Landroid/widget/EditText;

.field final synthetic val$ip2Edit:Landroid/widget/EditText;

.field final synthetic val$ip3Edit:Landroid/widget/EditText;

.field final synthetic val$ip4Edit:Landroid/widget/EditText;

.field final synthetic val$portEdit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/opds/N$4;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V
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

    .line 339
    iput-object p1, p0, Lcom/flyersoft/opds/N$4$1;->this$0:Lcom/flyersoft/opds/N$4;

    iput-object p2, p0, Lcom/flyersoft/opds/N$4$1;->val$header:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/opds/N$4$1;->val$ip1Edit:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/flyersoft/opds/N$4$1;->val$ip2Edit:Landroid/widget/EditText;

    iput-object p5, p0, Lcom/flyersoft/opds/N$4$1;->val$ip3Edit:Landroid/widget/EditText;

    iput-object p6, p0, Lcom/flyersoft/opds/N$4$1;->val$ip4Edit:Landroid/widget/EditText;

    iput-object p7, p0, Lcom/flyersoft/opds/N$4$1;->val$portEdit:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 341
    iget-object p1, p0, Lcom/flyersoft/opds/N$4$1;->this$0:Lcom/flyersoft/opds/N$4;

    iget-object p1, p1, Lcom/flyersoft/opds/N$4;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x0

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_name:Ljava/lang/String;

    .line 342
    iget-object p1, p0, Lcom/flyersoft/opds/N$4$1;->this$0:Lcom/flyersoft/opds/N$4;

    iget-object p1, p1, Lcom/flyersoft/opds/N$4;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/opds/N$4$1;->val$header:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/opds/N$4$1;->val$ip1Edit:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/opds/N$4$1;->val$ip2Edit:Landroid/widget/EditText;

    .line 343
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/opds/N$4$1;->val$ip3Edit:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/opds/N$4$1;->val$ip4Edit:Landroid/widget/EditText;

    .line 344
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/opds/N$4$1;->val$portEdit:Landroid/widget/EditText;

    .line 345
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/opds"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_url:Ljava/lang/String;

    .line 346
    iget-object p1, p0, Lcom/flyersoft/opds/N$4$1;->this$0:Lcom/flyersoft/opds/N$4;

    iget-object p1, p1, Lcom/flyersoft/opds/N$4;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_username:Ljava/lang/String;

    .line 347
    iget-object p1, p0, Lcom/flyersoft/opds/N$4$1;->this$0:Lcom/flyersoft/opds/N$4;

    iget-object p1, p1, Lcom/flyersoft/opds/N$4;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_password:Ljava/lang/String;

    .line 348
    iget-object p1, p0, Lcom/flyersoft/opds/N$4$1;->this$0:Lcom/flyersoft/opds/N$4;

    iget-object p1, p1, Lcom/flyersoft/opds/N$4;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_url:Ljava/lang/String;

    sput-object p1, Lcom/flyersoft/tools/A;->last_catalog_url:Ljava/lang/String;

    .line 349
    iget-object p1, p0, Lcom/flyersoft/opds/N$4$1;->this$0:Lcom/flyersoft/opds/N$4;

    iget-object p1, p1, Lcom/flyersoft/opds/N$4;->val$act:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->addNewCatalogThread()V

    return-void
.end method
