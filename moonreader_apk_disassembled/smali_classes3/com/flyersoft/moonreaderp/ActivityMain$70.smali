.class Lcom/flyersoft/moonreaderp/ActivityMain$70;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->doTextPasswordCheck()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/EditText;)V
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

    .line 6687
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$70;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$70;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 6689
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$70;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Lcom/flyersoft/tools/A;->startPassword:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 6690
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$70;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p1, p2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$70;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->password_incorrect:I

    .line 6691
    invoke-virtual {p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/4 p2, 0x0

    .line 6692
    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance p2, Lcom/flyersoft/moonreaderp/ActivityMain$70$2;

    invoke-direct {p2, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$70$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$70;)V

    .line 6693
    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance p2, Lcom/flyersoft/moonreaderp/ActivityMain$70$1;

    invoke-direct {p2, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$70$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$70;)V

    const v0, 0x104000a

    .line 6697
    invoke-virtual {p1, v0, p2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 6701
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    :cond_0
    const/4 p1, 0x1

    .line 6703
    sput-boolean p1, Lcom/flyersoft/tools/A;->passwordOK:Z

    .line 6704
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$70;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mdo_onCreate(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    .line 6705
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$70;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceUpdateMainPager(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method
