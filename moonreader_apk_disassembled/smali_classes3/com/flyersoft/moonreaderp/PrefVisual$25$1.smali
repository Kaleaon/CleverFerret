.class Lcom/flyersoft/moonreaderp/PrefVisual$25$1;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual$25;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefVisual$25;

.field final synthetic val$buttonView:Landroid/widget/CompoundButton;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual$25;Landroid/widget/CompoundButton;)V
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

    .line 758
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$25$1;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$25;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$25$1;->val$buttonView:Landroid/widget/CompoundButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x0

    .line 761
    sput-boolean p1, Lcom/flyersoft/tools/A;->jianFanWord:Z

    .line 762
    sget-object p1, Lcom/luhuiguo/chinese/Converter;->TRADITIONAL:Lcom/luhuiguo/chinese/Converter;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/luhuiguo/chinese/Converter;->loadLexemicMapping(Z)V

    .line 763
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$25$1;->this$1:Lcom/flyersoft/moonreaderp/PrefVisual$25;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefVisual$25;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$25$1;->val$buttonView:Landroid/widget/CompoundButton;

    check-cast p2, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->jian2FanToggle(Lcom/google/android/material/materialswitch/MaterialSwitch;)V

    return-void
.end method
