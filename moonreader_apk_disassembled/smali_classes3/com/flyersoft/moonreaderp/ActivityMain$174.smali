.class Lcom/flyersoft/moonreaderp/ActivityMain$174;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->checkSysDarkMode()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$checkBox:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/CheckBox;)V
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

    .line 14271
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$174;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$174;->val$checkBox:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x1

    .line 14273
    sput-boolean p1, Lcom/flyersoft/tools/A;->sysDarkModeFollow:Z

    .line 14274
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$174;->val$checkBox:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    xor-int/2addr p1, p2

    sput-boolean p1, Lcom/flyersoft/tools/A;->sysDarkModeTip:Z

    .line 14275
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$174;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 p2, 0x0

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->darkDiloag:Lcom/flyersoft/components/MyDialog;

    .line 14276
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$174;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mfollowSysDarkMode(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method
