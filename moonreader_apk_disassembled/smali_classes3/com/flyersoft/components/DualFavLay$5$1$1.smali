.class Lcom/flyersoft/components/DualFavLay$5$1$1;
.super Ljava/lang/Object;
.source "DualFavLay.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DualFavLay$5$1;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/components/DualFavLay$5$1;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DualFavLay$5$1;Landroid/widget/EditText;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 257
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$5$1$1;->this$2:Lcom/flyersoft/components/DualFavLay$5$1;

    iput-object p2, p0, Lcom/flyersoft/components/DualFavLay$5$1$1;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 260
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$5$1$1;->this$2:Lcom/flyersoft/components/DualFavLay$5$1;

    iget-object p1, p1, Lcom/flyersoft/components/DualFavLay$5$1;->this$1:Lcom/flyersoft/components/DualFavLay$5;

    iget-object p1, p1, Lcom/flyersoft/components/DualFavLay$5;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object p2, p0, Lcom/flyersoft/components/DualFavLay$5$1$1;->val$et:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/flyersoft/components/DualFavLay;->key:Ljava/lang/String;

    sput-object p2, Lcom/flyersoft/tools/A;->dualKey:Ljava/lang/String;

    .line 261
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$5$1$1;->this$2:Lcom/flyersoft/components/DualFavLay$5$1;

    iget-object p1, p1, Lcom/flyersoft/components/DualFavLay$5$1;->this$1:Lcom/flyersoft/components/DualFavLay$5;

    iget p1, p1, Lcom/flyersoft/components/DualFavLay$5;->val$type:I

    sput p1, Lcom/flyersoft/tools/A;->dualFavType:I

    .line 262
    iget-object p1, p0, Lcom/flyersoft/components/DualFavLay$5$1$1;->this$2:Lcom/flyersoft/components/DualFavLay$5$1;

    iget-object p1, p1, Lcom/flyersoft/components/DualFavLay$5$1;->this$1:Lcom/flyersoft/components/DualFavLay$5;

    iget-object p1, p1, Lcom/flyersoft/components/DualFavLay$5;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object p2, p0, Lcom/flyersoft/components/DualFavLay$5$1$1;->this$2:Lcom/flyersoft/components/DualFavLay$5$1;

    iget-object p2, p2, Lcom/flyersoft/components/DualFavLay$5$1;->this$1:Lcom/flyersoft/components/DualFavLay$5;

    iget-object p2, p2, Lcom/flyersoft/components/DualFavLay$5;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object p2, p2, Lcom/flyersoft/components/DualFavLay;->key:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/DualFavLay;->initLay1(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 263
    iget-object p2, p0, Lcom/flyersoft/components/DualFavLay$5$1$1;->val$et:Landroid/widget/EditText;

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A;->hideKeyboard(Landroid/view/Window;Landroid/widget/EditText;)V

    return-void
.end method
