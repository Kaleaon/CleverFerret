.class Lcom/flyersoft/moonreaderp/PrefStatusSetting$9;
.super Ljava/lang/Object;
.source "PrefStatusSetting.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefStatusSetting;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 212
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$9;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 215
    sget-boolean p1, Lcom/flyersoft/tools/A;->chapterOnTop:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    const/4 v1, 0x0

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 216
    :goto_0
    sput-boolean p2, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    .line 217
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$9;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->undernotchCb:Lcom/google/android/material/materialswitch/MaterialSwitch;

    sget-boolean v0, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/flyersoft/tools/A;->isCutoutScreen()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const/16 v1, 0x8

    :goto_1
    invoke-virtual {p2, v1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setVisibility(I)V

    if-eqz p1, :cond_3

    .line 219
    sget-boolean p1, Lcom/flyersoft/tools/A;->statusBarOnTop:Z

    sput-boolean p1, Lcom/flyersoft/tools/A;->chapterOnTop:Z

    .line 220
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$9;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->edgeRG:Landroid/widget/RadioGroup;

    sget-boolean p2, Lcom/flyersoft/tools/A;->chapterOnTop:Z

    if-nez p2, :cond_2

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->bottomRadio:I

    goto :goto_2

    :cond_2
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->topRadio:I

    :goto_2
    invoke-virtual {p1, p2}, Landroid/widget/RadioGroup;->check(I)V

    .line 221
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$9;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->-$$Nest$mafterChapterEdgeChanged(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    .line 223
    :cond_3
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$9;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->-$$Nest$msetChapterMarginVisible(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    .line 224
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$9;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->-$$Nest$mupdateStatusBarProperties(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    return-void
.end method
