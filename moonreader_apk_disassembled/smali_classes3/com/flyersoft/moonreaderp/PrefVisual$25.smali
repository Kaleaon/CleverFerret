.class Lcom/flyersoft/moonreaderp/PrefVisual$25;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->setSytleMaterialSwitchEvents()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 738
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$25;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 741
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$25;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-boolean p2, p2, Lcom/flyersoft/moonreaderp/PrefVisual;->ignoreSwitchTmp:Z

    if-eqz p2, :cond_0

    return-void

    .line 742
    :cond_0
    sget-boolean p2, Lcom/flyersoft/tools/A;->textJian2Fan:Z

    if-eqz p2, :cond_1

    .line 743
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$25;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    check-cast p1, Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p2, p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->jian2FanToggle(Lcom/google/android/material/materialswitch/MaterialSwitch;)V

    return-void

    .line 747
    :cond_1
    sget-boolean p2, Lcom/flyersoft/tools/A;->isChinesePRC:Z

    const-string v0, "\u7b80\u7e41\u8f6c\u6362\u65f6\u662f\u5426\u540c\u65f6\u8f6c\u6362\u5e38\u89c1\u8bcd\u6c47? \u6bd4\u5982\n\n\u516c\u6587\u5305->\u516c\u4e8b\u5305\n\u8d1d\u514b\u6c49\u59c6->\u78a7\u54b8\n\n\u5176\u4e2d\u4e00\u5bf9\u591a\u7684\u8f6c\u6362(\u6bd4\u5982\u53d1\u5b57)\u53ef\u80fd\u65e0\u6cd5\u51c6\u786e\u5224\u65ad\u524d\u540e\u6587:\n\n"

    if-nez p2, :cond_2

    .line 748
    invoke-static {v0}, Lcom/flyersoft/tools/miscellaneous/ChineseJianFanConvert;->convertJian2Fan(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 749
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u5934\u53d1->\u982d\u9aee\n\u53d1\u8d22->\u767c\u8ca1"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 750
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$25;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 751
    invoke-virtual {v0, p2}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefVisual$25$2;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/moonreaderp/PrefVisual$25$2;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual$25;Landroid/widget/CompoundButton;)V

    const-string v1, "\u662f"

    invoke-virtual {p2, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p2

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefVisual$25$1;

    invoke-direct {v0, p0, p1}, Lcom/flyersoft/moonreaderp/PrefVisual$25$1;-><init>(Lcom/flyersoft/moonreaderp/PrefVisual$25;Landroid/widget/CompoundButton;)V

    .line 758
    const-string p1, "\u5426"

    invoke-virtual {p2, p1, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 765
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
