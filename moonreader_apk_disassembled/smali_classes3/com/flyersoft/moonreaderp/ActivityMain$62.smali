.class Lcom/flyersoft/moonreaderp/ActivityMain$62;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->handle_new_catalog_need_password()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$passEdit:Landroid/widget/EditText;

.field final synthetic val$userEdit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/EditText;Landroid/widget/EditText;)V
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

    .line 5928
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$62;->val$userEdit:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$62;->val$passEdit:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 5931
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$62;->val$userEdit:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_username:Ljava/lang/String;

    .line 5932
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$62;->val$passEdit:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_password:Ljava/lang/String;

    .line 5933
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_username:Ljava/lang/String;

    const-string p2, ""

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 5934
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$62;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mshowConnectIndicator(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    .line 5935
    new-instance p1, Ljava/lang/Thread;

    new-instance p2, Lcom/flyersoft/moonreaderp/ActivityMain$62$1;

    invoke-direct {p2, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$62$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$62;)V

    invoke-direct {p1, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 5959
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    :cond_0
    return-void
.end method
