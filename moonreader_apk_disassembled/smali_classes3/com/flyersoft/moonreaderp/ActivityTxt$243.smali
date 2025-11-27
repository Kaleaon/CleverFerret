.class Lcom/flyersoft/moonreaderp/ActivityTxt$243;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->checkSysDarkMode()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$checkBox:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/CheckBox;)V
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

    .line 21620
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$243;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$243;->val$checkBox:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    const/4 p1, 0x1

    .line 21622
    sput-boolean p1, Lcom/flyersoft/tools/A;->sysDarkModeFollow:Z

    .line 21623
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$243;->val$checkBox:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    xor-int/2addr p2, p1

    sput-boolean p2, Lcom/flyersoft/tools/A;->sysDarkModeTip:Z

    .line 21624
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$243;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    iput-object v0, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->darkDiloag:Lcom/flyersoft/components/MyDialog;

    .line 21625
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$243;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p2, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->followSysDarkMode(Z)V

    return-void
.end method
