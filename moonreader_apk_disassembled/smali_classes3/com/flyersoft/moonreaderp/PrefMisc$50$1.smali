.class Lcom/flyersoft/moonreaderp/PrefMisc$50$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$50;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc$50;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$50;Landroid/widget/EditText;)V
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

    .line 1411
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$50$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$50;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$50$1;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1413
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$50$1;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->nightImageBright:I

    .line 1414
    sget p1, Lcom/flyersoft/tools/A;->nightImageBright:I

    if-gez p1, :cond_0

    const/4 p1, 0x0

    .line 1415
    sput p1, Lcom/flyersoft/tools/A;->nightImageBright:I

    .line 1416
    :cond_0
    sget p1, Lcom/flyersoft/tools/A;->nightImageBright:I

    const/16 p2, 0x64

    if-le p1, p2, :cond_1

    .line 1417
    sput p2, Lcom/flyersoft/tools/A;->nightImageBright:I

    .line 1418
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$50$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$50;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$50;->val$cb0:Landroid/widget/CheckBox;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/CheckBox;->setChecked(Z)V

    return-void
.end method
