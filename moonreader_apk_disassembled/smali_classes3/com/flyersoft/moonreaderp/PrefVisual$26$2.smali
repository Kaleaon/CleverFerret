.class Lcom/flyersoft/moonreaderp/PrefVisual$26$2;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual$26;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefVisual$26;

.field final synthetic val$buttonView:Landroid/widget/CompoundButton;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual$26;Landroid/widget/CompoundButton;)V
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

    .line 782
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$26$2;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$26;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$26$2;->val$buttonView:Landroid/widget/CompoundButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x1

    .line 785
    sput-boolean p1, Lcom/flyersoft/tools/A;->fanjianWord:Z

    .line 786
    sget-object p1, Lcom/luhuiguo/chinese/Converter;->SIMPLIFIED:Lcom/luhuiguo/chinese/Converter;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/luhuiguo/chinese/Converter;->loadLexemicMapping(Z)V

    .line 787
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$26$2;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$26;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefVisual$26;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$26$2;->val$buttonView:Landroid/widget/CompoundButton;

    check-cast p2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->fan2jianToggle(Lcom/google/android/material/materialswitch/MaterialSwitch;)V

    return-void
.end method
